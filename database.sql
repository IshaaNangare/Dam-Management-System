CREATE DATABASE IF NOT EXISTS dammanage;
USE dammanage;

-- USERS
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    role VARCHAR(20)
);

-- TENDER
CREATE TABLE tender (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    cost DOUBLE,
    deadline DATE,
    type VARCHAR(20)
);

-- BID
CREATE TABLE bid (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tender_id INT,
    contractor_name VARCHAR(50),
    amount DOUBLE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- AUDIT
CREATE TABLE audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tender_id INT,
    status VARCHAR(50)
);

-- WORK
CREATE TABLE work (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tender_id INT,
    contractor_name VARCHAR(50),
    status VARCHAR(50)
);

-- ISSUE
CREATE TABLE issue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dam_name VARCHAR(50),
    issue_type VARCHAR(50),
    status VARCHAR(50)
);
