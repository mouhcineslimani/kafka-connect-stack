-- Create database if not exists
CREATE DATABASE IF NOT EXISTS peaqock_db;

-- Use the peaqock_db database
USE peaqock_db;

-- Table for the Client entity
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(255) NOT NULL,
    account VARCHAR(255) NOT NULL,
    region VARCHAR(255),
    bank_type VARCHAR(255)
);

-- Table for the Transaction entity
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    amount DOUBLE NOT NULL,
    transaction_date DATETIME NOT NULL,
    FOREIGN KEY (sender_id) REFERENCES clients(client_id),
    FOREIGN KEY (receiver_id) REFERENCES clients(client_id)
);


-- Insert sample clients into the clients table
INSERT INTO clients (client_name, account, region, bank_type)
VALUES 
    ('Ahmed El Haddad', '123456789', 'Casablanca', 'Banque Populaire'),
    ('Fatima Zahra Amrani', '987654321', 'Marrakech', 'Attijariwafa Bank'),
    ('Youssef Benali', '456789123', 'Rabat', 'Banque Centrale Populaire');

-- Insert sample transactions into the transactions table
INSERT INTO transactions (sender_id, receiver_id, amount, transaction_date)
VALUES 
    (1, 2, 100.00, '2024-05-20 08:30:00'),
    (2, 3, 50.00, '2024-05-20 09:45:00'),
    (3, 1, 75.00, '2024-05-21 10:15:00');


CREATE TABLE fraud_detection_rules (
    rule_id INT AUTO_INCREMENT PRIMARY KEY,
    `condition` VARCHAR(255),
    description VARCHAR(255)
);


INSERT INTO fraud_detection_rules (`condition`, description) VALUES
    ('amount > 1000', 'Flag transactions with amount greater than $1000');

