---
description: Claim a GitHub issue, implement it, and open a PR
---
Issue number: $ARGUMENTS

1. Run `gh issue view $ARGUMENTS` and read the "Done means" line. If there is none, stop and ask me.
2. Run `gh issue edit $ARGUMENTS --add-assignee @me` so nobody else starts it.
3. Read only the docs/context.md sections the issue references.
4. Implement the smallest change that meets "Done means". Write or update tests.
5. Run the checks (`cargo test` in contracts/route_ledger, `npm run build` and `npm run lint` in app/).
6. Commit, push the branch, and run `gh pr create --fill --body "Closes #$ARGUMENTS"`.
7. Summarize what changed and anything blocked in 3 lines.
