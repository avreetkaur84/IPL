SELECT match_id FROM matches 
WHERE team1_id NOT IN (SELECT team_id FROM teams)
   OR team2_id NOT IN (SELECT team_id FROM teams);

-- Check invalid player_id
SELECT * FROM match_players 
WHERE player_id NOT IN (SELECT player_id FROM players);
