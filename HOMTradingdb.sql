CREATE DATABASE HOMTrading;

USE HOMTrading;

CREATE TABLE Users (
    User_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Full_Name VARCHAR(255) NOT NULL,
    Username VARCHAR(100) UNIQUE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL, -- Store hashed passwords
    Role ENUM('Customer', 'Admin') NOT NULL
);

CREATE TABLE Stocks (
    Stock_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Company_Name VARCHAR(255) NOT NULL,
    Stock_Ticker VARCHAR(10) UNIQUE NOT NULL, -- Ticker symbols are usually short (e.g., AAPL, TSLA)
    Volume INTEGER NOT NULL,
    Initial_Price DECIMAL(10,2) NOT NULL,
    High_Price DECIMAL(10,2) NOT NULL,
    Low_Price DECIMAL(10,2) NOT NULL,
    Market_Capitalization BIGINT NOT NULL
);

CREATE TABLE Cash_Account (
    Cash_Account_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    User_ID INTEGER UNIQUE NOT NULL,
    Balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

CREATE TABLE Portfolio (
    Portfolio_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    User_ID INTEGER NOT NULL,
    Stock_ID INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    Total_Value DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE,
    FOREIGN KEY (Stock_ID) REFERENCES Stocks(Stock_ID) ON DELETE CASCADE
);

CREATE TABLE Market_Schedule (
    Schedule_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Open_Time TIME NOT NULL,
    Close_Time TIME NOT NULL,
    Weekday_Status ENUM('Open', 'Closed') NOT NULL,
    Holiday_Status ENUM('Open', 'Closed') NOT NULL
);

CREATE TABLE Transactions (
    Transaction_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    User_ID INTEGER NOT NULL,
    Stock_ID INTEGER NOT NULL,
    Transaction_Type ENUM('Buy', 'Sell') NOT NULL,
    Quantity INTEGER NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Transaction_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE,
    FOREIGN KEY (Stock_ID) REFERENCES Stocks(Stock_ID) ON DELETE CASCADE
);

INSERT INTO Users (Full_Name, Username, Email, Password, Role) -- inserting user information 
VALUES 
('Hailey Bernier', "hbern", "hbern@email.com", "Password1", "Admin");-- added myself as admin user.


INSERT INTO Stocks (Company_Name, Stock_Ticker, Volume, Initial_Price, High_Price, Low_Price, Market_Capitalization) -- inserting stock information 
VALUES
('Apple', 'AAPL', 1000, 149.11, 200.20, 100.12, 300000000000),
('Google', 'GOOG', 500, 2800.33, 3000.12, 2000.29, 200000000000),
('Tesla', 'TSLA', 300, 702.45, 800.44, 650.50, 100000000000)
AS new_data
ON DUPLICATE KEY UPDATE -- updatin data that is being entered so there are no duplicates 
	Company_Name = new_data.Company_Name,
    Volume = new_data.Volume,
    Initial_Price = new_data.Initial_Price,
    High_Price = new_data.High_Price,
    Low_Price = new_data.Low_Price,
    Market_Capitalization = new_data.Market_Capitalization;
    

