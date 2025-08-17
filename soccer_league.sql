-- =========================
-- Soccer League Schema
-- =========================

DROP TABLE IF EXISTS goals;
DROP TABLE IF EXISTS match_referees;
DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS referees;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS seasons;

-- =========================
-- Teams Table
-- =========================
CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT
);

-- =========================
-- Players Table
-- =========================
CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INT REFERENCES teams(id)
);

-- =========================
-- Referees Table
-- =========================
CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- =========================
-- Matches Table
-- =========================
CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INT REFERENCES teams(id),
    away_team_id INT REFERENCES teams(id),
    match_date DATE NOT NULL
);

-- =========================
-- Match_Referees Table
-- =========================
CREATE TABLE match_referees (
    match_id INT REFERENCES matches(id),
    referee_id INT REFERENCES referees(id),
    PRIMARY KEY (match_id, referee_id)
);

-- =========================
-- Goals Table
-- =========================
CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    match_id INT REFERENCES matches(id),
    player_id INT REFERENCES players(id),
    minute_scored INT
);

-- =========================
-- Seasons Table
-- =========================
CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    start_date DATE,
    end_date DATE
);

-- =========================
-- Sample Data
-- =========================
INSERT INTO teams (name, city) VALUES
('Lions', 'New York'),
('Tigers', 'Chicago');

INSERT INTO players (first_name, last_name, team_id) VALUES
('Alice', 'Smith', 1),
('Bob', 'Jones', 2);

INSERT INTO referees (first_name, last_name) VALUES
('John', 'Doe'),
('Jane', 'Roe');

INSERT INTO matches (home_team_id, away_team_id, match_date) VALUES
(1, 2, '2025-08-17');

INSERT INTO match_referees (match_id, referee_id) VALUES
(1, 1),
(1, 2);

INSERT INTO goals (match_id, player_id, minute_scored) VALUES
(1, 1, 23),
(1, 2, 45);

INSERT INTO seasons (name, start_date, end_date) VALUES
('Summer 2025', '2025-06-01', '2025-08-31');
