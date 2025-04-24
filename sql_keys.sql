

CREATE TABLE Classes (

	ClassID INT PRIMARY KEY,
	ClassName VARCHAR(30) NOT NULL,
	ClassTeacher VARCHAR(50) NOT NULL
);



CREATE TABLE Students(
	StudentID INT PRIMARY KEY,
	StudentName VARCHAR(50) NOT NULL,
	AGE INT NOT NULL,
	ClassID INT NOT NULL,
	FOREIGN KEY(ClassID) REFERENCES Classes(ClassID)
);


INSERT INTO Classes (ClassID, ClassName, ClassTeacher)
VALUES
(1, 'Grade 1', 'Mrs. Smith'),
(2, 'Grade 2', 'Mr. Johnson'),
(3, 'Grade 3', 'Ms. Davis');


INSERT INTO Students (StudentID, StudentName, Age, ClassID)
VALUES
(101, 'Alice Brown', 6, 1),
(102, 'Bob White', 7, 2),
(103, 'Charlie Green', 6, 1),
(104, 'Diana King', 8, 3);


SELECT 
    S.StudentID,
    S.StudentName,
    S.Age,
    C.ClassID,
    C.ClassName,
    C.ClassTeacher
FROM 
    Students S
INNER JOIN 
    Classes C ON S.ClassID = C.ClassID;
