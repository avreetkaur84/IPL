### 📂 `phase_4_eda_data_mapping.md`

# 📊 Phase 4: EDA + Data Cleanup + Mapping + Ingestion

## 🚀 Objective

This phase was all about bridging the gap between **raw CSV chaos** and a **fully normalized PostgreSQL database**. The goal was to:

- Perform exploratory data analysis (EDA)
- Map CSV data to the existing relational schema
- Handle nulls, type mismatches, and naming inconsistencies
- Load cleaned data into PostgreSQL using `\copy` or scripts
- Test database integrity across all main tables

---

## 📁 Datasets Used

- `players.csv`
- `teams.csv`
- `matches.csv`
- Extracted player details from team1/team2 player columns

---

## 🧠 Major Learnings

### 1. **Real-life data is MESSY**
- Player names were written in short forms like `"RV Uthappa"` or `"SR Watson"` but the database had different formats.
- Multiple naming columns like `battingName`, `fieldingName`, `longName`, and just `Name` caused serious ambiguity.
- Many missing values (`NaN`, empty cities, missing player-of-the-match).

### 2. **Jupyter + PostgreSQL = Power Combo**
- For the first time, connected PostgreSQL with Jupyter Notebook for dynamic queries and data mapping.
- Used `pandas.read_sql()` and committed back using `psycopg2`.

### 3. **PostgreSQL is strict and that's a GOOD thing**
- It rejected `18.0` as integer (`int`), which exposed float issues in our mapped ID columns.
- `NOT NULL` constraints in DB forced us to actually care about data completeness.
- `FOREIGN KEY` constraints saved us from injecting invalid player/team IDs.

---

## 🔧 Key Operations

### ✅ Added `display_name` to `Players` Table
- To allow better matching with short player names from match CSVs.
```sql
ALTER TABLE players ADD COLUMN display_name VARCHAR(150);
````

* Used `players.csv` mapping from `longName → name` and `Name → display_name`.

---

### 🧹 Cleaned and Normalized `matches.csv`

* Dropped columns like `match_number`, `team1_players`, `team2_players`.
* Mapped:

  * `team1`, `team2`, `winner`, `toss_winner` → respective `team_id`
  * `player_of_match` → `player_id`
  * `match_date` → proper `DATE` format
* Enforced int type casting for IDs
* Removed rows with missing cities or invalid values

---

### 💾 Data Ingestion Highlights

```bash
-- Matches Table
\copy Matches(date, venue, city, team1_id, team2_id, toss_winner_id, toss_decision, outcome, winner_id, win_margin, win_type, player_of_match)
FROM 'cleaned_matches.csv' DELIMITER ',' CSV HEADER;

-- Match_Players Table
\copy Match_Players(match_id, team_id, player_id, season_year, is_playing)
FROM 'cleaned_match_players.csv' DELIMITER ',' CSV HEADER;
```

* Total Matches Inserted: **1169**
* Total Match-Player Entries: **16,707**

---

## 🧱 Database Schema Finalized (So Far)

* ✅ `Players`
* ✅ `Teams`
* ✅ `Matches`
* ✅ `Match_Players` (merged concept of `Team_Player_Season`)

---

## ⚠️ Challenges Faced

| Issue                      | What Went Wrong                            | Fix                                                                       |
| -------------------------- | ------------------------------------------ | ------------------------------------------------------------------------- |
| `18.0` type mismatch       | Team IDs were float due to pandas          | Used `.astype(int)`                                                       |
| Hanging CLI                | ALTER command froze CLI                    | Identified open idle transactions using `pg_stat_activity`, canceled them |
| Player name mismatches     | `display_name` vs CSV `Name` inconsistency | Added `display_name` column and mapped using CSV                          |
| 20K+ unmatched player\_ids | Due to inconsistent abbreviations in names | Did partial fixes and accepted reduced data scope                         |
| NULLs everywhere           | city, player, toss\_winner, etc.           | Dropped rows or filled defaults carefully                                 |

---

## 📌 Notes for Future

* ⚒️ Improve name normalization — maybe build a fuzzy matching script
* 🧪 Add automated data validators before final ingestion
* 🧼 Use consistent naming conventions when designing datasets
* 💡 Consider converting `battingName` and `fieldingName` into alt\_name list fields
* 📝 Document ENUM usage in schema clearly

---

## ✅ Conclusion

This phase was an **intense backend reality check**. It taught us:

* How data *never fits perfectly* into schemas
* Why schema planning is as important as ingestion
* How PostgreSQL + Jupyter + Pandas can become a **data engineering pipeline**
* And most of all, why developers survive on caffeine ☕ and `ctrl + C` 😵‍💫

---

> “In theory, there's no difference between theory and practice. In practice, there is.” – Yogi Berra

---