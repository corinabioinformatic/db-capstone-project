/* Week2 Table BOOKING SYSTEM */


/* TASK 1: Insert new clients into bookings (autogenerated index)*/
USE littlelemondb;
SELECT * FROM Bookings;

INSERT INTO Bookings (BookingID, CustomerID, TableNo, DateBooking)
VALUES(1 ,1 , 5, '2022-10-10');
        
UPDATE Bookings
SET CustomerID = 3, TableNo = 3, DateBooking = '2022-11-12'
WHERE BookingID  = 2;

UPDATE Bookings
SET CustomerID = 2, TableNo =2 , DateBooking = '2022-10-11'
WHERE BookingID  = 3;

UPDATE Bookings
SET CustomerID = 1, TableNo =2 , DateBooking = '2022-10-13'
WHERE BookingID  = 4;


        
/* TASK 2 : Create a stored procedure 'CheckBooking' to check whether a table in the restaurant is already booked.
The procedure should have two input parameters in the form of booking date and table number. 
You can also create a variable in the procedure to check the status of each table.
The output of your procedure should be similar to the following  (see exercise).


 */
 

 

SELECT * FROM Bookings;
 
DROP PROCEDURE IF EXISTS CheckBooking;


DELIMITER //

CREATE PROCEDURE CheckBooking(IN daterepeated DATETIME, 
								IN tablenumberrepeated INT,
                                OUT statusout VARCHAR(100) 
							  )
BEGIN
	IF (
		SELECT TableNo FROM Bookings 
        WHERE DateBooking = daterepeated 
        AND TableNo = tablenumberrepeated
    ) THEN
		SET statusout = CONCAT('this table ',tablenumberrepeated,' is NOT available for your date');
	ELSE
		SET statusout = CONCAT('table ',tablenumberrepeated, ' is available for your date');
	END IF;
     
END //

DELIMITER ;


CALL CheckBooking('2022-11-12',3,@statusproc);
SELECT @statusproc;



/*Repeat the same, but this time will be called ManageBooking, instead of CheckBooking*/

DROP PROCEDURE IF EXISTS ManageBooking;


DELIMITER //

CREATE PROCEDURE ManageBooking(IN daterepeated DATETIME, 
								IN tablenumberrepeated INT,
                                OUT statusout VARCHAR(100) 
							  )
BEGIN
	IF (
		SELECT TableNo FROM Bookings 
        WHERE DateBooking = daterepeated 
        AND TableNo = tablenumberrepeated
    ) THEN
		SET statusout = CONCAT('this table ',tablenumberrepeated,' is NOT available for your date');
	ELSE
		SET statusout = CONCAT('table ',tablenumberrepeated, ' is available for your date');
	END IF;
     
END //

DELIMITER ;


CALL ManageBooking('2022-11-12',3,@statusproc);
SELECT @statusproc;











/* Task 3

For your third and final task, Little Lemon need to:
- verify a booking,
- and decline any reservations for tables that are already booked under another name. 

Since integrity is not optional, Little Lemon need to ensure that every booking attempt includes these verification and decline steps.
However, implementing these steps requires a stored procedure and a transaction. 

To implement these steps, you need to create a new procedure called AddValidBooking. 

This procedure must use a transaction statement to perform
 a rollback if a customer reserves a table that’s already booked under another name.  

Use the following guidelines to complete this task:
    The procedure should include two input parameters in the form of booking date and table number.
    It also requires at least one variable and should begin with a START TRANSACTION statement.
    Your INSERT statement must add a new booking record using the input parameter's values.

    Use an IF ELSE statement to check if a table is already booked on the given date. 

    If the table is already booked, then rollback the transaction. If the table is available, then commit the transaction. 

The screenshot below is an example of a rollback (cancelled booking), which was enacted because table number 5 is already booked on the specified date.

*/

SELECT * FROM Bookings;

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN inputbookingdate DATETIME, IN inputtablenumber INT, OUT statusofproced VARCHAR(64))
BEGIN
	DECLARE hereyourcustomerinputidtemp INT DEFAULT 5;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;  -- rollback any error in the transaction
        RESIGNAL;
    END;
	START TRANSACTION;
		
		IF (
			SELECT TableNo FROM Bookings 
			WHERE DateBooking = inputbookingdate 
			AND TableNo = inputtablenumber
		) THEN
			SET statusofproced = CONCAT('this table ',inputtablenumber,' is NOT available for your date');
			ROLLBACK;
		ELSE
			
			SET hereyourcustomerinputidtemp = 5 ; -- just for this example
			SET statusofproced = CONCAT('table ',inputtablenumber, ' is available for your date');
            INSERT INTO Bookings(CustomerID,TableNo, DateBooking)
			VALUES(hereyourcustomerinputidtemp, inputtablenumber,inputbookingdate);
			COMMIT;
	END IF;
    
END//

DELIMITER ;


CALL AddValidBooking('2022-12-17',6, @statusbooking);
SELECT @statusbooking;
   
CALL AddValidBooking('2022-10-11',2, @statusbooking);
SELECT @statusbooking;


 