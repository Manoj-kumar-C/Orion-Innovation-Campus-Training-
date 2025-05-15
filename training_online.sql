CREATE database prac_db;

USE prac_db;

CREATE TABLE Employee (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Age INT,
    Department NVARCHAR(50)
);



CREATE PROCEDURE InsertEmployee
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Age INT,
    @Department NVARCHAR(50)
AS
BEGIN
    INSERT INTO Employee (FirstName, LastName, Age, Department)
    VALUES (@FirstName, @LastName, @Age, @Department);
 
    PRINT 'Record Inserted Successfully';
END


EXEC InsertEmployee @FirstName = 'John', @LastName = 'Doe', @Age = 30, @Department = 'IT'

CREATE PROCEDURE UpdateEmployee
    @EmployeeID INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Age INT,
    @Department NVARCHAR(50)
AS
BEGIN
    UPDATE Employee
    SET FirstName = @FirstName,
        LastName = @LastName,
        Age = @Age,
        Department = @Department
    WHERE EmployeeID = @EmployeeID;
 
    PRINT 'Record Updated Successfully';
END;

EXEC UpdateEmployee @EmployeeID = 1, @FirstName = 'Jane', @LastName = 'Smith', @Age = 28, @Department = 'HR'


CREATE PROCEDURE DeleteEmployee
    @EmployeeID INT
AS
BEGIN
    DELETE FROM Employee
    WHERE EmployeeID = @EmployeeID;
 
    PRINT 'Record Deleted Successfully';
END

Create Procedure ViewEmployee
AS
BEGIN
Select * from Employee
End 