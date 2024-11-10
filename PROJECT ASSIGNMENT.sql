
-- CREATE A DATABASE
CREATE DATABASE TICKETBOOKINGSYSTEM

-- USE THE DATABASE
USE TICKETBOOKINGSYSTEM

-- CREATE A VENUE TABLE
CREATE TABLE Venue (
venue_id INT PRIMARY KEY,
venue_name VARCHAR(100) NOT NULL,
address VARCHAR(255))

--INSERT VENUE TABLE VALUES
INSERT INTO Venue (venue_id, venue_name, address)
VALUES
(1, 'City Hall', 'Ahemadabad'),
(2, 'Sports Arena', 'India'), 
(3, 'Concert Hall', 'Mumbai'),
(4, 'Grand Theater', 'Hyderabad'),
(5, 'Cinema Complex', 'Chennai'),
(6, 'Expo Center', 'Bangalore'),
(7, 'Open Stadium', 'Chennai'),
(8, 'Downtown Auditorium', 'Pune'),
(9, 'Convention Center', 'Delhi'),
(10, 'Park Avenue', 'Coimbataore')
SELECT * FROM Venue 
TRUNCATE TABLE Venue 


-- CREATE AN EVENT TABLE
CREATE TABLE Event (event_id INT PRIMARY KEY,
event_name VARCHAR(100) NOT NULL,
event_date DATE NOT NULL,
event_time TIME NOT NULL,
venue_id INT NOT NULL,
total_seats INT NOT NULL CHECK (total_seats > 0),
available_seats INT NOT NULL CHECK (available_seats >= 0),
ticket_price DECIMAL (10, 2) NOT NULL CHECK (ticket_price >= 0),
event_type VARCHAR(20) NOT NULL CHECK (event_type IN ('Movie', 'Sports', 'Concert')),
FOREIGN KEY (venue_id) REFERENCES Venue (venue_id))

SET IDENTITY_INSERT Event ON;

--INSERT EVENT TABLE VALUES
 INSERT INTO Event (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type)
VALUES
(1, 'World Cup Final', '2024-12-18', '20:00:00', 1, 500, 250, 2000.00, 'Sports'),
(2, 'Rock Concert', '2024-08-10', '03:00:00', 2, 300, 250, 1500.00, 'Concert'),
(3, 'Comedy Show', '2024-05-15', '04:00:00', 3, 150, 75, 888.00, 'Movie'), 
(4, 'Music Festival', '2024-01-01', '06:00:00', 4, 100, 500, 1200.00, 'Concert'),
(5, 'Science Expo', '2024-02-10', '06:00:00', 5, 160, 800, 500.00, 'Movie'),
(6, 'Theater Play', '2024-11-25', '04:00:00', 6, 200, 150, 750.00, 'Movie'),
(7, 'Pub Night', '2025-01-05', '03:00:00', 7, 480, 158, 1880.88, 'Concert'),
(8, 'Football Cup', '2024-11-20', '07:00:00', 8, 600, 5000, 2200.00, 'Sports'),
(9, 'Art Exhibition', '2024-12-01', '05:00:00', 9, 200, 180, 380.00, 'Movie'),
(10, 'Christmas Show', '2024-12-31', '09:00:00', 10, 500, 258, 2500.00, 'Concert')
	SELECT * FROM Event

-- CREATE A CUSTOMER TABLE
CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone_number VARCHAR(15))

--INSERT CUSTOMER VALUES
	INSERT INTO Customers (customer_id, customer_name, email, phone_number) VALUES
(1, 'Rishitha', 'rishi@example.com', '123-456-7890'),
(2, 'kiran', 'kiran@example.com', '345-678-9012'),
(3, 'Jane Smith', 'smitha@example.com', '234-567-8901'),
(4, 'aryann', 'aryann@example.com', '456-789-0123'), 
(5, 'charishma', 'cherry@example.com', '567-890-1234'),
(6, 'Bhavitha', 'bhavitha@example.com','678-901-2345'),
(7, 'Saran', 'saran@example.com', '789-012-3456'), 
(8, 'Amrutha', 'amrutha@example.com', '890-123-4567'),
(9, 'arya', 'arya@example.com ', '901-234-5678'),
(10, 'Pavani', 'pavani@example.com', '012-345-6789');
SELECT * FROM Customers

--create booking table
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY IDENTITY,
    customer_id INT NOT NULL,
    event_id INT NOT NULL,
    num_tickets INT NOT NULL CHECK (num_tickets >0),
    total_cost DECIMAL(10, 2) NOT NULL CHECK (total_cost >= 0),
    booking_date DATE NOT NULL DEFAULT GETDATE(), 
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (event_id) REFERENCES Event(event_id)ON DELETE CASCADE
);

