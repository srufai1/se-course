# Course plan

Each module follows the same steps:

1. **Learn** the idea with small exercises.
2. **See it in GPIS**: read where the real system uses it.
3. **Build** it in `mini-sms/`.
4. **Interview**: answer the module's questions out loud, then in writing.
5. **Check**: run the module's check scripts until they all print `PASS`.

Starting level: terminal basics. Everything else starts from zero.

## Month 1: tools and the web

| Week | Module | Done when |
| :--- | :--- | :--- |
| 1 | 01 Git and GitHub | `modules/01-git/checks` all PASS; this repo pushed to GitHub |
| 2 | 02 How the web works (HTTP, URLs, DNS), HTML | School home page in `mini-sms/` |
| 3 | 03 CSS, mobile-first layout at 360px | Home, About and Classes pages look right on a phone |
| 4 | 04 JavaScript basics, the DOM, events | A searchable class list (search "Adu O. Godfred" works) |

## Month 2: TypeScript and React

| Week | Module |
| :--- | :--- |
| 5 | 05 TypeScript: types, functions, objects |
| 6 | 06 React: components, props, state |
| 7 | 07 React: lists, forms, effects |
| 8 | 08 UI/UX: touch targets, contrast, accessibility, empty and error states |

## Month 3: databases

| Week | Module |
| :--- | :--- |
| 9 | 09 SQL: SELECT, WHERE, ORDER BY, JOIN |
| 10 | 10 Modelling: keys, constraints, one-to-many, many-to-many |
| 11 | 11 PostgreSQL: transactions, indexes, ranking with window functions |
| 12 | 12 The temporal model: why a student has no `class_id` (GPIS D-19 to D-23) |

## Month 4: backend

| Week | Module |
| :--- | :--- |
| 13 | 13 Next.js: server components, routes, server actions |
| 14 | 14 APIs: request, response, status codes, validation (Zod) |
| 15 | 15 Sign-in: sessions, JWT, Supabase Auth |
| 16 | 16 Roles and authorisation (why `app_metadata`, never `user_metadata`) |

## Month 5: security, testing, debugging

| Week | Module |
| :--- | :--- |
| 17 | 17 Row-Level Security, deny by default |
| 18 | 18 OWASP Top 10, the most common web security risks, with GPIS examples |
| 19 | 19 Testing: unit, integration, end-to-end |
| 20 | 20 Debugging: observe, isolate, test, prove, document |

## Month 6: shipping and design

| Week | Module |
| :--- | :--- |
| 21 | 21 Deployment: environments, Vercel, migrations |
| 22 | 22 CI with GitHub Actions |
| 23 | 23 System design: caching, the Back-button bug (GPIS D-246) |
| 24 | 24 System design: a money ledger that never edits history |

## Month 7: interviews

| Week | Module |
| :--- | :--- |
| 25 | 25 Algorithms: arrays, hash maps, sorting, competition ranking |
| 26 | 26 Fees and payments in mini-sms |
| 27 | 27 Security review of my own app |
| 28 | 28 Portfolio write-up and mock interviews |

Algorithm practice also runs for 1 hour a week from Month 3, taken from the Review session.
