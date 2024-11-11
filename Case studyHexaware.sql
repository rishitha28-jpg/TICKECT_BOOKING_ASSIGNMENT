--CREATE DATABASE DigitalAssestManagementApplication
CREATE DATABASE DigitalAssestManagementApplication

--create a table employees
CREATE TABLE employees (
employee_id INT PRIMARY KEY,   
name VARCHAR(40) NOT NULL,                   
department VARCHAR(50) NOT NULL,             
email VARCHAR(60) UNIQUE NOT NULL,
password VARCHAR(10))

DROP TABLE employees
	
--CREATE TABLE ASSETS
CREATE TABLE assets (
asset_id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
type VARCHAR(50) NOT NULL, 
serial_number VARCHAR(100) UNIQUE NOT NULL,
purchase_date DATE NOT NULL,
location VARCHAR(100) NOT NULL,
status VARCHAR(50) NOT NULL, 
owner_id INT,
FOREIGN KEY (owner_id) REFERENCES employees(employee_id))

DROP TABLE assets

--CREATE TABLE MAINTENANCE RECORDS
CREATE TABLE maintenance_records (
maintenance_id INT PRIMARY KEY ,
asset_id INT,
maintenance_date DATE NOT NULL,
description TEXT,
cost DECIMAL(10, 2),
FOREIGN KEY (asset_id) REFERENCES assets(asset_id))
DROP TABLE maintenance_records
TRUNCATE TABLE maintenance_records

-- Create a table for asset allocations
CREATE TABLE asset_allocations (
allocation_id INT PRIMARY KEY,
asset_id INT,
employee_id INT,
allocation_date DATE NOT NULL,
return_date DATE,
FOREIGN KEY (asset_id) REFERENCES assets(asset_id) ON DELETE CASCADE, 
FOREIGN KEY (employee_id) REFERENCES employees(employee_id))

DROP TABLE asset_allocations

--CREATE TABLE RESERVATIONS
CREATE TABLE reservations (
reservation_id INT PRIMARY KEY,
asset_id INT,
employee_id INT,
reservation_date DATE NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
status VARCHAR(20) NOT NULL, -- e.g., pending, approved, canceled
FOREIGN KEY (asset_id) REFERENCES assets(asset_id) ON DELETE CASCADE,
FOREIGN KEY (employee_id) REFERENCES employees(employee_id))

--insert values into employee 
INSERT INTO employees(employee_id, name, department, email, password)
VALUES
(1, 'Aryannreddy', 'CSE', 'aryann@example.com', 'aryan143'),
(2, 'rishitha', 'CSE', 'rishitha@example.com', 'risi431'),
(3, 'Sushwanth', 'ECE', 'sushwanth@gmail.com', 'sush321'),
(4, 'Premreddy', 'IT','prem@gmail.com', 'prem897'),
(5, 'Cherry', 'EEE', 'cherry@gmail.com', 'cherry657'),
SELECT * FROM  employees;

--insert vales into assets table
INSERT INTO assets (asset_id, name, type, serial_number, purchase_date, location, status, owner_id)
VALUES
(1, 'HP laptop', 'Laptop', 'SN78999', '2024-01-15', 'Office', 'in use', 1),
(2, 'Audi Car', 'Vehicle', 'SN19994', '2023-02-20', 'Parking Lot', 'in use', 2),
(3, 'Dell laptop', 'Laptop', 'SN64874', '2025-03-10', 'Conference Room', 'under maintenance', 3),
(4, 'Canon Projector', 'Projector', 'SN43575', '2024-04-05', 'Conference Room', 'in use', 1),
(5, 'Office Desk', 'Furniture', 'SN54321', '2024-05-15', 'Office', 'in use', 4);
SELECT *FROM assets

-- Insert vales into maintenance records table
INSERT INTO maintenance_records (maintenance_id, asset_id, maintenance_date, description, cost)
VALUES
(1, 1, '2023-01-10', 'Battery replacement', 150.00),
(2, 3, '2023-03-15', 'phone replacement', 75.00),
(3, 2, '2023-02-05', 'Oil change', 200.00),
(4, 4, '2023-04-20', 'General maintenance', 500.00),
(5, 1, '2023-05-10', 'Keyboard replacement', 170.00);
SELECT * FROM maintenance_records
DROP TABLE IF EXISTS maintenance_records;

-- Insert values into asset allocations table
INSERT INTO asset_allocations (allocation_id, asset_id, employee_id, allocation_date, return_date)
VALUES
(1, 1, 1, '2023-01-15', NULL),  
(2, 2, 2, '2023-02-01', '2023-02-10'),  
(3, 3, 3, '2023-03-01', NULL),  
(4, 4, 4, '2023-04-15', '2023-04-20'),  
(5, 5, 5, '2023-05-05', NULL);  
SELECT * FROM asset_allocations;

--insert into the reservation table
INSERT INTO reservations (reservation_id, asset_id, employee_id, reservation_date, start_date, end_date, status)
VALUES
(1, 1, 1, '2023-01-01', '2023-01-10', '2023-01-15', 'approved'),  
(2, 2, 2, '2023-01-15', '2023-01-20', '2023-01-25', 'pending'),   
(3, 3, 3, '2023-02-01', '2023-02-05', '2023-02-10', 'approved'),  
(4, 4, 4, '2023-02-10', '2023-02-15', '2023-02-20', 'canceled'),  
(5, 5, 5, '2023-03-01', '2023-03-05', '2023-03-10', 'approved');   
SELECT * FROM reservations;