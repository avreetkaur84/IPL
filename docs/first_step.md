# IPL Insights Dashboard — Project Overview & Repo Structure

---

## 1. Project Summary

This project aims to build a comprehensive IPL (Indian Premier League) Insights Dashboard by leveraging multiple IPL datasets (CSV & JSON). The focus is to:

* Design and implement a **relational database** using PostgreSQL.
* Import and clean real IPL match, team, and player data.
* Enable efficient querying for insightful reports on matches, teams, and players.
* Lay groundwork for future phases like integrating ball-by-ball data and ML analytics.

---

## 2. Data Sources

* **Match\_Info.csv** — Overall match details (teams, date, venue, result, player of match).
* **teams\_info.csv** — Metadata about IPL teams.
* **players\_details.csv** — Player profiles with batting, bowling styles, roles, and personal info.
* *(Future)* Ball\_By\_Ball\_Match\_Data.csv for granular delivery-level data.

---

## 3. Database Tables & Key Attributes

| Table Name | Key Columns (examples)                                                                         | Description                        |
| ---------- | ---------------------------------------------------------------------------------------------- | ---------------------------------- |
| matches    | match\_number, team1, team2, match\_date, toss\_winner, winner, venue, city, player\_of\_match | Stores match-level info            |
| teams      | team\_name, url, espn\_id                                                                      | Stores team metadata               |
| players    | ID, Name, battingStyles, bowlingStyles, playingRoles, dob                                      | Stores player profiles and details |

*Additional tables to be added as the project evolves.*

---

## 4. Repo Structure

```
IPL-Insights-Dashboard/
│
├── data/                    # Raw datasets (.csv, .json)
│
├── notebooks/               # Jupyter notebooks for data exploration & analysis
│
├── src/                     # Python scripts for ETL (Extract, Transform, Load) & DB interaction
│
├── docs/                    # Documentation files (.md)
│   ├── README.md            # Project overview, goals, instructions
│   ├── DATABASE_SCHEMA.md   # ER diagrams, table schemas, design decisions
│   └── PROJECT_JOURNEY.md   # Logs, challenges, reflections, TODOs
│
├── requirements.txt         # Python dependencies
│
└── .gitignore               # Files/folders to ignore in Git
```

---

## 5. Workflow Summary

1. **Clone the repo** and place datasets in `/data`.
2. **Explore data** via notebooks (`/notebooks`) to understand structures and spot inconsistencies.
3. **Write and run ETL scripts** (`/src/etl.py`) to parse, clean, and load data into PostgreSQL tables.
4. **Document everything** along the way in `/docs`.
5. **Iterate** — add more data, refine DB schema, build dashboard frontend (future).
6. **Optional**: Add ML or advanced analytics in later stages.

---

## 6. Tips for Documentation & Efficiency

* Use **clear, concise markdown files**; make them your project bible.
* Keep notebooks focused on one goal per file — exploration, cleaning, visualization.
* Automate repetitive tasks in Python scripts to save time and avoid errors.
* Log challenges and learnings in `PROJECT_JOURNEY.md` — recruiters love this insight!
* Commit often with descriptive messages — your future self will thank you.