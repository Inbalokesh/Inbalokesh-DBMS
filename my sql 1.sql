-- SQL is case-insensitive

/*
Ww will follow
UPPERCASE: Keywords
lowercase: non-keywords 
*/

USE exercise_hr;

SHOW TABLES;


-- Semicolon comes in the end of the query --
USE store;

SELECT *
FROM customers;

SELECT *
FROM customers
ORDER BY first_name;

SELECT *
FROM customers
ORDER BY last_name DESC;

USE exercise_hr;

SELECT *
FROM employees;

SELECT *
FROM employees
ORDER BY first_name DESC;

SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary ASC;

SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY employee_id ASC, salary DESC;

SELECT 200*10 AS value;

USE store;

SELECT *
FROM customers;

SELECT first_name,last_name,points
FROM customers;

/*
SELECT <column_1>,<column_2>,<column_3>.......<column_n>,
FROM <table_name>;

*/

SELECT first_name,last_name,points,points * 1.1 AS 'discount_pattern'
FROM customers;

SELECT birth_date
FROM customers;

/*
DATA types:
Strings, numbers, dates 

*/

SELECT BIRTH_DATE,TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS AGE
FROM customers;

SELECT DISTINCT state
FROM customers;

/*
SELECT DISTINCT state
FROM customers;
*/

-- 1 
-- SELECT 171*214+625 AS value;

-- 2
-- SELECT 

-- 3   

-- 4

USE store;
SELECT *
FROM customers
WHERE points > "3000" or birth_date >= '1990-01-01' ;

SELECT *
FROM customers
WHERE birth_date > '1990-01-01' or points > "3000" AND state = 'VA' ;

SELECT *
FROM customers
WHERE points < 4000 or birth_date >= '1990-01-01'  and state = 'VA';

SELECT *
FROM customers
WHERE points < 4000 AND birth_date >= '1990-01-01' OR state = 'VA';

SELECT *
FROM customers
WHERE NOT (state = 'FL');

-- ORDER of the logical operators
-- 1. AND
-- 2. OR
-- 3. NOT

USE exercise_hr;
SELECT hire_date
From employees;

USE exercise_hr;
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = '1987-01-01'OR'1987-12-12';

USE exercise_hr;
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = '1987-01-01'OR'1987-12-12';

SELECT first_name, last_name, salary
FROM employees
WHERE salary >= 10000 AND salary <= 15000;

use store;
SELECT *
FROM customers
WHERE state = 'FL' or state = 'VA' or state = 'GA';

-- shortcut
SELECT *
FROM customers
WHERE state IN ('FL','VA','GA'); 

-- Exercise 1.1 
SELECT *
FROM products
WHERE quantity_in_stock IN (49,38,72); 

SELECT *
FROM customers
WHERE birth_date BETWEEN ('1990-01-01') AND ('2000-01-01') ; 

SELECT *
FROM customers
WHERE address LIKE '%trail' OR address LIKE '%avenue'; 

SELECT *
FROM customers
WHERE phone NOT LIKE '%9'; 

SELECT *
FROM customers
WHERE first_name LIKE 'ELKA' OR first_name LIKE 'AMBUR'; 

SELECT *
FROM customers
WHERE last_name LIKE '%Ey' OR last_name LIKE '%On'; 

SELECT *
FROM customers
WHERE last_name LIKE 'My%' OR last_name LIKE '%SE%'; 

SELECT *
FROM customers
WHERE last_name LIKE 'My' OR last_name LIKE '%SE%'; 

SELECT *
FROM customers
WHERE last_name LIKE '%br%' OR last_name LIKE '%bu%'; 

SELECT *
FROM customers
WHERE last_name LIKE "_____y"; 

SELECT *
FROM customers
WHERE last_name LIKE "%"; 

SELECT *
FROM customers
WHERE state LIKE "%A"; 

SELECT *
FROM customers
WHERE last_name LIKE "b____y"; 

SELECT *
FROM orders
WHERE status = '1';

SELECT *
FROM order_items
ORDER BY unit_price desc;

SELECT *
FROM customers
ORDER BY points desc limit 3;

SELECT *
FROM customers
WHERE last_name REGEXP "field$|^Mac|rose";

USE store;
SELECT *
FROM customers
WHERE last_name REGEXP 'age' ;

USE store;
SELECT *
FROM customers
WHERE last_name REGEXP 'ae|be|ce|de|ee|fe|ge|he';

SELECT *
FROM customers
WHERE last_name REGEXP '[abcdefgh]e';

SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e';

SELECT *
FROM customers
WHERE last_name REGEXP '^[a-z]{6}$';

-- REGEXP equivalent to _ and % used in the LIKE query
-- .- : _ 
-- .* : %

SELECT *
FROM customers
WHERE last_name REGEXP '^[a-z]{6}$';

USE exercise_hr;

SELECT *
FROM employees
WHERE last_name REGEXP 'b.*[ru]'; 

