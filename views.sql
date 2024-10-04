
-- View to generate a summary of sales
CREATE OR REPLACE VIEW vw_SalesSummary AS
SELECT b.Title, SUM(o.Quantity) AS TotalQuantitySold, SUM(o.LineTotal) AS TotalSalesAmount
FROM Books b
JOIN OrderItems o ON b.BookID = o.BookID
GROUP BY b.Title;
