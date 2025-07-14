-- Matches per year
SELECT EXTRACT(YEAR FROM date) AS season, COUNT(*) 
FROM matches
GROUP BY season
ORDER BY season;

-- Top player_of_match winners
SELECT p.name, COUNT(*) as awards
FROM players p
JOIN matches m ON p.player_id = m.player_of_match
GROUP BY p.name
ORDER BY awards DESC
LIMIT 10;