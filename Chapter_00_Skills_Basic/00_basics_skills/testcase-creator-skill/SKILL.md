---
name: "test case creator"
description: "Based on my template, which I am going to give him, it is going to create a test cases according to my company."
version: "1.0.0"
author: "Avanish"
license: "MIT"
tags:
  - testcase
agents:
  - claude-code
  - cursor
  - github-copilot
---
# Test Case Creator
Your task is to create a test case based on the knowledge shared by the user, Make sure that you use proper templates that we have mentioned in the below comments.

## Core Principles

1. Use Information with is present or given by User Only.
2. Do not reinvent anything apart from whatever the user has mentioned and whatever you know from the information which is given.

## When to Use

- Whenever somebody has given you a PRD (which is a product requirement document) or has given you a trigger to create a test cases for this requirement, i.e. this skill.
- create a test case for x.

## Example

Follow this format for every test case: one step per row, numbered in the Step column, with the Scenario ID repeated on each row.

| Scenario ID | Step | Actions | Expected Result |
|---|---|---|---|
| TC_LOGIN_001 | 1 | Open the application login page. | Login page is displayed with **Username**, **Password** fields and **Login** button. |
| TC_LOGIN_001 | 2 | Enter a valid registered username in the **Username** field. | Username is entered and visible in the field. |
| TC_LOGIN_001 | 3 | Enter the matching valid password in the **Password** field. | Password is entered and shown masked (••••). |
| TC_LOGIN_001 | 4 | Click the **Login** button. | User is logged in successfully and redirected to the dashboard/home page. No error message is shown. |

## Output

- Should be in PDF format

## Security and Safety

1. Make sure that the output does not have the personal information or any risk related things.

