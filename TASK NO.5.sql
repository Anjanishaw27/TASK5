-- Create Customers table
CREATE DATABASE CUSTOMBER;
USE CUSTOMBER;
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert into Customers
INSERT INTO Customers VALUES (1, 'Alice');
INSERT INTO Customers VALUES (2, 'Bob');
INSERT INTO Customers VALUES (3, 'Charlie');

-- Insert into Orders
INSERT INTO Orders VALUES (101, 1, '2025-06-01');
INSERT INTO Orders VALUES (102, 2, '2025-06-03');
-- Note: Charlie (ID 3) has no order
-- Also add an order with no matching customer to test FULL JOIN later
INSERT INTO Orders VALUES (103, 5, '2025-06-05');

SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- FULL OUTER JOIN emulation in SQLite
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate
FROM Orders
LEFT JOIN Customers ON Customers.CustomerID = Orders.CustomerID;


