
-- Creating indexes for optimization
CREATE INDEX idx_books_title ON Books(Title);
CREATE INDEX idx_customers_email ON Customers(Email);
CREATE INDEX idx_orders_customer ON Orders(CustomerID);
