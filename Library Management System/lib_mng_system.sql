-- Drop tables if they exist
IF OBJECT_ID('dbo.AvailableBooks', 'U') IS NOT NULL
    DROP TABLE dbo.AvailableBooks;

IF OBJECT_ID('dbo.BorrowedBooks', 'U') IS NOT NULL
    DROP TABLE dbo.BorrowedBooks;

-- 1. Create AvailableBooks table
CREATE TABLE AvailableBooks (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(100),
    LibraryBranch VARCHAR(100)
);

-- 2. Create BorrowedBooks table
CREATE TABLE BorrowedBooks (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(100),
    LibraryBranch VARCHAR(100),
    BorrowerName VARCHAR(255)
);

-- 3. Insert sample data into AvailableBooks
INSERT INTO AvailableBooks (Title, Author, Genre, LibraryBranch)
VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 'Central'),
('1984', 'George Orwell', 'Dystopian', 'Downtown'),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 'Central');

-- 4. Insert sample data into BorrowedBooks
INSERT INTO BorrowedBooks (Title, Author, Genre, LibraryBranch, BorrowerName)
VALUES
('1984', 'George Orwell', 'Dystopian', 'Downtown', 'Alice Smith'),
('Moby Dick', 'Herman Melville', 'Adventure', 'Uptown', 'Bob Johnson');

-- 5. UNION: All books (available and borrowed), without duplicates
SELECT Title, Author, Genre, LibraryBranch
FROM AvailableBooks
UNION
SELECT Title, Author, Genre, LibraryBranch
FROM BorrowedBooks;

-- 6. INTERSECT: Books that are both available and borrowed
SELECT Title, Author, Genre, LibraryBranch
FROM AvailableBooks
INTERSECT
SELECT Title, Author, Genre, LibraryBranch
FROM BorrowedBooks;

-- 7. EXCEPT: Books that are available but not borrowed
SELECT Title, Author, Genre, LibraryBranch
FROM AvailableBooks
EXCEPT
SELECT Title, Author, Genre, LibraryBranch
FROM BorrowedBooks;
