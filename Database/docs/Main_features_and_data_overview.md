# 🏏 IPL Insights Dashboard — Project Overview (MVP Phase)

## 🔥 Main Goal (MVP Phase)

Build a clean, fast, and insightful dashboard that showcases:
- Match results and basic info
- Team standings and win stats
- Top player performances (runs, wickets)
- Season-wise overview

## 💡 Core Features (MVP)

- View list of IPL matches with team names, winner, and date
- Filter matches by season/year or team
- View top run-scorers and wicket-takers
- Simple team win/loss summary
- Lightweight and fast (no delivery-level data)

---

## 🛠️ Database Schema (PostgreSQL)

### 1. `matches`

| Column           | Type      | Description                          |
|------------------|-----------|--------------------------------------|
| `match_id`       | INT (PK)  | Unique ID for match                  |
| `season`         | INT       | Year of the IPL season               |
| `date`           | DATE      | Match date                           |
| `team1_id`       | FK        | First team ID                        |
| `team2_id`       | FK        | Second team ID                       |
| `venue`          | TEXT      | Match location                       |
| `winner_id`      | FK        | Winning team ID                      |
| `win_by_runs`    | INT       | Margin of win (runs)                 |
| `win_by_wickets` | INT       | Margin of win (wickets)              |
| `player_of_match_id` | FK    | Player who won 'Player of the Match'|

---

### 2. `teams`

| Column     | Type      | Description             |
|------------|-----------|-------------------------|
| `team_id`  | INT (PK)  | Unique ID for each team |
| `name`     | TEXT      | Full team name          |
| `short_name`| TEXT     | Abbreviation (e.g., RCB)|

---

### 3. `players`

| Column     | Type      | Description             |
|------------|-----------|-------------------------|
| `player_id`| INT (PK)  | Unique ID for player    |
| `name`     | TEXT      | Full player name        |
| `country`  | TEXT      | Country name (optional) |

---

### 4. `player_match_stats`

| Column            | Type      | Description                         |
|-------------------|-----------|-------------------------------------|
| `id`              | INT (PK)  | Stat entry ID                       |
| `match_id`        | FK        | Associated match                    |
| `player_id`       | FK        | Player ID                           |
| `team_id`         | FK        | Team of the player for that match   |
| `runs_scored`     | INT       | Total runs scored                   |
| `balls_faced`     | INT       | Balls faced                         |
| `fours`           | INT       | Number of 4s hit                    |
| `sixes`           | INT       | Number of 6s hit                    |
| `wickets`         | INT       | Wickets taken (if bowler)           |
| `overs_bowled`    | FLOAT     | Overs bowled                        |
| `runs_conceded`   | INT       | Runs conceded while bowling         |
| `is_player_of_match` | BOOLEAN| True if got 'Player of the Match'   |

---

## 📂 Data You Need to Collect (CSV Files)

### 1. `matches.csv`
Contains:
- Match ID
- Date
- Season (Year)
- Team1 name
- Team2 name
- Venue
- Winner
- Win by runs/wickets
- Player of match name

### 2. `teams.csv`
Contains:
- Team name
- Short code (e.g., RCB, MI)

### 3. `players.csv`
Contains:
- Player name
- Country (if available)

### 4. `player_match_stats.csv`
Contains:
- Match ID
- Player name
- Team name
- Runs scored
- Balls faced
- Fours
- Sixes
- Wickets
- Overs bowled
- Runs conceded
- Is player of the match (yes/no)

---

## 📅 Next Steps

1. Collect the 4 CSV files listed above
2. Clean and standardize the data (especially names & team IDs)
3. Prepare table creation SQL for PostgreSQL
4. Use Python (Pandas + psycopg2 or SQLAlchemy) to load data