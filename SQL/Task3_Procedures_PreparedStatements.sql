-- Task 1
DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS "Max Quantity in Order"
    FROM Orders;
END //

DELIMITER ;

CALL GetMaxQuantity();

-- Task 2
PREPARE GetOrderDetail FROM
'SELECT OrderID, Quantity, TotalCost
 FROM Orders
 WHERE CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3
DELIMITER //

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM Orders
    WHERE OrderID = order_id;

    SELECT CONCAT('Order ', order_id, ' is cancelled') AS Confirmation;
END //

DELIMITER ;

CALL CancelOrder(1);