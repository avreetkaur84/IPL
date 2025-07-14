CREATE TABLE Players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    fielding_name VARCHAR(100),
    batting_name VARCHAR(100),
    dob DATE NOT NULL,
    img_url text,
    batting_style VARCHAR(100),
    bowling_style VARCHAR(100)
);

CREATE TABLE Teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    logo_url text 
);

CREATE TYPE toss_decision_enum AS ENUM ('bat', 'field');
CREATE TYPE match_outcome_enum AS ENUM ('win', 'tie', 'no result');
CREATE TYPE win_type_enum AS ENUM ('runs', 'wickets');

CREATE TABLE Matches (
    match_id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    venue VARCHAR(500) NOT NULL,
    city VARCHAR(100) NOT NULL,
    team1_id INT REFERENCES Teams(team_id),
    team2 INT REFERENCES Teams(team_id),
    toss_winner_id INT REFERENCES Teams(team_id), 
    toss_decision toss_decision_enum NOT NULL, 
    outcome match_outcome_enum NOT NULL,
    winner_id INT REFERENCES Teams(team_id),
    win_margin INT,
    win_type win_type_enum,
    player_of_match INT REFERENCES Players(player_id)
);

CREATE TABLE Team_Player_Season (
    team_player_season_id SERIAL PRIMARY KEY,
    season_year INT NOT NULL,
    player_id INT REFERENCES Players(player_id),
    team_id INT REFERENCES Teams(team_id)
);

CREATE TABLE Match_Players (
    match_player_id SERIAL PRIMARY KEY,
    match_id INT REFERENCES Matches(match_id),
    team_id INT REFERENCES Teams(team_id),
    player_id INT REFERENCES Players(player_id),
    is_playing BOOLEAN DEFAULT TRUE
);


-- \copy Players(name, batting_name, fielding_name, img_url, dob, batting_style, bowling_style) FROM 'C:/Users/hp/Desktop/IPL/notebooks/EDA/cleaned_players.csv' DELIMITER ',' CSV HEADER;

-- \copy Teams(name, logo_url) FROM 'C:/Users/hp/Desktop/IPL/notebooks/EDA/cleaned_team.csv' DELIMITER ',' CSV HEADER;

-- SELECT column_name, data_type 
-- FROM information_schema.columns 
-- WHERE table_name = 'players';

ALTER TABLE players ADD COLUMN display_name VARCHAR(150);

ALTER TABLE Matches RENAME COLUMN team2 TO team2_id;


\copy Matches(date, venue, city, team1_id, team2_id, toss_winner_id, toss_decision, outcome, winner_id, win_margin, win_type, player_of_match) FROM 'C:/Users/hp/Desktop/IPL/notebooks/EDA/cleaned_matches.csv' DELIMITER ',' CSV HEADER;

ALTER TABLE Match_Players ADD COLUMN season_year INT;


UPDATED TABLE - 
CREATE TABLE Match_Players (
    match_player_id SERIAL PRIMARY KEY,
    match_id INT REFERENCES Matches(match_id),
    team_id INT REFERENCES Teams(team_id),
    player_id INT REFERENCES Players(player_id),
    is_playing BOOLEAN DEFAULT TRUE,
    season_year INT
);

DROP TABLE IF EXISTS Team_Player_Season;

\copy Match_Players(match_id, team_id, player_id, season_year, is_playing) FROM 'C:/Users/hp/Desktop/IPL/notebooks/EDA/cleaned_match_players.csv' DELIMITER ',' CSV HEADER;