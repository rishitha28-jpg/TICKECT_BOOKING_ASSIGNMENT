--CREATE A DTABASE TICKECTBOOKINGSYSTEM
CREATE DATABASE TICKETBOOKINGSYSTEM

--USE THE DATABASE
USE TICKETBOOKINGSYSTEM

-- CREATE A VENUE TABLE
CREATE TABLE Venue (
venue_id INT PRIMARY KEY,
venue_name VARCHAR(100) NOT NULL,
address VARCHAR(255)
)

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

-- CREATE AN EVENT TABLE
CREATE TABLE Event (event_id INT PRIMARY KEY,
event_name VARCHAR(100) NOT NULL,
event_date DATE NOT NULL,
event_time TIME NOT NULL,
venue_id INT FOREIGN KEY REFERENCES Venue(venue_id),
total_seats INT ,
available_seats INT ,
ticket_price DECIMAL (10, 2) ,
event_type VARCHAR(20) NOT NULL CHECK (event_type IN ('Movie', 'Sports', 'Concert')),
booking_id INT
)

--INSERT EVENT TABLE VALUES
 INSERT INTO Event (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type,booking_id)
VALUES
(1, 'World Cup Final', '2024-12-18', '20:00:00', 1, 15000, 250, 2000.00, 'Sports',NULL),
(2, 'Rock Concert', '2024-08-10', '03:00:00', 2, 300, 250, 1500.00, 'Concert',NULL),
(3, 'Comedy Show', '2024-05-15', '04:00:00', 3, 150, 75, 888.00, 'Movie',NULL), 
(4, 'Music Festival', '2024-01-01', '06:00:00', 4, 100, 500, 1200.00, 'Concert',NULL),
(5, 'Science Expo', '2024-02-10', '06:00:00', 5, 160, 800, 500.00, 'Movie',NULL),
(6, 'Theater Play', '2024-11-25', '04:00:00', 6, 200, 150, 750.00, 'Movie',NULL),
(7, 'Pub Night', '2025-01-05', '03:00:00', 7, 480, 158, 1880.88, 'Concert',NULL),
(8, 'Football Cup', '2024-11-20', '07:00:00', 8, 600, 5000, 2200.00, 'Sports',NULL),
(9, 'Art Exhibition', '2024-12-01', '05:00:00', 9, 200, 180, 380.00, 'Movie',NULL),
(10, 'Christmas Show', '2024-12-31', '09:00:00', 10, 500, 258, 2500.00, 'Concert',NULL)
SELECT * FROM Event

-- CREATE A CUSTOMER TABLE
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name NVARCHAR(40),
    email VARCHAR(100),
    phone_number INT,
    booking_id INT
)

--INSERT CUSTOMER VALUES
INSERT INTO Customer (customer_id, customer_name, email, phone_number,booking_id)
VALUES
(1, 'Rishitha', 'rishi@example.com', 9845,NULL),
(2, 'kiran', 'kiran@example.com', 76059,NULL),
(3, 'Jane Smith', 'smitha@example.com', 7658,NULL),
(4, 'aryann', 'aryann@example.com', 7658,NULL),
(5, 'charishma', 'cherry@example.com', 7890,NULL),
(6, 'Bhavitha', 'bhavitha@example.com',4567,NULL),
(7, 'Saran', 'saran@example.com', 9876,NULL),
(8, 'Amrutha', 'amrutha@example.com', 1234,NULL),
(9, 'arya', 'arya@example.com ', 4357,NULL),
(10, 'Pavani', 'pavani@example.com', 0929,NULL)
SELECT * FROM Customer

--CREATE BOOKING TABLE
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customer(customer_id),
    event_id INT FOREIGN KEY REFERENCES Event(event_id),
    num_tickets INT,
    total_cost DECIMAL,
    booking_date DATE
)
SET IDENTITY_INSERT Booking ON;

--ADDING FOREIGN KEY CONSTRAINTS
ALTER TABLE Event
ADD CONSTRAINT FK_Event_Booking
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
ALTER TABLE Customer
ADD CONSTRAINT FK_Customer_Booking 
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)


