> "*Damn, she really leveled up that day.*"

# 📊 Phase 4: Exploratory Data Analysis (EDA) + CSV Cleanup

## 🔥 What Was This Phase About?

This was the turning point of the project where raw IPL data turned into clean, structured, and database-ready assets.
It wasn’t just data wrangling—it was **engineering clarity out of chaos**.

We performed:

* Schema-aligned column transformations
* Data type conversions (especially `DATE`)
* Mapping CSV values to database foreign keys
* Drop + Rename operations
* CLI-based `\copy` operations to PostgreSQL tables

---

## 🧬 Dataset Columns Before Cleaning

### 🏏 Players.csv

```
['ID', 'Name', 'longName', 'battingName', 'fieldingName', 'imgUrl',
 'dob', 'battingStyles', 'longBattingStyles', 'bowlingStyles',
 'longBowlingStyles', 'playingRoles', 'espn_url']
```

### 🎯 Actions Performed

| Step | Transformation                                                                                                        |
| ---- | --------------------------------------------------------------------------------------------------------------------- |
| 1️⃣  | Dropped: `ID`, `battingStyles`, `longBattingStyles`, `bowlingStyles`, `longBowlingStyles`, `playingRoles`, `espn_url` |
| 2️⃣  | Renamed: `longName ➝ name`, `Name ➝ display_name`                                                                     |
| 3️⃣  | Converted `dob` to proper `datetime.date`                                                                             |
| 4️⃣  | Ensured all final fields matched DB schema types                                                                      |
| 5️⃣  | Exported clean dataset as `cleaned_players.csv`                                                                       |

✅ **Schema-Aligned Columns:**

```python
['name', 'batting_name', 'fielding_name', 'img_url', 'dob', 'batting_style', 'bowling_style']
```

---

### 🛠️ PostgreSQL Insert Operation (Players)

```sql
\copy Players(name, batting_name, fielding_name, img_url, dob, batting_style, bowling_style)
FROM 'C:/Users/hp/Desktop/IPL/notebooks/EDA/cleaned_players.csv' DELIMITER ',' CSV HEADER;
```

✅ Result: `COPY 261`
☠️ First tried using `COPY`, got permission error
🧠 Learned difference between `COPY` vs `\copy` (server vs client-side)

---

### 🧑‍💻 Teams.csv Cleanup

Original columns:

```
['team_name', 'url', 'espn_id']
```

| Step | Transformation                                |
| ---- | --------------------------------------------- |
| 🧹   | Dropped `espn_id`                             |
| 🔁   | Renamed: `team_name ➝ name`, `url ➝ logo_url` |
| 📤   | Exported as `cleaned_team.csv`                |

Post-cleaning columns:

```
['name', 'logo_url']
```

**Insert into DB:**

```sql
\copy Teams(name, logo_url) FROM 'C:/Users/hp/Desktop/IPL/notebooks/EDA/cleaned_team.csv' DELIMITER ',' CSV HEADER;
```

✅ Result: `COPY 19`

---

## 💪 CLI + DB: First Taste of Raw Power

> "*The first time I saw my data enter the actual database through terminal—no ORM, no GUI—was a different level of rush.*"

* Directly inserted into PostgreSQL using `\copy`
* Validated schema with `\d players`, `\d teams`
* Queried data with `SELECT * FROM players LIMIT 5;`
* Used `\dt` to list tables like a true terminal ninja

---

## ⚠️ Issues Faced & Fixes

| Issue                                | Fix                                                                       |
| ------------------------------------ | ------------------------------------------------------------------------- |
| `COPY FROM` permission denied        | Used `\copy` from psql shell instead                                      |
| CLI command hanging on `ALTER TABLE` | Discovered `idle in transaction` sessions using `pg_stat_activity`        |
| `KeyError` on mapping                | Realized columns were missing after transformations                       |
| Mapping player names failed          | Detected mismatch: `player_of_match` only had names, not full names       |
| Data type mismatch                   | Fixed float `team_id`s by converting to `Int64` or using `.astype('int')` |

---

## 🧠 Key Learnings

* CLI-based DB ops give **precise control**, but come with responsibility
* Mapping values from CSV to DB **requires normalization + alignment**
* **Foreign key dependencies** force you to clean earlier tables first
* Never underestimate the impact of column naming (`name` vs `longName` 🤯)
* Hands-on practice >> watching 10 tutorials

---

## 🧑‍🚀 Personal Reflections

> "This was the phase where I didn’t feel like a student anymore—I felt like a **developer**."

* Felt the **impact of design choices**
* Faced and solved real-world issues instead of blindly copying
* CLI + Jupyter + SQL = POWER 💥

---

## 📁 Files Produced

```
notebooks/EDA/cleaned_players.csv
notebooks/EDA/cleaned_team.csv
```

---