# Database-Capstone-project

_Author: Corina D_
_Specialization Data Engineer Meta_

Capstone project with MySQL, Python and Tableau - proposed by Meta. 

## Assignment instructions:

In this project you are required to create a data model for Little Lemon and deploy it in MySQL database. ✅
This will include a set of tables to store relevant information. ✅
Once you have completed this task, feel free to populate your tables with some records of you own data for testing purposes.✅

In addition you also need to analyze data using the following Little Lemon data file (In Tableau) ✅ <- data [here](https://github.com/corinabioinformatic/db-capstone-project/blob/main/EqSK5enRQCuwiucbZmZelA_27d5699c265a45b38d7a8155ed768be1_LittleLemon_data.xlsx)


Once you have created the appropriate models, database schema, and completed the data analysis in Tableau, you then need to commit the project to your GitHub and upload the link.

Your project is expected to include the following items:

* Relevant diagrams and screenshots in PNG format. ([LittleLemonDB.png](https://github.com/corinabioinformatic/db-capstone-project/blob/main/LittleLemonDM.png) and [LittleLemon_tables_views_storedproc.png](https://github.com/corinabioinformatic/db-capstone-project/blob/main/LittleLemon_tables_views_storedproc.png))

* The data model you produced in MySQL Workbench[LittleLemonDB_withNoCascadeFK_v2.mwb](https://github.com/corinabioinformatic/db-capstone-project/blob/main/LittleLemonDB_withNoCascadeFK_v2.mwb). 

* The SQL file of the Little Lemon database schema. To create use [LittleLemonDB_v1.sql](https://github.com/corinabioinformatic/db-capstone-project/blob/main/LittleLemonDB_v1.sql) and to fill use [createinsert_littlelemondb_v2.sql](https://github.com/corinabioinformatic/db-capstone-project/blob/main/createinsert_littlelemondb_v2.sql)

* The workbook that includes all worksheets and dashboards, in [tableau_capstone_week3.twb](https://github.com/corinabioinformatic/db-capstone-project/blob/main/tableau_capstone_week3.twb).


How to Review
Once you have submitted your own application, you are required to evaluate two projects submitted by your peers.

## Step by step (with screenshots)

Here the screenshoots running the exercises, so you wont get lost while seting up and running the statements from the database:

1. Examine the repository and locate the file LittleLemonDM.png. Does the image match the one provided below? See our [model](https://github.com/corinabioinformatic/db-capstone-project/blob/main/LittleLemonDM.png).



2. The cloned repository contains a procedure called **GetMaxQuantity()**. Call this procedure and verify that the result of Max Quantity in Order is 5. [Here our result](https://github.com/corinabioinformatic/db-capstone-project/blob/main/GetMaxQuantity_result.png)

3. Call the **ManageBooking()** procedure by passing the appropriate parameters. First with an available table number, then with one that has already been reserved. [Here our result](https://github.com/corinabioinformatic/db-capstone-project/blob/main/Call_ManageBooking_result.png) and [here](https://github.com/corinabioinformatic/db-capstone-project/blob/main/Call_ManageBooking2_result.png)

4.Use the Python client to connect to the database and create an instance of a cursor object. Create an SQL statement that calls the **AddBooking()** procedure and passes the parameters:  BookingID=99, CustomerID=99, TableNumber=99, BookingDate=2022-12-10
[Here our result](https://github.com/corinabioinformatic/db-capstone-project/blob/main/AddBooking99.png)

5.Use the Python client to connect to the database and create an instance of a cursor object. Create a SQL statement that calls the **UpdateBooking()** procedure and pass the following parameters: [Here our results](https://github.com/corinabioinformatic/db-capstone-project/blob/main/Call_UpdateBooking99_result.png)

6. Use the Python client to connect to the database and create an instance of a cursor object. Create a SQL statement that calls the **CancelBooking()** procedure and passes the following parameter:[Here our results](https://github.com/corinabioinformatic/db-capstone-project/blob/main/Call_CancelBooking99_13_result.png)


Please don't forget to leave a feedback in the exercise peer-review. so I could improve for the next iteration. Many thanks!





