-- =========================
-- Medical Center Schema
-- =========================

-- Drop tables if they exist
DROP TABLE IF EXISTS visit_diseases;
DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS diseases;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS doctors;

-- =========================
-- Doctors Table
-- =========================
CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT
);

-- =========================
-- Patients Table
-- =========================
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    date_of_birth DATE
);

-- =========================
-- Diseases Table
-- =========================
CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);

-- =========================
-- Visits Table
-- =========================
CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(id),
    doctor_id INT REFERENCES doctors(id),
    visit_date DATE NOT NULL
);

-- =========================
-- Visit_Diseases Table
-- =========================
CREATE TABLE visit_diseases (
    visit_id INT REFERENCES visits(id),
    disease_id INT REFERENCES diseases(id),
    PRIMARY KEY (visit_id, disease_id)
);

-- =========================
-- Sample Data
-- =========================
INSERT INTO doctors (first_name, last_name, specialty) VALUES
('John', 'Doe', 'Cardiology'),
('Jane', 'Smith', 'Dermatology');

INSERT INTO patients (first_name, last_name, date_of_birth) VALUES
('Alice', 'Johnson', '1985-06-12'),
('Bob', 'Williams', '1990-09-23');

INSERT INTO diseases (name, description) VALUES
('Flu', 'Influenza virus infection'),
('Hypertension', 'High blood pressure');

INSERT INTO visits (patient_id, doctor_id, visit_date) VALUES
(1, 1, '2025-08-17'),
(2, 2, '2025-08-18');

INSERT INTO visit_diseases (visit_id, disease_id) VALUES
(1, 1),
(2, 2);
