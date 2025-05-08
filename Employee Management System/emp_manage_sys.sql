-- Drop tables if they exist
IF OBJECT_ID('dbo.Deductions', 'U') IS NOT NULL DROP TABLE dbo.Deductions;
IF OBJECT_ID('dbo.Bonuses', 'U') IS NOT NULL DROP TABLE dbo.Bonuses;
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL DROP TABLE dbo.Employees;

-- 1. Create Employees table
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    BaseSalary DECIMAL(10, 2)
);

-- 2. Create Bonuses table
CREATE TABLE Bonuses (
    BonusID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    BonusAmount DECIMAL(10, 2),
    BonusDate DATE
);

-- 3. Create Deductions table
CREATE TABLE Deductions (
    DeductionID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    DeductionAmount DECIMAL(10, 2),
    DeductionDate DATE
);

-- 4. Insert sample data into Employees
INSERT INTO Employees (FirstName, LastName, BaseSalary)
VALUES 
('John', 'Doe', 50000.00),
('Jane', 'Smith', 60000.00);

-- 5. Insert sample data into Bonuses
INSERT INTO Bonuses (EmployeeID, BonusAmount, BonusDate)
VALUES 
(1, 1000.00, '2024-01-15'),
(1, 500.00, '2024-03-10'),
(2, 1500.00, '2024-02-01');

-- 6. Insert sample data into Deductions
INSERT INTO Deductions (EmployeeID, DeductionAmount, DeductionDate)
VALUES 
(1, 200.00, '2024-01-20'),
(2, 300.00, '2024-02-15');

-- 7. Create Function: CalculateTotalCompensation
IF OBJECT_ID('dbo.CalculateTotalCompensation', 'FN') IS NOT NULL
    DROP FUNCTION dbo.CalculateTotalCompensation;
GO

CREATE FUNCTION dbo.CalculateTotalCompensation (@EmployeeID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @BaseSalary DECIMAL(10, 2)
    DECLARE @TotalBonuses DECIMAL(10, 2)
    DECLARE @TotalDeductions DECIMAL(10, 2)
    DECLARE @TotalCompensation DECIMAL(10, 2)

    -- Get base salary
    SELECT @BaseSalary = BaseSalary
    FROM Employees
    WHERE EmployeeID = @EmployeeID

    -- Sum of all bonuses
    SELECT @TotalBonuses = ISNULL(SUM(BonusAmount), 0)
    FROM Bonuses
    WHERE EmployeeID = @EmployeeID

    -- Sum of all deductions
    SELECT @TotalDeductions = ISNULL(SUM(DeductionAmount), 0)
    FROM Deductions
    WHERE EmployeeID = @EmployeeID

    -- Final total compensation
    SET @TotalCompensation = @BaseSalary + @TotalBonuses - @TotalDeductions

    RETURN @TotalCompensation
END;
GO

-- 8. Example Usage
SELECT 
    EmployeeID,
    FirstName,
    LastName,
    dbo.CalculateTotalCompensation(EmployeeID) AS TotalCompensation
FROM Employees;
