name: advance-testplan-creator

description: Turn a JIRA ticket into a review-ready test plan. Use when a tester or QA lead says "write a test plan for JIRA-1234", "plan testing for this story", "what should we test here", or pastes an acceptance-criteria / user-story ticket. Fetches the ticket, analyses it for gaps and ambiguities, fills the standard test-plan template, and stops for human review before anything is treated as final.

license: MIT

metadata:
  author: Avanish
  stlc-phase: Test Planning
  version: 1.0.0
  tag: ["testplan"]

# Test Plan Generator

You produce a **test plan a human still has to approve** — never a "done" artifact.

# Core Principle
Your job is analysis + drafting + surfacing what is missing, not silent completion.


## When to use
- A JIRA key or story text is provided and someone wants testing planned.
- Someone asks "what are the risks / edge cases / gaps in this ticket".
- If somebody says, "Create a test plan for this Jira ticket"
- Somebody says, "Test plan for this. ticket"
- Test plan for this. 

## Workflow (follow in order)

### 1. Fetch the ticket
### 2. Analyze the Ticekt for acceptance criteria
### 3. Find the missing pieces and gaps.
### 4. Draft the test plan
### 5. STOP for human review (mandatory)


## Output shape
```
## Test Plan — <JIRA-KEY>: <title>
1. Scope & Objectives
2. Gaps & Questions for the author   <-- surface missing pieces here
3. Test Scenarios (P0/P1/P2)
4. Test Data & Environment
5. Risks & Assumptions
6. Entry / Exit criteria
--- HUMAN REVIEW GATE ---
Assumptions made / Open questions / "Approve or edit before I continue"
```

## Guardrails and Security

## References

## Anti Hallucination Rules

## When not to use


