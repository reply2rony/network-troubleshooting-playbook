# Network Troubleshooting Playbook

A step-by-step playbook for the most common network problem: "the internet / system is not working."

## How to use it
1. Read `playbook.md` from top to bottom. Do not skip steps — most network faults are found in the first three steps.
2. Run the check script for a quick first report, then follow the playbook for what the result means.
3. Write down what you tried and what changed. A fault that is not written down will be troubleshooted twice.

## What the script checks
- Can this computer reach its gateway (router)?
- Can it resolve a name (DNS) to an address?
- Can it reach a public address?
- Is a chosen port open on a chosen host? (Sample host only — replace with your own test host.)

## Safety
- Use only hosts and addresses you are allowed to test. Do not scan a network you do not manage.
- Sample addresses in this project are public test addresses, not a real workplace network.
