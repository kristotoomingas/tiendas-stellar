# Credit model (proposal)

> **Status: proposal by Rohan, waiting for Yahya's approval.** Nothing here changes the contract or the plan until this PR is approved and merged. Numbers marked **(guess)** are placeholders until interviews (#7) give real ones.

How "pay in 7 days" decides who gets credit, how much, and what happens when someone pays late. Think of it as a level system: everyone starts small, levels up by paying on time, and drops levels for paying late.

## 1. Goals
- Losses stay below the **0.75% default buffer** per 7-day cycle.
- Rules are simple enough to put in the contract and explain to a shop owner in one sentence.
- A fake or dishonest shop can only ever take a little.

## 2. Who gets credit on day one
All of these:
- On a distributor's route for **3+ months, with 8+ deliveries** (the distributor already has this history) **(guess)**.
- Owner's DUI checked by the licensed partner (KYC). **One credit line per DUI.**
- Not overdue anywhere on the system.
- Optional: the distributor vouches and shares the loss (option 2 in context §5).

## 3. Starting limit
**Limit = the lower of $200 and one average delivery.** A shop that usually buys $120 a week starts at $120, so no one gets more credit than they normally buy.

## 4. Levelling up
- **+$25 per on-time repayment, up to $500** (already in the design, context §16).
- Later, only with real data: the cap rises to $750 after 6 months with no late payments **(guess)**.

## 5. Late-payment ladder

| Days late | What happens |
|---|---|
| Day 8 | Overdue: no new credit (already in the design) |
| Paid within 3 days | Unfrozen, but the limit drops one level (−$25) |
| 4–14 days late | Limit resets to the start |
| 15–30 days late | Credit off; every distributor sees it |
| 30+ days | Default: the buffer covers it; any later payment goes back into the buffer |

## 6. Fraud controls
- Only shops the truck actually visits can get credit.
- Cash payments need two taps (driver and shop).
- One DUI, one credit line, shared across distributors.
- Alarm: a burst of new shops on one route in one week gets reviewed.
- Credit is stock, not cash, so there is less to steal.

## 7. Exposure caps
- One distributor's shops: at most **25%** of the pool **(guess)**.
- Shops in their first 2 months: at most **20%** of credit outstanding **(guess)**.
- A hard cap on the total pool until we have 3 months of data.

## 8. The buffer as a dial
- **Buffer rate = observed loss rate × 1.5**, reviewed quarterly. Losses at 0.3% → buffer could drop to 0.45%; losses at 1% → it rises.
- The lender seeds the buffer at launch so it isn't empty on day one.

## 9. Stress test
1,000 shops × about $150 outstanding = **$150K** outstanding **(guess)**. Buffer in per week: 0.75% × $150K = **$1,125**.

| Scenario | Loss | Weeks of buffer |
|---|---|---|
| 1% of shops default the same week | $1,500 | ~1.3 |
| 5% default (remittance drop, storm) | $7,500 | ~7 |
| 20 fake shops at $200 | $4,000 | ~3.5 |
| A 200-shop distributor closes, half don't pay | $15,000 | ~13 |

Normal weeks are fine; a big shock needs **about $10–15K of seed money** at launch, which is why the caps in §7 exist.

## 10. What to track weekly
On-time rate; roll rates (how many 1–7 days late slide to 8–30); loss rate vs. the 0.75% buffer; how much of a default is eventually recovered; how much of the pool is actually lent out.

## 11. Demo vs. real
- **In the demo already:** $200 start, +$25 per on-time repayment, $500 cap, frozen while overdue.
- **One small addition to consider before Friday's feature freeze (Jack's call):** a late repayment drops the limit by one level.
- **Pitch only, not built:** eligibility checks, the ladder past day 8, exposure caps, the buffer dial, the stress test.

## 12. Questions for interviews (#7)
- How many shops on a route never pay their *fiado* today, and how much gets recovered?
- How often do shops pay late, and by how many days?
- How big is a typical delivery?
