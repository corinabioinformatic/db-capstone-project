/* 

----- Creating Procedures  

DELIMITER //

CREATE PROCEDURE ProcedureName (OUT parameter INT, IN parameter INT)  
BEGIN   
SELECT statement1_name;
SELECT statement2_name;
END //

DELIMITER;

CALL ProcedureName;

---- Prepared STATEMENTS 

PREPARE statement_Name 'INSERT INTO table1 VALUES (?, ?, ?, ?)';


EXECUTE statement_name USING @variable;

*/

/*
TASK 1
create a procedure that displays the maximum ordered quantity in the Orders table. 

*/
DROP PROCEDURE IF EXISTS GetMaxQuantity;

DELIMITER //

CREATE PROCEDURE GetMaxQuantity ()
BEGIN
SELECT Quantity AS 'Max Quantity in Order'
FROM Orders 
ORDER BY Quantity DESC;
END //

DELIMITER ;

CALL GetMaxQuantity();


/* TASK 2

 Little Lemon need you to help them to create a prepared statement called GetOrderDetail. 
-The prepared statement should accept one input argument, the CustomerID value, from a variable. 
-The statement should return the order id, the quantity and the order cost from the Orders table. 
Once you create the prepared statement, you can create a variable called id and assign it value of 1. 
Then execute the GetOrderDetail prepared statement using the following syntax:
 */

PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE CustomerID = (?) ';



SET @id = 1;
EXECUTE GetOrderDetail USING @id;

SET @id = 'C001';
EXECUTE GetOrderDetail USING @id;


/*TASK 3
create a stored procedure called CancelOrder. 
Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id.
Creating this procedure will allow Little Lemon to cancel any order by specifying the order id value in the procedure parameter without typing the entire SQL delete statement.   
*/

DROP PROCEDURE IF EXISTS CancelOrder;

/*INSERT orderid O004 before running this code, if not, nothing to delete*/

DELIMITER //

CREATE PROCEDURE CancelOrder (IN order_id INT, OUT successdeletion VARCHAR(24) )
BEGIN
	SET SQL_SAFE_UPDATES = 0;
    DELETE FROM Orders WHERE OrderID = CONCAT('O00',order_id) ;
	SET SQL_SAFE_UPDATES = 1;
    SET successdeletion = CONCAT('Order ' ,order_id,' cancelled');
END //

DELIMITER ;

CALL CancelOrder(4, @result);

SELECT @result;