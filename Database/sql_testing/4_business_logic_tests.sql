-- Check if winner_id is not in team1 or team2
SELECT COUNT(*) FROM matches
WHERE winner_id IS NOT NULL
  AND winner_id NOT IN (team1_id, team2_id);

-- Check if player_of_match actually played in the match
SELECT COUNT(*) FROM matches m
WHERE player_of_match IS NOT NULL AND NOT EXISTS (
  SELECT 1 FROM match_players mp
  WHERE mp.match_id = m.match_id
    AND mp.player_id = m.player_of_match
);
