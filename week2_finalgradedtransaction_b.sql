/* Week2 Table BOOKING SYSTEM */


/*  TASK 1
 pass also bookingid, customerid, tableno and date of booking
*/

USE littlelemondb; 

SELECT * FROM Bookings;


DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //


CREATE PROCEDURE AddBooking(
                                IN inputcustomerid INT, -- IN inputbookingid INT,  we omit Booking ID because this table is autoincremental
                                IN inputtablenumber INT, 
                                IN inputbookingdate DATETIME, 
                                OUT statusofproced VARCHAR(64)
                                )
BEGIN
	-- DECLARE hereyourcustomerinputidtemp INT DEFAULT 5;
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
			
			-- SET hereyourcustomerinputidtemp = 5 ; -- just for this example
			SET statusofproced = CONCAT('table ',inputtablenumber, ' is available for your date');
            INSERT INTO Bookings(CustomerID,TableNo, DateBooking)
			VALUES(inputcustomerid, inputtablenumber,inputbookingdate);
			COMMIT;
	END IF;
    
END//

DELIMITER ;


CALL AddBooking(3,4,'2022-12-30', @statusbooking); -- we omit booking ID because this table is autoincremental!
SELECT @statusbooking;
   
   
/* Task 2 

For your second task, Little Lemon need you to create a new procedure called UpdateBooking that 
they can use to update existing bookings in the booking table.
The procedure should have two input parameters in the form of booking id and booking date.
 You must also include an UPDATE statement inside the procedure. 
The screenshot below shows an example of the UpdateBooking procedure in use.

*/

SELECT * FROM Bookings;

DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //

CREATE PROCEDURE UpdateBooking(
                                IN inputbookingid INT, 
                                IN inputbookingdate DATETIME, 
                                OUT statusofproced VARCHAR(64)
                                )
BEGIN
	-- DECLARE hereyourcustomerinputidtemp INT DEFAULT 5;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;  -- rollback any error in the transaction
        RESIGNAL;
    END;
	START TRANSACTION;
		
		IF (
			SELECT TableNo FROM Bookings 
			WHERE DateBooking = inputbookingdate 
			AND BookingID = inputbookingid
		) THEN
			SET statusofproced = CONCAT('you already had this booking done for ',inputbookingdate);
			ROLLBACK;
		ELSE
			
			-- SET hereyourcustomerinputidtemp = 5 ; -- just for this example
			SET statusofproced = CONCAT('Booking ',inputbookingid,' updated! Booking date updated to ',inputbookingdate);
            UPDATE Bookings
			SET DateBooking = inputbookingdate
            WHERE BookingID= inputbookingid ;
			COMMIT;
	END IF;
    
END//

DELIMITER ;


CALL UpdateBooking(9,'2022-12-17', @statusbooking); -- we omit booking ID because this table is autoincremental!
SELECT @statusbooking;
   
/*Task 3

For the third and final task, Little Lemon need you to create a new procedure called CancelBooking that they can use to cancel or remove a booking.
The procedure should have one input parameter in the form of booking id. You must also write a DELETE statement inside the procedure. 
When the procedure is invoked, the output result should be similar to the following screenshot:

*/

SELECT * FROM Bookings;

DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //

CREATE PROCEDURE CancelBooking(
                                IN inputbookingid INT, 
                                OUT statusofproced VARCHAR(64)
                                )
BEGIN
	-- DECLARE hereyourcustomerinputidtemp INT DEFAULT 5;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;  -- rollback any error in the transaction
        RESIGNAL;
    END;
	START TRANSACTION;
		
		IF (
			SELECT BookingID FROM Bookings 
			WHERE BookingID =inputbookingid
		) THEN
			-- SET hereyourcustomerinputidtemp = 5 ; -- just for this example
			SET statusofproced = CONCAT('Booking ',inputbookingid,' canceled!');
            DELETE FROM Bookings
            WHERE BookingID= inputbookingid ;
			COMMIT;
		ELSE
			SET statusofproced = CONCAT('This booking does not exist: ',inputbookingid);
			ROLLBACK;
			
	END IF;
    
END//

DELIMITER ;





CALL CancelBooking(9, @statusbooking);
SELECT @statusbooking;

 