SELECT *
from departments
order BY department_name asc;

SELECT *
FROM employees
WHERE last_name REGEXP 'b.*[ru]'; 

USE store;
SELECT *
from customers
ORDER BY points desc LIMIT 3;

SELECT *
FROM customers;

-- EXPLAIN
USE store;

SELECT *
FROM customers;

USE exercise_hr;

SELECT *
FROM employees
WHERE first_name = 'Lex';

EXPLAIN
SELECT *
FROM employees
WHERE last_name = 'De Haan';

SELECT *
FROM employees
order bY last_name;

-- Full row type accces type all(high)
-- Primary key type acces const(low)
-- Reference key type access reference(medium)
 
SELECT COUNT(*) AS 'number of employees'
FROM employees;

CREATE DATABASE IF NOT EXISTS only_home_food;

USE only_home_food;

/*
CRETE TABLE tablename (
column 1 COLUMN1_DATATYPE(size) CONSTRAINTS,
column 2 COLUMN2_DATATYPE(size) CONSTRAINTS,
*/

CREATE TABLE IF NOT EXISTS user(
userid VARCHAR(50),
username VARCHAR(50) PRIMARY KEY,
email VARCHAR(100),
address VARCHAR(200),
password VARCHAR(50),
phone VARCHAR(20)
); 

/*
Numbers: INT, BIGINT
Decimal numbers (eg. 3.14) : DOUBLE
Strings: 
-- if fixed length : CHAR(2)
--if variable length: VARCHAR(255)
date: DATE
date:DATE
Datetime:DATETIME
Boolean:TINYINT
*/

DESCRIBE user;

-- CREATE TABLE user (
-- );

-- ADD table
ALTER TABLE user
ADD whatsapp_no INT;

-- MODIFY table
ALTER TABLE user
MODIFY whatsapp_no VARCHAR(20);

-- Rename a column name
ALTER TABLE user
RENAME COLUMN username TO user_name;

-- Delete a column
ALTER TABLE user
DROP whatsapp_no;

-- CONSTRAINTS *****
-- NOT NULL
-- UNIQUE
-- PRIMARY KEY
-- FOREIGN KEY
-- DEFAULT
-- CHECK

DESCRIBE user;

-- Read the table
SELECT *
FROM user; 

-- DELETE ALL ROWS
DELETE FROM user;

-- Insert users into the user table
INSERT INTO user (userid, user_name, email, address, password, phone)
VALUES
("user7", "Thamim", "thamim@gmail.com", "Chennai", "1234", "1234567897"),
("user8", "Raj", "raj@gmail.com", "Chennai", "1234", "1234567898"),
("user9", "Mardhu", "marudhu@gmail.com", "Chennai", "1234", "1234567899"),
("user10", "King", "king@gmail.com", "Chennai", "1234", "1234567811");

-- UPDATE TABLE values

UPDATE user
SET userid = "user6"
WHERE user_name = "Ram";

-- DELETE TABLE

DELETE FROM user
WHERE user_name ="KONG";

SELECT *
from user
order by userid;

-- Find the Employes who work in IT
use exercise_hr;

SELECT Department_ID
from departments
WHERE DEPARTMENT_NAME = "IT";

Select *
from employees
Where department_ID = 60;

-- Query for the joint table
SELECT *
FROM employees INNER JOIN departments
ON employees.department_id = departments.department_id;

SELECT First_name, Last_name, department_Id, department_name
FROM employees INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE employees.department_name = "IT";

SELECT First_name, Last_name, e.department_Id, department_name
FROM employees AS e INNER JOIN departments AS d
ON e.department_id = d.department_id
WHERE department_name = "IT";

-- find the count of employees in every department

SELECT department_id, COUNT(*) AS "number of employees"
FROM employees
GROUP BY department_id;

SELECT *
FROM employees AS e INNER JOIN employees AS d
ON e.manager_Id = d.manager_ID;

SELECT e.employee_id AS "Employee ID",
CONCAT(e.first_name, e.last_name) AS "Employee_name",
m.employee_id AS "manager_id" , CONCAT (m.first_name, m.last_name) AS "Manager name"
FROM employees AS e INNER JOIN employees AS m
ON e.manager_Id = m.manager_ID;

-- Whenever we use Group by same has to be written in select before count

-- Write a query to find the name (first_name, last name), department ID and name of all the employees.

USE only_home_food;

SELECT *
FROM user;

CREATE TABLE IF NOT EXISTS product(
product_id VARCHAR(50) PRIMARY KEY,
product_image VARCHAR(50),
product_name VARCHAR(20),
product_price INT,
product_quantity VARCHAR(20),
product_type VARCHAR(20)
); 

CREATE TABLE IF NOT EXISTS cart(
product_id VARCHAR(50) PRIMARY KEY,
product_image VARCHAR(50),
product_name VARCHAR(20),
product_price INT,
product_quantity VARCHAR(20),
product_type VARCHAR(20)
); 



