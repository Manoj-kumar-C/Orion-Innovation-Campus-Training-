CREATE TABLE Books (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT,
    PublishedDate DATE
);


GO  -- Ensure this is the first statement in its batch

CREATE PROCEDURE ManageBooks
    @Action VARCHAR(10),
    @BookID INT = NULL,
    @Title VARCHAR(255) = NULL,
    @Author VARCHAR(255) = NULL,
    @Genre VARCHAR(100) = NULL,
    @Price DECIMAL(10, 2) = NULL,
    @Stock INT = NULL,
    @PublishedDate DATE = NULL,
    @SearchTerm VARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'ADD'
    BEGIN
        INSERT INTO Books (Title, Author, Genre, Price, Stock, PublishedDate)
        VALUES (@Title, @Author, @Genre, @Price, @Stock, @PublishedDate);
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE Books
        SET Title = @Title,
            Author = @Author,
            Genre = @Genre,
            Price = @Price,
            Stock = @Stock,
            PublishedDate = @PublishedDate
        WHERE BookID = @BookID;
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM Books
        WHERE BookID = @BookID;
    END
    ELSE IF @Action = 'GET'
    BEGIN
        SELECT * FROM Books
        WHERE Title LIKE '%' + @SearchTerm + '%'
           OR Author LIKE '%' + @SearchTerm + '%';
    END
    ELSE
    BEGIN
        RAISERROR('Invalid action specified.', 16, 1);
    END
END;


-- Add a new book
EXEC ManageBooks 
    @Action = 'ADD', 
    @Title = 'Atomic Habits', 
    @Author = 'James Clear', 
    @Genre = 'Self-help', 
    @Price = 19.99, 
    @Stock = 50, 
    @PublishedDate = '2018-10-16';

-- Update a book
EXEC ManageBooks 
    @Action = 'UPDATE', 
    @BookID = 1, 
    @Title = 'Atomic Habits (Updated)', 
    @Author = 'James Clear', 
    @Genre = 'Self-help', 
    @Price = 18.99, 
    @Stock = 45, 
    @PublishedDate = '2018-10-16';

-- Delete a book
EXEC ManageBooks 
    @Action = 'DELETE', 
    @BookID = 1;

-- Search books by title or author
EXEC ManageBooks 
    @Action = 'GET', 
    @SearchTerm = 'James';
