-- SQL schema for Azure SQL Database

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL
);

INSERT INTO Users (UserName, Email)
VALUES ('Test User', 'test@example.com');