--INSERT BOOKING VALUES
INSERT INTO Booking (customer_id,event_id, num_tickets, total_cost,booking_date) 
VALUES 
(1, 1, 2, 4000.00, '2024-11-01'),
(2, 2, 4, 6008.09, '2024-11-28'),
(3, 3, 3, 2408.00, '2024-11-03'),
(4, 4, 5, 6008.09, '2024-11-04'),
(5, 5, 1, 500.00, '2024-11-05'), 
(6, 6, 2, 1500.09, '2024-11-06'),
(7, 7, 4, 7200.00, '2024-11-07'),
(8, 8, 5, 11000.08, '2024-11-08'),
(9, 9, 3, 900.00, '2024-11-09'),
(10, 10, 6, 15608.00, '2024-11-10')
SELECT * FROM Booking

--TASK 2

--1.Write a SQL query to insert at least 10 sample records into each table 
INSERT INTO Booking (customer_id,event_id, num_tickets, total_cost,booking_date) 
VALUES 
(1, 1, 2, 4000.00, '2024-11-01'),
(2, 2, 4, 6008.09, '2024-11-28'),
(3, 3, 3, 2408.00, '2024-11-03'),
(4, 4, 5, 6008.09, '2024-11-04'),
(5, 5, 1, 500.00, '2024-11-05'), 
(6, 6, 2, 1500.09, '2024-11-06'),
(7, 7, 4, 7200.00, '2024-11-07'),
(8, 8, 5, 11000.08, '2024-11-08'),
(9, 9, 3, 900.00, '2024-11-09'),
(10, 10, 6, 15608.00, '2024-11-10')
SELECT *FROM Booking

--2.Write a SQL query to list all Events
SELECT *FROM EVENT;

--3.Write a SQL query to select events with available tickets
SELECT * FROM Event WHERE 
available_seats > 0;

--4.Write a SQL query to select events name partial match with ‘cup’
SELECT * FROM Event 
WHERE available_seats > 0 
AND event_name LIKE '%cup%';

--5.Write a SQL query to select events with ticket price range is between 1000 to 2500
SELECT * FROM Event WHERE ticket_price BETWEEN 1000 AND 2500;

--6.Write a SQL query to retrieve events with dates falling within a specific range 
SELECT * FROM Event WHERE event_date BETWEEN '2024-01-01' AND '2024-11-25';

--7.Write a SQL query to retrieve events with available tickets that also have "Concert" in their name
SELECT * FROM Event WHERE event_type = 'Concert'

--8.Write a SQL query to retrieve users in batches of 5, starting from the 6th user
SELECT * FROM Venue
ORDER BY venue_id
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

--9.Write a SQL query to retrieve bookings details contains booked no of ticket more than 4
SELECT * FROM Booking WHERE num_tickets > 4;

--10.Write a SQL query to retrieve customer information whose phone number end with ‘000’ 
SELECT *FROM Customers
update customers set phone_number = '6985-869-0000' where customer_id = 1;

--11Write a SQL query to retrieve the events in order whose seat capacity more than 15000
SELECT *FROM Event
WHERE total_seats > 15000
ORDER BY total_seats;

--12Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z’ 
SELECT event_name
FROM Event
WHERE LOWER(event_name) NOT LIKE 'x%' 
AND LOWER(event_name) NOT LIKE 'y%' 
AND LOWER(event_name) NOT LIKE 'z%';


--TASK -3

--1.List Events and Their Average Ticket Prices
SELECT  AVG(ticket_price) AS Averageticket
FROM [Event]

--2. Calculate the Total Revenue Generated by Events
SELECT  SUM(ticket_price) AS revenue
FROM [Event]

--3.Find the Event with the Highest Ticket Sales
SELECT E.event_name, SUM(B.num_tickets) AS total_tickets_sold
FROM Booking B
JOIN Event E ON B.event_id = E.event_id
GROUP BY E.event_name
ORDER BY total_tickets_sold DESC ;

--4.Calculate the Total Number of Tickets Sold for Each Event
SELECT E.event_name, SUM(B.num_tickets) AS total_tickets_sold
FROM Booking B
JOIN Event E ON B.event_id = E.event_id
GROUP BY E.event_name;

--5.Find Events with No Ticket Sales
SELECT e.event_name
FROM Event e
LEFT JOIN Booking B ON e.event_id = B.event_id
WHERE B.booking_id IS NULL;

--6.Find the User Who Has Booked the Most Tickets
SELECT C.customer_name, 
       SUM(B.num_tickets) AS total_tickets_booked 
FROM Booking B
JOIN Customers C ON B.customer_id = C.customer_id
GROUP BY C.customer_name
ORDER BY total_tickets_booked DESC;


--7 List Events and the Total Number of Tickets Sold for Each Month
SELECT 
    E.event_name,
    MONTH(E.event_date) AS event_month,
    SUM(B.num_tickets) AS total_tickets_sold
FROM Booking B
JOIN Event E ON B.event_id = E.event_id
GROUP BY E.event_name, MONTH(E.event_date)
ORDER BY event_month ASC, total_tickets_sold DESC;

--8.Calculate the Average Ticket Price for Events in Each Venue
SELECT V.venue_name,  AVG(E.ticket_price) AS average_ticket_price
FROM Event E JOIN Venue V ON E.venue_id = V.venue_id
GROUP BY V.venue_name

