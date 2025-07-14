
# 🏏 IPL Insights Dashboard - Wireframe (Built with Next.js)

A full-fledged IPL analytics dashboard project powered by historical data from Kaggle. This wireframe outlines the structure, pages, and features of the project.

---

## 🧭 Navbar (Sticky, Responsive)

```
[Logo]  |  [Seasons] [Teams] [Players] [RCB Special] [About]
```

---

## 1️⃣ Home Page (`/`) – IPL Overview

```
-----------------------------------------------------
| 🏆 IPL Champions Timeline (2008 - 2024) [Graph]   |
| 📊 Top Batsmen (Orange Cap by year) [Chart]       |
| 🎯 Top Bowlers (Purple Cap by year) [Chart]       |
| 🌐 Interactive Filters: Season | Team             |
| 🔍 Search any player or match                     |
-----------------------------------------------------
```

---

## 2️⃣ Seasons Page (`/seasons`)

```
-----------------------------------------------------
| ⬅️ Select Season: 2008 🔽                          |
-----------------------------------------------------
| 🏆 Champion: CSK                                  |
| ⚔️ Teams Standing Table                           |
| 🧍 Player of the Tournament                       |
| 🔥 Most Runs | Most Wickets                       |
| 🗓️ All Matches List (Clickable → Match Page)     |
-----------------------------------------------------
```

---

## 3️⃣ Teams Page (`/teams`)

```
-----------------------------------------------------
| 🧠 Select Team: 🔽 (RCB, MI, CSK, ...)             |
-----------------------------------------------------
| 📊 Win-Loss per season graph                      |
| 🧍 Best Batsmen | 🏏 Best Bowlers                  |
| 🗺️ Venue-wise stats                               |
| 🎯 Head-to-head vs other teams                    |
-----------------------------------------------------
```

---

## 4️⃣ Players Page (`/players`)

```
-----------------------------------------------------
| 🔍 Search Player: "Virat Kohli"                   |
-----------------------------------------------------
| 🏏 Total Runs, 100s, 50s, SR                      |
| 🎯 Dismissals, Favorite Venues                    |
| 📈 Graph: Season-wise performance                 |
-----------------------------------------------------
```

---

## 🏆 RCB Special Page (`/rcb`)

> 🔥 Your passion page. Make it iconic.

```
-----------------------------------------------------
| 🎥 RCB Tribute Banner (2025 Win)                  |
| 🧾 All Seasons' Standings (Highlight best years)  |
| 🧍 Kohli Career Tracker (With charts)             |
| 💥 Iconic Matches - Cards + Stats                 |
| 📈 RCB Match Win % by Season                      |
| 🎊 Final 2025 Recap (Manual / Visual)             |
-----------------------------------------------------
```

---

## 📄 About Page (`/about`)

```
-----------------------------------------------------
| 🧠 Built by Avreet (For the Love of Cricket)      |
| 📦 Tech Stack                                     |
| 🗂️ Dataset Info & Attribution                     |
-----------------------------------------------------
```

---

## ✅ BONUS FEATURES

| Feature               | Description                              |
|----------------------|------------------------------------------|
| 🌓 Dark Mode         | Tailwind + useTheme() toggle              |
| 🔍 Fuzzy Search      | Search players & matches with debounce    |
| 🔄 Lazy Load         | For large delivery dataset                |
| 📱 Responsive Design | Fully mobile-friendly                     |
| ⚡ Static + ISR       | Pre-render data-heavy routes              |

---

## 📁 Suggested Folder Structure

```
/data (JSONs)
/pages
  index.tsx
  /seasons
  /teams
  /players
  /rcb
/components
  Navbar.tsx
  PlayerCard.tsx
  Graphs/
/lib (utils)
/public (logos, banners)
```
