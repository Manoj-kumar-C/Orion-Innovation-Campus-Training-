-- Drop tables if they already exist
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;

-- 1. Create Customers table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255)
);

-- 2. Create Orders table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2),
    OrderStatus VARCHAR(50)
);

-- 3. Insert sample data into Customers
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address)
VALUES
('Alice', 'Brown', 'alice@example.com', '1234567890', '123 Main St'),
('Bob', 'Green', 'bob@example.com', '0987654321', '456 Park Ave'),
('Charlie', 'White', 'charlie@example.com', '1112223333', '789 Elm St');

-- 4. Insert sample data into Orders
INSERT INTO Orders (CustomerID, OrderDate, OrderAmount, OrderStatus)
VALUES
(1, '2025-04-01', 250.00, 'Shipped'),
(2, '2025-04-03', 175.00, 'Processing');

-- 5. INNER JOIN – Customers who placed orders
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.OrderAmount, o.OrderStatus
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 6. LEFT JOIN – All customers and their orders (if any)
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.OrderAmount, o.OrderStatus
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 7. RIGHT JOIN – All orders and their customers (if any; for data issue checking)
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.OrderAmount, o.OrderStatus
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 8. FULL OUTER JOIN – All customers and all orders, matched or not
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.OrderAmount, o.OrderStatus
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID;
