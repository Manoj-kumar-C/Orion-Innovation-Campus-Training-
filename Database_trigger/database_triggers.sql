
-- Create Database and Tables
CREATE DATABASE Campus2025;
USE Campus2025;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    Age INT
);


CREATE TABLE Employee_Log (
    EmployeeID INT,
    Action VARCHAR(30),
    Login DATETIME
);


-- Trigger for INSERT
CREATE TRIGGER Employee_Trigger_Insert 
ON Employee 
AFTER INSERT
AS
BEGIN
    INSERT INTO Employee_Log 
    SELECT EmployeeID, 'Inserted', GETDATE() 
    FROM inserted;
END;


-- Trigger for UPDATE
CREATE TRIGGER Employee_Trigger_Update 
ON Employee 
AFTER UPDATE
AS
BEGIN
    INSERT INTO Employee_Log 
    SELECT EmployeeID, 'Updated', GETDATE() 
    FROM inserted;
END;


-- Trigger for DELETE
CREATE TRIGGER Employee_Trigger_Delete 
ON Employee 
AFTER DELETE
AS
BEGIN
    INSERT INTO Employee_Log 
    SELECT EmployeeID, 'Deleted', GETDATE() 
    FROM deleted;
END;


-- Example INSERTs
INSERT INTO Employee VALUES (1, 'Arun', 25);
INSERT INTO Employee VALUES (2, 'Suresh', 23);


-- Example UPDATE
UPDATE Employee SET Age = 26 WHERE EmployeeID = 1;


-- Example DELETE
DELETE FROM Employee WHERE EmployeeID = 1;


-- Disable and Enable Triggers Example
DISABLE TRIGGER Employee_Trigger_Insert ON Employee;


INSERT INTO Employee VALUES (3, 'Prem', 23); -- Will not be logged


ENABLE TRIGGER Employee_Trigger_Insert ON Employee;


INSERT INTO Employee VALUES (4, 'Suji', 32); -- Will be logged
