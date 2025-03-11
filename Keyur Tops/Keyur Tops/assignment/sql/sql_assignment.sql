create database tps_sql;
use tps_sql;

#1) Statement to create the Contact table

create table contact(
c_id int,
cmp_id int,
f_name varchar(45),
l_name varchar(45),
street varchar(45),
city varchar(45),
state varchar(23),
zip varchar(20),
ismain boolean,
email varchar(45),
phone varchar(12));


INSERT INTO contact (c_id, cmp_id, f_name, l_name, street, city, state, zip, ismain, email, phone)
VALUES
(1, 1, 'Dianne', 'Connor', '123 Elm St', 'Los Angeles', 'CA', '90001', TRUE, 'dianne.connor@example.com', '3105551234'),
(2, 2, 'Jack', 'Lee', '456 Maple St', 'New York', 'NY', '10001', FALSE, 'jack.lee@example.com', '2125555678'),
(3, 3, 'Jane', 'Doe', '789 Oak St', 'Chicago', 'IL', '60601', FALSE, 'jane.doe@example.com', '7735559876');

# 2) Statement to create the Employee table 

create table employee(
emp_id int,
f_name varchar(45),
l_name varchar(45),
salary decimal(10,2),
hiredate date,
jobtitle varchar(25),
email varchar(45),
phone varchar(12));

INSERT INTO employee (emp_id, f_name, l_name, salary, hiredate, jobtitle, email, phone)
VALUES
(1, 'Keyur', 'Patel', 100000.00, '2020-06-02', 'Sales Associate', 'keyur3036@gmail.com', '6353941899'),
(2, 'Dianne', 'Connor', 85000.00, '2019-03-15', 'Marketing Specialist', 'dianne.connor@example.com', '3105551234'),
(3, 'Lesley', 'Bland', 75000.00, '2018-01-20', 'HR Manager', 'lesley.bland@example.com', '2155555678');


#3) Statement to create the ContactEmployee table  

CREATE TABLE ContactEmployee (
    ContactID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ContactName VARCHAR(50),
    ContactDate DATE
);
INSERT INTO ContactEmployee (ContactID, EmployeeName, ContactName, ContactDate)
VALUES
(1, 'Dianne Connor', 'Jack Lee', '2024-11-01'),
(2, 'John Smith', 'Dianne Connor', '2024-11-02'),
(3, 'Dianne Connor', 'Jane Doe', '2024-11-03'),
(4, 'Jack Lee', 'Mark Taylor', '2024-11-04'),
(5, 'Keyur Patel', 'Toll Brothers', '2024-11-05'),
(6, 'Lesley Bland', 'Toll Brothers', '2024-11-06');

######
CREATE TABLE company (
    cmp_id INT PRIMARY KEY,
    cmp_name VARCHAR(45),
    street VARCHAR(45),
    city VARCHAR(12),
    zip VARCHAR(10)
);

INSERT INTO company (cmp_id, cmp_name, street, city, zip)
VALUES
(1, 'Urban Outfitters, Inc.', '987 Fashion Ave', 'Philadelphia', '19103'),
(2, 'Toll Brothers', '123 Builder Ln', 'New York', '10001'),
(3, 'Google', '1600 Amphitheatre Pkwy', 'ahmedabad', '94043');

#4) In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800 
update employee set phone=215-555-8800 where emp_id=1;

#5) In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters”
update company set cmp_name='Urban Outfitters' where cmp_name='Urban Outfitters, Inc.';

#6) In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement). 
delete FROM ContactEmployee where EmployeeName = 'Dianne Connor' AND ContactName = 'Jack Lee';

#7) Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
#MySQL Workbench. Copy the results below as well. 
SELECT EmployeeName FROM ContactEmployee WHERE ContactName = 'toll Brothers';

#8) What is the significance of “%” and “_” operators in the LIKE statement? 
/* 
The % and _ operators are wildcards used in the LIKE statement for pattern matching in SQL:

%: Matches zero or more characters.
Example: LIKE 'A%' finds words starting with "A" (ex- , Apple, Axe).

_: Matches exactly one character.
Ex: LIKE 'A_' finds two-letter words starting with "A" (ex- , An, At).        
*/

#9) Explain normalization in the context of databases. 
/*
Normalization in databases is the process of organizing data to reduce redundancy and improve efficiency. 
It divides large tables into smaller, related ones and establishes relationships between them.
This ensures data consistency, avoids duplication, and simplifies updates.
*/

#10) What does a join in MySQL mean?
/*
A join in MySQL combines data from two or more tables based on a related column. It helps retrieve information from multiple tables in a single query.

Types of Joins:
INNER JOIN: Returns matching rows from both tables.
LEFT JOIN: Returns all rows from the left table and matching rows from the right.
RIGHT JOIN: Returns all rows from the right table and matching rows from the left.

EX :-
SELECT orders.order_id, customers.name 
FROM orders 
INNER JOIN customers ON orders.customer_id = customers.id;

*/

#11) What do you understand about DDL, DCL, and DML in MySQL?

/*
1) DDL (Data Definition Language): Used to define and modify the structure of a database. It includes commands like CREATE (to create tables), 
ALTER (to modify existing tables), and DROP (to delete tables or databases).

2) DCL (Data Control Language): Manages access control and permissions for users. It includes GRANT (to give permissions) and 
REVOKE (to remove permissions) to control who can access and modify the database.

3) DML (Data Manipulation Language): Deals with the manipulation of data within the tables. It includes SELECT (to retrieve data), 
INSERT (to add new data), UPDATE (to modify existing data), and DELETE (to remove data).
*/

#12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?

/*
The JOIN clause in MySQL is used to combine data from two or more tables based on a related column, allowing you to retrieve data spread across different tables in a single query.

Common Types of Joins:

INNER JOIN: Returns only the rows that have matching values in both tables. If there’s no match, no data is returned.
Ex: Finding all orders and their corresponding customer names where a match exists.

LEFT JOIN (or LEFT OUTER JOIN): Returns all rows from the left table, and matching rows from the right table. If there’s no match, 
the result will include NULL for the right table.
Ex: Getting all customers and their orders, even if some customers have no orders (NULL values for order details).

RIGHT JOIN (or RIGHT OUTER JOIN): Returns all rows from the right table, and matching rows from the left table. If no match is 
found, NULL is returned for the left table.
Ex: Getting all orders and their customers, even if some orders have no customer linked.

FULL JOIN (not natively supported in MySQL, but can be simulated): Returns all rows when there’s a match in either table.
Example: A combination of LEFT JOIN and RIGHT JOIN to show all records from both tables.
*/

