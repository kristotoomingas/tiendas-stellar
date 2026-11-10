# tiendas-stellar

Read docs/context.md first (sections relevant to your issue). It is the source of truth.

## Rules
- Work on ONE GitHub issue per session. Stay inside the files that issue needs.
- Branch is already created (NN-slug). Never commit to main. Never force-push.
- Small PR, body ends with "Closes #NN". Include screenshots for UI, test output for contract.
- Rebase on origin/main before opening the PR: git fetch origin && git rebase origin/main
- Do not redeploy the contract or edit config/testnet.json unless the issue says so.
  Contract IDs change on deploy, and only the deploy owner (Yahya) does that.
- NEVER read, print, or commit .env* files or any Stellar secret key (starts with S).
- Contract: Rust in contracts/route_ledger, spec in docs/context.md section 8.2. Run `cargo test` before PR.
- App: Next.js + TS + Tailwind, Spanish UI, mobile-first (360px). All data via app/lib/api.ts.
- Done = tests pass, PR open, "Done means" line from the issue is met.
- Any change touching cash-in or cash-out must also update the Risk #1 notes (docs/context.md section 6).
- Screens say "dólares digitales", never blockchain, wallet or crypto (docs/context.md section 3.5).
  A small "Ver detalles" link may show it is USDC on Stellar.