--INSERT BOOKING VALUES
INSERT INTO Booking (booking_id,customer_id,event_id, num_tickets, total_cost,booking_date) 
VALUES 
(1,1, 1, 2, 4000.00, '2024-11-01'),
(2,2, 2, 4, 6008.09, '2024-11-28'),
(3,3, 3, 3, 2408.00, '2024-11-03'),
(4,4, 4, 5, 6008.09, '2024-11-04'),
(5,5, 5, 1, 500.00, '2024-11-05'), 
(6,6, 6, 2, 1500.09, '2024-11-06'),
(7,7, 7, 4, 7200.00, '2024-11-07'),
(8,8, 8, 5, 11000.08, '2024-11-08'),
(9,9, 9, 3, 900.00, '2024-11-09'),
(10,10, 10, 6, 15608.00, '2024-11-10')
SELECT * FROM Booking

UPDATE Event
SET booking_id = CASE
    WHEN event_id = 1 THEN 1
    WHEN event_id = 2 THEN 2
    WHEN event_id = 3 THEN 3
    WHEN event_id = 4 THEN 4
    WHEN event_id = 5 THEN 5
    WHEN event_id = 6 THEN 6
    WHEN event_id = 7 THEN 7
    WHEN event_id = 8 THEN 8
    WHEN event_id = 9 THEN 9
    WHEN event_id = 10 THEN 10
    ELSE booking_id
END;

UPDATE Customer
SET booking_id = CASE
    WHEN customer_id = 1 THEN 1
    WHEN customer_id = 2 THEN 2
    WHEN customer_id = 3 THEN 3
    WHEN customer_id = 4 THEN 4
    WHEN customer_id = 5 THEN 5
    WHEN customer_id = 6 THEN 6
    WHEN customer_id = 7 THEN 7
    WHEN customer_id = 8 THEN 8
    WHEN customer_id = 9 THEN 9
    WHEN customer_id = 10 THEN 10
    ELSE booking_id
END;


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
SELECT *FROM Customer
update customer set phone_number = 0000 where customer_id = 1;

--11Write a SQL query to retrieve the events in order whose seat capacity more than 15000
SELECT * FROM [Event]
WHERE available_seats>=1500 
ORDER BY available_seats


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
SELECT EVENT_NAME
FROM EVENT
WHERE TOTAL_SEATS = AVAILABLE_SEATS;


--6.Find the User Who Has Booked the Most Tickets
SELECT C.customer_name, 
       SUM(B.num_tickets) AS total_tickets_booked 
FROM Booking B
JOIN Customer C ON B.customer_id = C.customer_id
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
SELECT C.customer_name,COUNT(DISTINCT B.event_id) AS event_count
FROM  Customer C
JOIN Booking B ON C.customer_id = B.customer_id
GROUP BY C.customer_name
HAVING COUNT(DISTINCT B.event_id) > 1


--12.Calculate the Total Revenue Generated by Events for Each User
SELECT C.customer_name, SUM(B.total_cost) AS total_revenue
FROM Booking B JOIN Customer C ON B.customer_id = C.customer_id
GROUP BY C.customer_name


--13.Calculate the Average Ticket Price for Events in Each Category and Venue
SELECT event_type,AVG(ticket_price) as average
FROM [Event]
WHERE event_id=venue_id
GROUP BY event_type
ORDER BY event_type

--14.List Users and the Total Number of Tickets They've Purchased in the Last 30 Days
SELECT C.customer_name,SUM(B.num_tickets) AS total_tickets_purchased FROM Booking B
JOIN Customer C ON B.customer_id = C.customer_id
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
SELECT customer_name
FROM Customer C WHERE 
NOT EXISTS (SELECT customer_id FROM Booking B 
WHERE B.customer_id = C.customer_id )

--5.List Events with No Ticket Sales Using a NOT IN Subquery
SELECT event_id,event_name from Event e
where event_id not in (SELECT event_id FROM Booking b
WHERE e.event_id=b.event_id)

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
FROM Customer C;

--9.List Users Who Have Booked Tickets for Events in a Given Venue Using a Subquery in the WHERE Clause
SELECT C.customer_name FROM Customer C WHERE EXISTS (SELECT 1 FROM Booking B
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
SELECT C.customer_name
FROM Customer C
JOIN Booking B ON C.customer_id = B.customer_id
WHERE FORMAT(B.booking_date, 'yyyy-MM') = FORMAT(GETDATE(), 'yyyy-MM');

--12.Calculate the Average Ticket Price for Events in Each Venue Using a Subquery 
 SELECT V.venue_name,(SELECT AVG(ticket_price) FROM Event WHERE venue_id = V.venue_id) AS avg_ticket_price
FROM Venue V;