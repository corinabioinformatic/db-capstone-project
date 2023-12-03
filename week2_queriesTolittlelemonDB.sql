USE littlelemondb;

/*Task 1*/
CREATE VIEW OrdersView  AS
(SELECT OrderID, Quantity, TotalCost
FROM orders
WHERE Quantity >=2 );

SELECT * FROM OrdersView;


/*Task 2
    Customers table: The customer id and full name.
    Orders table: The order id and cost.
    Menus table: The menus name.
    MenusItems table: course name and starter name.
The result set should be sorted by the lowest cost amount.
*/

SELECT * FROM  Orders ;

WITH
	custoselection AS
		(SELECT Customers.CustomerID,
			CONCAT(Customers.FirstName,' ',Customers.LastName) AS FullName
		FROM Customers),
	orderselection AS
		(SELECT Orders.OrderID , 
			Orders.TotalCost,
            Orders.CustomerID AS joinCustomerID
            FROM Orders),
	menuselection AS 
		( SELECT Menu.MenuName,
				Menu.MenuID,
                Menu.OrderID AS joinOrderID
        FROM Menu
        ),
	menuitemselection AS
		( SELECT MenuItems.CourseName,
        MenuItems.StarterName,
        MenuItems.MenuID AS joinMenuID
        FROM MenuItems
        )
SELECT CustomerID, FullName, OrderID, TotalCost, MenuName, CourseName
	FROM custoselection
LEFT JOIN orderselection
ON custoselection.CustomerID = orderselection.joinCustomerID
JOIN menuselection
ON orderselection.OrderID = menuselection.joinOrderID
JOIN  menuitemselection
ON menuselection.MenuID = menuitemselection.joinMenuID
WHERE TotalCost >150
ORDER BY TotalCost;


/* Task 3
 Little Lemon need you to find all menu items for which more than 2 orders have been placed.
 You can carry out this task by creating a subquery that lists the menu names from the menus table for any order quantity with more than 2.
Here’s some guidance around completing this task: 
    Use the ANY operator in a subquery
    The outer query should be used to select the menu name from the menus table.
    The inner query should check if any item quantity in the order table is more than 2. 
*/

SELECT * FROM Menu;

WITH countorderspermenu AS 
		(SELECT OrderID, COUNT(MenuID) AS totalorders
		FROM Menu
		GROUP BY OrderID
		HAVING COUNT(MenuID) >=2
		),
	menuidorderidtable AS 
		(SELECT MenuID,
        MenuName,
		OrderID 
		FROM Menu
		WHERE OrderID IN (SELECT OrderID FROM countorderspermenu)
        )
	SELECT MenuName
    FROM menuidorderidtable 
    LEFT JOIN MenuItems
    ON menuidorderidtable.MenuID = MenuItems.MenuID;
    
    





