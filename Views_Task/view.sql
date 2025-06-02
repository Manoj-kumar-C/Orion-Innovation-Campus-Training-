-- Ensure the tables exist before creating the view
-- If not already created, here is the table creation script:

CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    EnrollmentDate DATE
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName VARCHAR(255),
    Credits INT
);

CREATE TABLE Grades (
    GradeID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    Grade VARCHAR(2)
);

-- Now, create the view
CREATE VIEW StudentPerformance AS
SELECT 
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseName,
    c.Credits,
    g.Grade
FROM 
    Students s
INNER JOIN 
    Grades g ON s.StudentID = g.StudentID
INNER JOIN 
    Courses c ON g.CourseID = c.CourseID;
