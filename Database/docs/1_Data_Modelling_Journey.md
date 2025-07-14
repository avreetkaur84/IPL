# Data Modeling

## Entities Creation 

### 1. Players
This will be first table that I am thinking of creating, as one player can be part of multiple teams in different IPL seasons, so we can directly, use Player_Id as foreign key in other teams table.

#### Attributes 
    1. player_id - primary key
    2. name 
    3. fielding_name
    4. batting_name
    5. dob
    6. age - derived from dob
    7. img_url
    8. batting_style
    9. bowling_style

## There is no need to create the age attribute as it can be derived from dob, so don't store age.

### 2. Teams
Now, once players table attributes are set we can think of creating teams. But, in teams we will only write the team details and will not include players in this as one team can have different players each season.
So, this can be problem now, how will be decide which player is part of which team in different seasons?
1. We can create another table that will have teams and different seasons, and then we can add the players_id as foreign key to tell which player was part of that team in that particular season. 
    - But this approach will create redundancy in data, as one table can be with same team for many seasons consectuvely, so writing their names again and again can be expensive operation.
2. Is there really a need to even create separate table for teams, seasons and players. What if our match table can do this job. Like in match table, we will have year, teams and players attribute, so from these attrubutes we can easily extract the values of which players are part of which team in which season. But, here problem can be the performance, as this operation will need to go through entire matches database which is huge to get this information, so, is this operation worth it or we should think of option 1 of creating separate table.

| Option                     | Verdict         | Why                                      |
| -------------------------- | --------------- | ---------------------------------------- |
| Extract from matches       | ❌ Not ideal     | Bad performance, messy, loses bench data |
| `Team_Player_Season` table | ✅ Best practice | Scalable, normalized, clean for queries  |


#### Attributes
    1. team_id - primary key
    2. name
    3. logo

### 3. Matches
This is the main table as it will link everything together

#### Attributes -
    1. match_id - primary key
    2. date
    3. venue
    4. city
    5. team1_name - foreign key - team_id
    6. team2_name - foreign key - team_id
    7. team1_players - foreign key - player_id
    8. team2_players - foreign key - player_id
    9. toss_winner
    10. toss_decision
    11. match_result
    12. player_of_match


Now, I have to see if by making these entities my queries will work right or not? So, how can I check that?

### 4. Team_Player_Season
#### Attributes
    1. id - primary key
    2. season_year
    3. player_id - foreign key
    4. team_id - foreign key


### I thought, We Normalize Just to Remove Duplicates, but I was wrong
As, We Normalize To:

    1. Make data retrieval faster and cleaner
    2. Allow efficient joins
    3. Enable flexible expansion
    4. Support accurate constraints
    5. Reduce write/update anomalies

### In short: We design for scalability, not just cleanliness.

So while team1_players is not wrong, it's:

    -Unstructured
    -Unindexable
    -Hard to filter
    -Hard to join
    -Unscalable

## 🛠️ What Triggers the Need for a New Table?
Here’s a cheat sheet for real-world decision-making:
| Scenario                                                 | Make a New Table? | Why                                 |
| -------------------------------------------------------- | ----------------- | ----------------------------------- |
| You see a **list inside a column**                       | ✅ YES             | Violates atomicity, hard to query   |
| You have **repeating data with context**                 | ✅ YES             | You need a join table               |
| You want to **track actions or events**                  | ✅ YES             | Like player-match interactions      |
| You realize the table is **growing wide (many columns)** | ✅ YES             | Time to break responsibilities      |
| You can’t easily query/filter by nested data             | ✅ YES             | You’re trading flexibility for pain |

## If I’m storing a relationship between two entities, and that relationship itself has meaning or actions — make a new table.


Now, my match table is not normalized, I have to break into two tables.

### 3. Matches

#### Attributes -
    1. match_id - primary key
    2. date
    3. venue
    4. city
    5. team1_name - foreign key - team_id
    6. team2_name - foreign key - team_id
    9. toss_winner
    10. toss_decision
    11. match_result
    12. player_of_match

### 5. Match_Players

### Attributes -
    1. id - primary key
    2. match_id - foreign key
    3. team_id - foreign key
    4. player_id - foreign key
    5. is_playing 

So, our final 5 tables are -

    1. Players
    2. Teams
    3. Matches
    4. Team_Player_Season
    5. Match_Players