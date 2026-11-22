#!/usr/bin/env bash
# Fetch a JIRA issue as JSON. Usage: ./fetch_jira.sh VOC-1234
# Needs env: JIRA_BASE_URL (e.g. https://yourco.atlassian.net), JIRA_EMAIL, JIRA_TOKEN
# ponytail: curl + jq, no SDK. Add pagination/attachments only if a ticket needs it.
set -euo pipefail

KEY="${1:?usage: fetch_jira.sh <ISSUE-KEY>}"
: "${JIRA_BASE_URL:?set JIRA_BASE_URL}"
: "${JIRA_EMAIL:?set JIRA_EMAIL}"
: "${JIRA_TOKEN:?set JIRA_TOKEN}"

for cmd in curl jq; do
  command -v "$cmd" >/dev/null 2>&1 || { echo "error: '$cmd' is required but not installed" >&2; exit 1; }
done

if [[ ! "$KEY" =~ ^[A-Za-z][A-Za-z0-9_]*-[0-9]+$ ]]; then
  echo "error: '$KEY' does not look like a JIRA key (e.g. VOC-1234)" >&2
  exit 1
fi

BASE="${JIRA_BASE_URL%/}"

# --fail-with-body: non-2xx (401, 404, ...) exits non-zero instead of piping an error page into jq.
RESPONSE="$(curl -sS --fail-with-body -u "${JIRA_EMAIL}:${JIRA_TOKEN}" \
  -H "Accept: application/json" \
  "${BASE}/rest/api/3/issue/${KEY}?fields=summary,description,issuetype,priority,components,labels,fixVersions,issuelinks,attachment")" || {
  echo "error: failed to fetch ${KEY} from ${BASE}" >&2
  [[ -n "${RESPONSE:-}" ]] && echo "$RESPONSE" >&2
  exit 1
}

echo "$RESPONSE" | jq '{
    key: .key,
    summary: .fields.summary,
    type: .fields.issuetype.name,
    priority: .fields.priority.name,
    components: [.fields.components[]?.name],
    labels: (.fields.labels // []),
    fixVersions: [.fields.fixVersions[]?.name],
    description: .fields.description,
    links: [.fields.issuelinks[]? | {type: .type.name, key: (.outwardIssue.key // .inwardIssue.key)}],
    attachments: [.fields.attachment[]? | .filename]
  }'
