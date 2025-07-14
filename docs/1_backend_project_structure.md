# `BACKEND STRUCTURE`

```
ipl-dashboard/
├── app/
│   ├── api/
│   │   ├── players/
│   │   │   └── route.js            # API route: /api/players
│   │   ├── matches/
│   │   │   └── route.js            # API route: /api/matches
│   │   └── teams/
│   │       └── route.js            # API route: /api/teams
├── lib/
│   ├── db.js                       # PostgreSQL connection setup
│   └── queries/
│       ├── players.js              # SQL for players
│       ├── teams.js                # SQL for teams
│       └── matches.js              # SQL for matches
├── controllers/
│   ├── playersController.js       # Controller logic for players
│   ├── matchesController.js       # Controller logic for matches
│   └── teamsController.js         # Controller logic for teams
├── public/                        # Static files
├── styles/
├── .env.local                     # DB credentials
├── next.config.js
├── package.json
└── README.md
```

## Summary
| Layer              | Folder         | Purpose                                        |
| ------------------ | -------------- | ---------------------------------------------- |
| Routes (API)       | `app/api/`     | Handles HTTP methods like GET, POST            |
| Controllers        | `controllers/` | Middle layer logic, validation, transformation |
| DB Queries         | `lib/queries/` | SQL queries and raw DB interactions            |
| DB Connection      | `lib/db.js`    | Pool connection using `pg`                     |
| .env Configuration | `.env.local`   | DB credentials                                 |
