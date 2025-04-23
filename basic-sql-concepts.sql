 -- Employee Management System 

 /* 

 Problem Statement
Create and manipulate tables to manage employee data in an organization. The tasks should include
creating tables, inserting data, updating records, deleting records, and querying data using SELECT
statements.
Requirements:
Database Schema:
• Table: Employees
o EmployeeID (INT, Primary Key, Auto Increment)
o FirstName (VARCHAR(255))
o LastName (VARCHAR(255))
o JobTitle (VARCHAR(255))
o Department (VARCHAR(255))
o Salary (DECIMAL(10, 2))
o HireDate (DATE)
Tasks:
1. Create Table:
o Create the Employees table.
2. Insert Data:
o Insert sample data into the Employees table.
3. Update Data:
o Update the salary of an employee.
4. Delete Data:
o Delete an employee record.
5. Select Data:
o Retrieve all records.
o Retrieve employees with a salary greater than a specified amount.
o Retrieve employees hired after a certain date.
o Retrieve employees in a specific department.


 */ 

 CREATE DATABASE OrionDB;

 USE OrionDB;


 CREATE TABLE Employee(
	ID INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(255),
	LastName VARCHAR(255),
	JobTitle VARCHAR(255),
	Department VARCHAR(255),
	Salary DECIMAL(10,2),
	HireDate DATE
 );

 INSERT INTO Employee (FirstName, LastName, JobTitle, Department, Salary, HireDate)
VALUES 
('John', 'Doe', 'Software Engineer', 'IT', 75000.00, '2022-03-15'),
('Jane', 'Smith', 'Project Manager', 'IT', 95000.00, '2021-07-10'),
('Mark', 'Lee', 'HR Specialist', 'HR', 60000.00, '2023-01-01'),
('Emily', 'Clark', 'Accountant', 'Finance', 68000.00, '2020-09-25'),
('Chris', 'Brown', 'Marketing Manager', 'Marketing', 72000.00, '2019-06-30');


UPDATE Employee
SET Salary = 65000.00
WHERE FirstName = 'Mark' AND LastName = 'Lee';


DELETE FROM Employee
WHERE FirstName = 'Chris' AND LastName = 'Brown';


SELECT * FROM Employee;

SELECT * FROM Employee WHERE Salary > 65000;


SELECT * FROM Employee WHERE HireDate > '2022-01-01';

SELECT * FROM Employee WHERE Department = 'IT';
