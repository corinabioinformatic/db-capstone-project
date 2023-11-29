SELECT * FROM littlelemondb.customers;
-- Do not check foreign key constraints (required to insert  rows in child tables)
SET FOREIGN_KEY_CHECKS=0;

SELECT * FROM littlelemondb.orders;

SELECT * FROM littlelemondb.menu;

SELECT * FROM littlelemondb.menuitems;

SELECT * FROM littlelemondb.bookings;

SELECT * FROM littlelemondb.orderdeliverystatus;

SELECT * FROM littlelemondb.staff;

-- Specify to check foreign key constraints (this is the default)
SET FOREIGN_KEY_CHECKS = 1;
