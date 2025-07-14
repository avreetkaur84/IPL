-- Check players table schema
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'players';

-- Check matches table schema
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'matches';

-- Check match_players table schema
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'match_players';
