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
    logo_url text NOT NULL
);

CREATE TABLE Matches (
    match_id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    venue VARCHAR(500) NOT NULL,
    city VARCHAR(100) NOT NULL,
    team1_id INT REFERENCES Teams(team_id), -- it is goign to be foreign key - team_id
    team2 INT REFERENCES Teams(team_id),
    toss_winner_id INT REFERENCES Teams(team_id), -- team_id -> not sure what to write
    toss_decision , -- we can give enum here, as deciso can be either bating or bowling
    match_result , -- what should we write in this, what details not sure
    player_of_match INT, -- WE CAN HAVE PLAY_ID HERE 
);

-- info written in match data
-- match_number,team1,team2,match_date,toss_winner,toss_decision,result,eliminator,winner,player_of_match,venue,city,team1_players,team2_players
--335988,Deccan Chargers,Delhi Daredevils,2008-04-22,Deccan Chargers,bat,Win,NA,Delhi Daredevils,V Sehwag,"Rajiv Gandhi International Stadium, Uppal",Hyderabad,"AC Gilchrist, Y Venugopal Rao, VVS Laxman, A Symonds, RG Sharma, Shahid Afridi, SB Bangar, AS Yadav, WPUJC Vaas, RP Singh, PP Ojha","G Gambhir, V Sehwag, S Dhawan, Shoaib Malik, KD Karthik, MK Tiwary, R Bhatia, MF Maharoof, Mohammad Asif, VY Mahesh, GD McGrath"