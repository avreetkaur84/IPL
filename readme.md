# 🏏 IPL Insights Dashboard

## 📌 Overview
**IPL Insights Dashboard** is a data-driven backend project designed to analyze, explore, and visualize insights from the Indian Premier League (IPL).  
It leverages PostgreSQL for relational database modeling, SQL for data management, and Python for automation — built with clean architecture and scalability in mind.

---

## 🚀 Features

- 🧠 **Normalized PostgreSQL Schema** for IPL matches, players, teams, and seasons  
- 🔄 **ETL Pipelines** to transform raw IPL CSV files into structured relational data  
- 📈 **Jupyter Notebooks** for exploratory analysis and data validation  
- 🗂️ **ER Diagram** representing all entity relationships  
- 🧱 Modular design — perfect for expanding into ML models and dashboards

---

## 📂 Data Sources

| File               | Description                                      |
|--------------------|--------------------------------------------------|
| `Match_Info.csv`   | Match-level data: date, venue, teams, outcome    |
| `teams_info.csv`   | Team metadata (name, logo, etc.)                 |
| `players_details.csv` | Player info: name, style, role, and birthdate |

> 💡 More granular ball-by-ball data to be integrated later.

---

## 🧱 Database Schema

Our schema is fully normalized and scalable. Key tables include:

- `Players`
- `Teams`
- `Matches`
- `Match_Players` (join table for match participation)
- `Team_Player_Season` (tracks seasonal team memberships)

📌 **View ER Diagram**:  
![ER Diagram](docs/er-diagram.png)

---

## 📁 Repository Structure

```bash
IPL-Insights-Dashboard/
├── data/                  # Raw IPL datasets (CSV)
├── docs/                  # ER diagram, design documents
├── notebooks/             # Data analysis notebooks (Jupyter)
├── notes/                 # Conceptual learning notes (DBMS, SQL, design)
├── sql/                   # SQL schema + insert scripts
│   ├── 01-schema.sql
│   ├── 02-load-data.sql
│   └── 03-test-queries.sql
├── .env                   # PostgreSQL credentials (not committed)
├── .gitignore             
├── readme.md              # You are here 😄
````

---

## 🛠️ Getting Started

1. **Clone the Repository**

```bash
git clone https://github.com/yourusername/IPL-Insights-Dashboard.git
```

2. **Set Up PostgreSQL**

```bash
# Create user and database manually via psql
create user ipl_user with encrypted password 'yourpassword';
create database ipl_dashboard owner ipl_user;
```

3. **Initialize the Database**

```bash
psql -U ipl_user -d ipl_dashboard -f sql/01-schema.sql
```

4. **Load the Data (Coming Soon)**

```bash
psql -U ipl_user -d ipl_dashboard -f sql/02-load-data.sql
```

5. **Explore**

* Use Jupyter notebooks in `/notebooks/` to perform queries and build visualizations.

---

## 🧠 Learning Goals

This project is also a **learning sandbox** to:

* Master real-world database design
* Understand SQL deeply through PostgreSQL
* Practice CLI-based DB operations and schema evolution
* Apply backend data modeling best practices

---

## 🛣️ Future Roadmap

* 🔎 Ball-by-ball match integration
* 📊 Build a frontend dashboard using React or Next.js
* 🤖 Add machine learning models for player ranking/prediction
* ☁️ Move database to cloud (e.g., Supabase / AWS RDS)

---

## 🤝 Contributions

PRs, ideas, feedback — all are welcome!
Let’s make this a resourceful platform for learning and IPL data exploration.

---

## 📄 License

MIT License — free to use, fork, and build upon.

---

> 🧠 *Built by Avreet — turning IPL chaos into queryable calm.*

```