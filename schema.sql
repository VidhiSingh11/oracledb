
-- Schema creation for Online Bookstore Management System

-- Table for storing book details
CREATE TABLE Books (
    BookID NUMBER PRIMARY KEY,
    Title VARCHAR2(100),
    Author VARCHAR2(100),
    Price NUMBER,
    Stock NUMBER,
    PublishedDate DATE
);

-- Table for storing customer details
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    Email VARCHAR2(100),
    Phone VARCHAR2(15),
    Address VARCHAR2(200)
);

-- Table for storing order details
CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    CustomerID NUMBER REFERENCES Customers(CustomerID),
    OrderDate DATE,
    TotalAmount NUMBER
);

-- Table for storing order line items
CREATE TABLE OrderItems (
    OrderItemID NUMBER PRIMARY KEY,
    OrderID NUMBER REFERENCES Orders(OrderID),
    BookID NUMBER REFERENCES Books(BookID),
    Quantity NUMBER,
    LineTotal NUMBER
);

-- Table for sales summary
CREATE TABLE Sales (
    SalesID NUMBER PRIMARY KEY,
    BookID NUMBER REFERENCES Books(BookID),
    SalesDate DATE,
    QuantitySold NUMBER,
    TotalSales NUMBER
);

-- Triggers, Procedures, and Functions
