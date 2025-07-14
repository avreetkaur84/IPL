# 🏏 IPL Dashboard — Project Vision and Feature Roadmap

## 🎯 Project Goal

Build a full-stack, data-driven IPL Dashboard using PostgreSQL, Next.js (App Router), and Recharts — capable of delivering actionable match insights, player trends, team evolution, and smart analytics.

---

## 🔹 Layer 1: Data Exploration + Insights (Backend Engine)

### ✅ Core REST API Endpoints

| Endpoint                           | Description                                       |
| ---------------------------------- | ------------------------------------------------- |
| `/api/players`                     | All players list, filterable by team, role, style |
| `/api/player/:id`                  | Full player profile, participation history        |
| `/api/matches?team=MI&year=2021`   | Matches played by MI in 2021                      |
| `/api/team/:id/squad?season=2019`  | Squad info for a specific team and season         |
| `/api/player-of-match/leaderboard` | Top impactful players based on PoM awards         |
| `/api/toss-analysis`               | Impact of toss decisions on match outcomes        |
| `/api/head-to-head/:team1/:team2`  | Historical H2H stats between two teams            |
| `/api/venue/analysis`              | Venue performance across teams                    |

### 🔧 Backend Skill Highlights:

* SQL joins, grouping, aggregations
* Advanced query filtering
* Modular query/controller architecture
* Clean REST design with pagination, error handling

---

## 🔸 Layer 2: Frontend Visualization Dashboard (Next.js + Tailwind + Recharts)

### 📄 UI Pages & Components

| Page                 | Features                                          |
| -------------------- | ------------------------------------------------- |
| `Home`               | Highlights (Top performer, venue stats, fun fact) |
| `Players`            | List + filters + dynamic routing to profiles      |
| `Teams`              | Overview + Squad over time + win/loss trends      |
| `Matches`            | Filter by team, season, venue; match cards        |
| `Player Profile`     | Timeline view, PoM history, team journey          |
| `Insights Dashboard` | Graphs: toss win %, team performance, venue bias  |

### 🛠️ UI Stack

* **Next.js App Router** (with API Routes)
* **Tailwind CSS** for responsive layout
* **Recharts** or `chart.js` for visual analytics
* Reusable card/table/chart components

---

## 🔺 Layer 3: Smart & Unique Features (Portfolio-Boosting Enhancements)

### 🚀 Optional Advanced Additions

| Feature              | What It Does                                        |
| -------------------- | --------------------------------------------------- |
| Squad Predictor      | Suggests best playing XI based on past combinations |
| Toss Bias Visualizer | Graph showing toss patterns & win effects           |
| Player Timeline      | Player journey across teams/seasons with POMs       |
| Team Stability Score | Measures and compares lineup consistency            |
| Venue Explorer Map   | Static map view of venue dominance by team          |

---

## 💼 Resume Highlights This Project Covers

* PostgreSQL with complex query logic
* REST API development with production structure
* Modern React frontend with App Router
* Visualizations using charts and responsive design
* Complete full-stack integration and modular planning

---

## ✅ MVP Feature Checklist

| Area          | Features                                         |
| ------------- | ------------------------------------------------ |
| Player        | List, filter, profile with match history         |
| Matches       | Team & season-wise match explorer                |
| Teams         | Squad, performance trend, PoM counts             |
| Insights      | Venue stats, toss impact, H2H analysis           |
| Smart Add-ons | (Any one) Toss bias / Timeline / Squad predictor |

---

## 📘 Project Stack

* **Backend**: PostgreSQL, Node (via Next.js API Routes)
* **Frontend**: Next.js 14 App Router, TailwindCSS, Recharts
* **Data Prep**: Jupyter + Pandas (pre-processed offline)
* **Deployment**: (optional) Vercel + Railway or Supabase

---