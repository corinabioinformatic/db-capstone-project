USE littlelemondb;
SELECT * FROM Bookings;

/* Add values in all the tables :
-- Customers
-- Bookings
-- Orders
-- Menu
-- MenuItems
-- Staff
-- OrderStatus
*/

TRUNCATE TABLE Customers; -- Not possible to truncate a table rederenced in a foreign key

SELECT * FROM Customers;

INSERT INTO Customers (CustomerID, FirstName, LastName, PhoneNumber, Email)
VALUES(1, 'Ana', 'One', 0001, 'ana@dot.com'),
	(2, 'Bart', 'Two', 0002, 'bart@dot.com'),
    (3, 'Charlie', 'Three', 0003, 'charlie@dot.com'),
    (4, 'Dani', 'Four', 0004, 'dani@dot.com'),
    (5, 'Elon', 'Five', 0005, 'elon@dot.com');



TRUNCATE TABLE Bookings;


SELECT * FROM Bookings;

/*INSERT INTO Bookings (BookingID, CustomerID, TableNo, DateBooking)
VALUES(1, 1, 1, '2020-01-20'),
		(1, 2, 2, '2020-01-19'),
		(3, 3, 3, '2020-01-18'),
		(4, 4, 4, '2020-01-17'),
		(5, 5, 5, '2020-01-16'),
		(6, 4, 6, '2020-01-17');*/

INSERT INTO Bookings ( CustomerID, TableNo, DateBooking)
VALUES( 1, 1, '2020-01-20'),
		( 2, 2, '2020-01-19'),
		( 3, 3, '2020-01-18'),
		( 4, 4, '2020-01-17'),
		( 5, 5, '2020-01-16'),
		( 4, 6, '2020-01-17');

SELECT * FROM Orders; 

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Quantity, TotalCost)
VALUES(1, 1, '2020-01-20', 1, 100.00),
		(2, 2, '2020-01-19',2, 200.00),
		(3, 3, '2020-01-18', 3, 300.00),
		(4, 4, '2020-01-17', 4, 400.00),
		(5, 5,  '2020-01-16',3, 300.00),
		(6, 4, '2020-01-17',2, 200.00);
        
SELECT * FROM OrderDeliveryStatus; 

INSERT INTO OrderDeliveryStatus (OrderStatusID, OrderID, DeliveryStatus, DeliveryDate)
VALUES(1, 1, 'Delivered','2020-01-20'),
		(2, 2,'Delivered', '2020-01-19'),
		(3, 3, 'Delivered','2020-01-18'),
		(4, 4, 'Delivered','2020-01-17'),
		(5, 5,'Delivered',  '2020-01-16'),
		(6, 4,'In progress', '2020-01-17');
        

SELECT * FROM Menu; 

INSERT INTO Menu (MenuID, MenuName, OrderID, Cuisines)
VALUES(1, 'RiceWithChicken', 1, 'Korean'),
		(2, 'BaconQuiche' ,2,'French'),
		(3, 'OnigiriSalmon',3, 'Japanese'),
		(4, 'FriedRice',4, 'Nigerian'),
		(5, 'JamonConQueso',5,'Spanish'),
		(6, 'TikkaMasala' ,4,'Indian');
        

SELECT * FROM MenuItems; 

INSERT INTO MenuItems (MenuItemsID, CourseName, StarterName, DesertName, Drinks, MenuID)
VALUES(1, 'Rice', 'Chicken','IceCream','Tea',1),
		(2,'Bacon', 'Pasty','Camembert', 'OrangeJuice',2),
		(2, 'Rica', 'Salmon','RicePudding', 'Shake',3),
		(4,'Butter', 'Rica','Banana', 'Lemonade',4),
		(5, 'Jamon', 'Queso','Orange', 'Winde',5),
		(6, 'Chicken', 'Puree','Sweet', 'Water',6);
        
INSERT INTO MenuItems ( CourseName, StarterName, DesertName, Drinks, MenuID)
VALUES('Rice', 'Chicken','IceCream','Tea',1),
		('Bacon', 'Pasty','Camembert', 'OrangeJuice',2),
		('Rica', 'Salmon','RicePudding', 'Shake',3),
		('Butter', 'Rica','Banana', 'Lemonade',4),
		( 'Jamon', 'Queso','Orange', 'Winde',5),
		( 'Chicken', 'Puree','Sweet', 'Water',6);

SELECT * FROM Staff; 

INSERT INTO Staff (StaffID, FirstName, LastName, OrderID, Staffcol, Role, Salary)
VALUES(1, 'Antony', 'A',1,'','Chef',80.000),
		(2, 'Bert', 'B',2,'','Waitrose',70.000),
		(3 , 'Cole','C',3,'','Reception',50.000),
		(4, 'Drew', 'D',4,'','Chef',90.000),
		(5, 'Epsilon','E', 5,'','Waitrose',70.000),
		(6, 'Figaro','F', 6,'','Waitrose',75.000);

