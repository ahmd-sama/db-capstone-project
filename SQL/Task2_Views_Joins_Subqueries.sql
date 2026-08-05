-- Task 1
CREATE VIEW OrdersView AS
SELECT
    OrderID,
    Quantity,
    TotalCost
FROM Orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;

-- Task 2
SELECT
    c.CustomerID,
    c.FullName,
    o.OrderID,
    o.TotalCost,
    m.MenuName,
    mi.ItemName,
    mi.Category
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Menu m
    ON o.MenuID = m.MenuID
INNER JOIN MenuItems mi
    ON m.MenuItemID = mi.MenuItemID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;

-- Task 3
SELECT MenuName
FROM Menu
WHERE MenuID = ANY (
    SELECT MenuID
    FROM Orders
    WHERE Quantity > 2
);