--9.Calculate the Total Number of Tickets Sold for Each Event Type
SELECT E.event_type, SUM(B.num_tickets) AS total_tickets_sold
FROM Booking B
JOIN  Event E ON B.event_id = E.event_id
GROUP BY E.event_type
ORDER BY  total_tickets_sold DESC;


--10.Calculate the Total Revenue Generated by Events in Each Year
SELECT YEAR(E.event_date) AS event_year,
SUM(B.total_cost) AS total_revenue
FROM Booking B
JOIN Event E ON B.event_id = E.event_id
GROUP BY YEAR(E.event_date)
ORDER BY  event_year ASC, total_revenue DESC;


--11.List Users Who Have Booked Tickets for Multiple Events
SELECT  C.customer_name
FROM Booking B
JOIN Customers C ON B.customer_id = C.customer_id
GROUP BY C.customer_name
HAVING COUNT(DISTINCT B.event_id) > 1;

--12.Calculate the Total Revenue Generated by Events for Each User
SELECT C.customer_name, SUM(B.total_cost) AS total_revenue
FROM Booking B JOIN Customers C ON B.customer_id = C.customer_id
GROUP BY C.customer_name


--13.Calculate the Average Ticket Price for Events in Each Category and Venue
SELECT event_type,AVG(ticket_price) as average
FROM [Event]
WHERE event_id=venue_id
GROUP BY event_type
ORDER BY event_type

--14.List Users and the Total Number of Tickets They've Purchased in the Last 30 Days
SELECT C.customer_name,SUM(B.num_tickets) AS total_tickets_purchased FROM Booking B
JOIN Customers C ON B.customer_id = C.customer_id
WHERE B.booking_date >= DATEADD(DAY, -30, GETDATE())
GROUP BY C.customer_name
ORDER BY  total_tickets_purchased DESC;

--TASK 4
--1.Calculate the Average Ticket Price for Events in Each Venue Using a Subquery
SELECT V.venue_name,(SELECT AVG(ticket_price) FROM Event WHERE venue_id = V.venue_id) AS avg_ticket_price
FROM Venue V;

--2.Find Events with More Than 50% of Tickets Sold using subquery
SELECT E.event_name
FROM Event E
WHERE (SELECT (total_seats - available_seats) FROM Event WHERE event_id = E.event_id) > (E.total_seats / 2);


--3.Calculate the Total Number of Tickets Sold for Each Event
SELECT E.event_name, (SELECT SUM(B.num_tickets) FROM Booking B 
WHERE B.event_id = E.event_id) AS total_tickets_sold FROM Event E;

--4.Find Users Who Have Not Booked Any Tickets Using a NOT EXISTS Subquery
SELECT C.customer_name
FROM Customers C
WHERE NOT EXISTS (SELECT 1 FROM Booking B WHERE B.customer_id = C.customer_id);

--5.List Events with No Ticket Sales Using a NOT IN Subquery
SELECT E.event_name
FROM Event E
WHERE E.event_id NOT IN (SELECT event_id FROM Booking);

--6.Calculate the Total Number of Tickets Sold for Each Event Type Using a Subquery in the FROM Clause
SELECT E.event_type, (SELECT SUM(num_tickets) FROM Booking B WHERE B.event_id = E.event_id) AS total_tickets_sold
FROM Event E;

--7.Find Events with Ticket Prices Higher Than the Average Ticket Price Using a Subquery in the WHERE Clause
SELECT event_name, ticket_price
FROM Event
WHERE ticket_price > (SELECT AVG(ticket_price) FROM Event);


--8.Calculate the Total Revenue Generated by Events for Each User Using a Correlated Subquery
SELECT C.customer_name,(SELECT SUM(B.total_cost) 
FROM Booking B WHERE B.customer_id = C.customer_id) AS total_revenue
FROM Customers C;

--9.List Users Who Have Booked Tickets for Events in a Given Venue Using a Subquery in the WHERE Clause
SELECT C.customer_name FROM Customers C WHERE EXISTS (SELECT 1 FROM Booking B
JOIN Event E ON B.event_id = E.event_id
WHERE B.customer_id = C.customer_id
AND E.venue_id = 1);

--10.Calculate the Total Number of Tickets Sold for Each Event Category Using a Subquery with GROUP BY. 
SELECT E.event_type,(SELECT SUM(B.num_tickets) FROM Booking B
JOIN Event E2 ON B.event_id = E2.event_id
WHERE E2.event_type = E.event_type) AS total_tickets_sold
FROM Event E
GROUP BY E.event_type;

--11.Find Users Who Have Booked Tickets for Events in each Month Using a Subquery with DATE_FORMAT
SELECT  C.customer_name, YEAR(B.booking_date) AS booking_year, MONTH(B.booking_date) AS booking_month FROM Customers C
JOIN Booking B ON B.customer_id = C.customer_id
GROUP BY C.customer_name, YEAR(B.booking_date), MONTH(B.booking_date)
ORDER BY booking_year, booking_month, C.customer_name;

--12.Calculate the Average Ticket Price for Events in Each Venue Using a Subquery 
 SELECT V.venue_name,(SELECT AVG(ticket_price) FROM Event WHERE venue_id = V.venue_id) AS avg_ticket_price
FROM Venue V;









