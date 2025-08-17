-- =========================
-- Craigslist Schema
-- =========================

DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS regions;

-- =========================
-- Regions Table
-- =========================
CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- =========================
-- Users Table
-- =========================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    email TEXT,
    preferred_region_id INT REFERENCES regions(id)
);

-- =========================
-- Categories Table
-- =========================
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- =========================
-- Posts Table
-- =========================
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INT REFERENCES users(id),
    region_id INT REFERENCES regions(id),
    category_id INT REFERENCES categories(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- Sample Data
-- =========================
INSERT INTO regions (name) VALUES
('San Francisco'),
('Atlanta'),
('Seattle');

INSERT INTO users (username, email, preferred_region_id) VALUES
('alice123', 'alice@example.com', 1),
('bob456', 'bob@example.com', 2);

INSERT INTO categories (name) VALUES
('For Sale'),
('Jobs'),
('Services');

INSERT INTO posts (title, body, user_id, region_id, category_id) VALUES
('Selling bike', 'Used mountain bike for sale, good condition', 1, 1, 1),
('Looking for nanny', 'Need nanny for 2 kids in Atlanta', 2, 2, 2);
