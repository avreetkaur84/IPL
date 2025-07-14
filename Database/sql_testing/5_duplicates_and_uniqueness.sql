SELECT player_id, COUNT(*) 
FROM players
GROUP BY player_id
HAVING COUNT(*) > 1;

SELECT match_id, player_id, COUNT(*) 
FROM match_players
GROUP BY match_id, player_id
HAVING COUNT(*) > 1;
