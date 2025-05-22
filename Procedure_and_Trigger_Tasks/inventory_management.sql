-- Create tables
CREATE TABLE Items (
    ItemID INT IDENTITY(1,1) PRIMARY KEY,
    ItemName VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT,
    LastUpdated DATETIME DEFAULT GETDATE()
);

CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    ItemID INT FOREIGN KEY REFERENCES Items(ItemID),
    QuantitySold INT,
    SaleDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE InventoryAudit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    ItemID INT,
    OldStock INT,
    NewStock INT,
    ChangeDate DATETIME DEFAULT GETDATE()
);

GO  -- 🔁 This separates the batch

-- Create the trigger
CREATE TRIGGER UpdateInventoryOnSale
ON Sales
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the stock
    UPDATE I
    SET 
        I.Stock = I.Stock - S.QuantitySold,
        I.LastUpdated = GETDATE()
    FROM 
        Items I
    INNER JOIN 
        inserted S ON I.ItemID = S.ItemID;

    -- Insert into InventoryAudit
    INSERT INTO InventoryAudit (ItemID, OldStock, NewStock, ChangeDate)
    SELECT 
        I.ItemID,
        I.Stock + S.QuantitySold,
        I.Stock,
        GETDATE()
    FROM 
        Items I
    INNER JOIN 
        inserted S ON I.ItemID = S.ItemID;
END;
