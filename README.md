# Hotel Demand Planner: public demo

A scenario simulator linking flights into Abu Dhabi to hotel nights, by nationality and week (ATP 2026, DCT Abu Dhabi
challenge). Team: Nishant Mohan, Zayed Al Ahbabi, Hamdan Mueen (Khalifa University).

This repository only holds the deployment recipe. At startup the container fetches the app from a private repository
(token supplied as a secret) and serves it read-only: every page and scenario works; saving, uploads and edits are off.
