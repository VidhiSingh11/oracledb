
-- Trigger to update book stock after an order is placed
CREATE OR REPLACE TRIGGER trg_update_stock
AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    UPDATE Books
    SET Stock = Stock - :NEW.Quantity
    WHERE BookID = :NEW.BookID;
END;
/

-- Stored Procedure to calculate the total cost of an order
CREATE OR REPLACE PROCEDURE CalculateOrderTotal(p_OrderID IN NUMBER) AS
    v_TotalAmount NUMBER;
BEGIN
    SELECT SUM(LineTotal)
    INTO v_TotalAmount
    FROM OrderItems
    WHERE OrderID = p_OrderID;

    UPDATE Orders
    SET TotalAmount = v_TotalAmount
    WHERE OrderID = p_OrderID;
END;
/

-- Function to apply discount on total order cost
CREATE OR REPLACE FUNCTION ApplyDiscount(p_OrderID IN NUMBER, p_DiscountPercentage IN NUMBER) RETURN NUMBER IS
    v_DiscountedTotal NUMBER;
    v_TotalAmount NUMBER;
BEGIN
    SELECT TotalAmount
    INTO v_TotalAmount
    FROM Orders
    WHERE OrderID = p_OrderID;

    v_DiscountedTotal := v_TotalAmount - (v_TotalAmount * p_DiscountPercentage / 100);
    RETURN v_DiscountedTotal;
END;
/
