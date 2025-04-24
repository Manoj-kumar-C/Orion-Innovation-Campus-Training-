CREATE TABLE EmployeeOp(
	EmployeeID INT PRIMARY KEY IDENTITY(1,1),
	EmployeeName VARCHAR(50) NOT NULL,
	Department VARCHAR(30) NOT NULL,
	Salary DECIMAL(10,2) NOT NULL,
	JoiningDate DATE NOT NULL
);

INSERT INTO EmployeeOp(EmployeeName, Department, Salary, JoiningDate)
VALUES
('Alice Johnson', 'IT', 60000.00, '2021-06-15'),
('Bob Smith', 'HR', 48000.00, '2019-03-20'),
('Charlie Adams', 'Finance', 72000.00, '2022-08-01'),
('Amit Verma', 'Administration', 55000.00, '2020-11-10'),
('Ananya Sharma', 'IT', 50000.00, '2023-01-12'),
('David Lee', 'Admin Support', 45000.00, '2021-01-01'),
('Eva Green', 'Marketing', 39000.00, '2018-12-05');



SELECT EmployeeID, EmployeeName, Department, Salary, JoiningDate
FROM EmployeeOp
WHERE Department = 'IT' AND Salary > 50000.00;


SELECT EmployeeID, EmployeeName, Department, Salary, JoiningDate
FROM EmployeeOp
WHERE Department = 'IT' OR Department = 'Finance';

SELECT EmployeeID, EmployeeName, Department, Salary, JoiningDate
FROM EmployeeOp
WHERE EmployeeName Like 'A%';


SELECT EmployeeID, EmployeeName, Department, Salary, JoiningDate
FROM EmployeeOp
WHERE EmployeeName Like '%va%';

SELECT * FROM EmployeeOp;



--- Between operator 

SELECT EmployeeID, EmployeeName, Department, Salary, JoiningDate
FROM EmployeeOp
WHERE Salary BETWEEN 45000.00 AND 60000.00;

SELECT EmployeeID, EmployeeName, Department, Salary, JoiningDate
FROM EmployeeOp
WHERE JoiningDate BETWEEN '2020-01-01' AND '2022-12-31';
