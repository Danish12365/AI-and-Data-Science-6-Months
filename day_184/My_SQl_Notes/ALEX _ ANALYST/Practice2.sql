
-- Deleting data in MySQL involves removing records from a table.

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO employees3 (employee_id, first_name, last_name, salary, department, location)
VALUES
(1, 'John', 'Doe', 60000.00, 'HR', 'New York'),
(2, 'Jane', 'Smith', 65000.00, 'Sales', 'Chicago'),
(3, 'Jim', 'Brown', 70000.00, 'IT', 'New York'),
(4, 'Jake', 'White', 55000.00, 'HR', 'Chicago'),
(5, 'Emily', 'Davis', 62000.00, 'Sales', 'New York'),
(6, 'Michael', 'Miller', 72000.00, 'IT', 'Chicago'),
(7, 'Sarah', 'Wilson', 58000.00, 'Sales', 'Chicago'),
(8, 'James', 'Taylor', 54000.00, 'HR', 'New York'),
(9, 'Laura', 'Thomas', 68000.00, 'IT', 'Chicago'),
(10, 'Robert', 'Jackson', 73000.00, 'Sales', 'New York');


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50),
    department_head VARCHAR(50)
);

INSERT INTO departments (department_id, department_name, location, department_head)
VALUES
(1, 'HR', 'New York', 'Anna Lee'),
(2, 'Sales', 'Chicago', 'Michael Smith'),
(3, 'IT', 'New York', 'David Johnson');


-- 1. Basic Syntax

--  DELETE FROM table_name WHERE condition;
-- 2. Example Usage

select * from employees3;
select * from departments;

SET SQL_SAFE_UPDATES = 0;

delete from employees3
where employee_id = 1;

-- 3. Deleting Multiple Rows

DELETE FROM employees3
WHERE department = 'Sales';

-- 4. Deleting All Rows

delete from employees3;

-- 5. Using Subqueries in DELETE

delete from employees3
where department in (select department_name from departments where location = 'New York');


select department_name from departments where location = 'New York';
select * from employees3 where location = 'New York';

-- 6. Deleting Data in Multiple Tables

delete employees3,departments
from employees3
join departments on employees3.department = departments.department_name
where departments.location = 'Chicago';
-- OR
DELETE e, d
FROM employees3 e
JOIN departments d ON e.department = d.department_name
WHERE d.location = 'Chicago';


-- 7. Safe Deletes and Transactions
-- When performing deletes, especially on a large scale, it’s advisable to use transactions to ensure data integrity.

START TRANSACTION;

DELETE FROM employees
WHERE department = 'HR';

-- Verify the deletion before committing
SELECT * FROM employees WHERE department = 'HR';

COMMIT; -- or ROLLBACK if something goes wrong


-- 8. Handling Errors
-- You can handle errors during deletion by using conditions and exception handling, especially in stored procedures.

DELIMITER //

CREATE PROCEDURE DeleteHR()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback in case of error
        ROLLBACK;
    END;

    START TRANSACTION;

    DELETE FROM employees
    WHERE department = 'HR';

    COMMIT;
END //

DELIMITER ;


-- 9. Using the LIMIT Clause

DELETE FROM employees
WHERE department = 'Sales'
LIMIT 3;

-- Casting in MySQL involves converting a value from one data type to another.
-- MySQL provides the CAST() and CONVERT() functions to perform these conversions.

-- Converting Numbers to Strings

select cast(123 as char);

-- 3.2 Converting Strings to Numbers

SELECT CAST('123.45' AS DECIMAL(5,2));

-- 3.3 Converting Strings to Dates

SELECT CAST('2024-08-24' AS DATE);

-- 3.4 Converting Dates to Strings

SELECT CAST(NOW() AS CHAR);

-- 3.5 Converting to Binary

SELECT CAST('Hello' AS BINARY);


-- 4. Using CONVERT()

-- 4.1 Converting Strings to Numbers

SELECT CONVERT('456' , SIGNED);


-- 4.2 Converting and Specifying Character Sets
SELECT CONVERT('Hello' USING utf8mb4);


-- 5. Practical Use Cases

select sum(cast(price as decimal(10,2))) as total_price 
from products;

-- 5.2 Comparing Different Data Types
-- Sometimes you need to compare values of different types, such as comparing a string to a number.
SELECT * FROM orders
WHERE CAST(order_id AS CHAR) = '1001';

-- 6. Handling Errors in Casting
-- If the conversion cannot be performed, MySQL may return an error or a NULL value.

SELECT CAST('abc' AS UNSIGNED);

-- 8. Example Scenario
-- Imagine a table transactions where the transaction_date is stored as a string, but you need to filter transactions for a specific date range.

SELECT *
FROM transactions
WHERE CAST(transaction_date AS DATE) BETWEEN '2024-08-01' AND '2024-08-31';

-- 9. Casting in Stored Procedures
-- In stored procedures, casting can be used to handle dynamic data types or when performing calculations.

DELIMITER //

CREATE PROCEDURE CalculateTotalRevenue()
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(CAST(amount AS DECIMAL(10,2))) INTO total
    FROM sales;
    SELECT total;
END //

DELIMITER ;


-- 1. Common Text Functions in MySQL

-- 2.1 Filtering Based on Case
-- Suppose you have a table customers and you want to filter out all customers whose names are stored in uppercase.

select * from customers
where upper(customerName) = customerName;


-- 2.2 Filtering Based on Length
-- You may want to filter rows based on the length of a string. For example, select all customers whose names are longer than 10 characters.

select * from customers
where LENGTH(customerName) > 10;


-- 2.3 Filtering Using Substrings
-- If you want to filter results based on a part of a string, you can use the SUBSTRING() function.

SELECT * FROM customers
WHERE SUBSTRING(phone, 3, 6) = '555';


-- 2.4 Filtering Using LIKE with Text Functions
-- The LIKE operator can be combined with text functions to filter rows based on patterns.

SELECT * FROM customers
WHERE UPPER(customerName) LIKE 'H%';


-- 2.5 Filtering Using INSTR()
-- You can use the INSTR() function to filter rows where a substring exists within a string.

SELECT * FROM customers
WHERE INSTR(email, '@gmail.com') > 0;



-- 2.6 Filtering Based on Replacement
-- To filter rows based on whether a specific substring can be replaced:

SELECT * FROM products
WHERE REPLACE(description, 'Free', '') <> description;


-- 3. Combining Multiple Filters
-- You can combine multiple text-based filters using AND or OR operators.


SELECT * FROM employees
WHERE LENGTH(last_name) > 5
AND LOWER(first_name) LIKE 'a%'
AND INSTR(email, 'company.com') > 0;


-- 4. Using Text Functions in ORDER BY
-- You can also use text functions in the ORDER BY clause to sort the results.

SELECT * FROM products
ORDER BY LENGTH(productName) DESC;


CREATE TABLE customers2 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(200)
);

INSERT INTO customers2 (customer_id, name, email, phone_number, address)
VALUES
(1, 'John Doe', 'john.doe@gmail.com', '555-1234', '123 Elm Street'),
(2, 'Jane Smith', 'jane.smith@company.com', '555-5678', '456 Oak Avenue'),
(3, 'Alice Johnson', 'alice.j@gmail.com', '555-8765', '789 Pine Road'),
(4, 'Bob Brown', 'bob@outlook.com', '555-4321', '321 Cedar Lane');


SELECT * FROM customers2
WHERE INSTR(email, '@gmail.com') > 0;


SELECT * FROM customers2
WHERE LENGTH(name) > 8;


SELECT * FROM customers2
WHERE name LIKE 'J%'
AND INSTR(phone_number, '123') > 0;


-- Concatenation in MySQL involves combining two or more strings into one continuous string. This is often used to merge text fields, create custom outputs, or format data for reporting or display purposes.


-- 1. Basic Concatenation with CONCAT()
select  concat(contactFirstName, ' ' ,contactLastName )
as full_name
from customers;


-- 2. Concatenating with Static Text
select concat('Customer: ', contactFirstName, ' ' ,contactLastName )
AS customer_details
FROM customers;

-- 3. Handling NULL Values with CONCAT()
-- When any of the arguments to CONCAT() are NULL, the result is NULL. However, MySQL provides the CONCAT_WS() function to handle this situation.

-- 4. Using CONCAT_WS() for Safe Concatenation

-- CONCAT_WS() stands for "Concatenate With Separator" and allows you to specify a separator between the strings you want to concatenate. Importantly, CONCAT_WS() ignores NULL values, 
-- which prevents NULL from causing the entire result to be NULL.


select concat_ws(', ', first_name, last_name, email) as custmer_info
from customers;

SELECT CONCAT_WS(', ', contactFirstName, contactLastName, city) AS customer_info
FROM customers;


-- 5. Practical Examples of Concatenation
SELECT CONCAT_WS(', ', phone, city, addressLine1, addressLine2,city, state, postalCode, country) AS full_address
FROM customers;


-- 5.2 Formatting Phone Numbers
-- Concatenation can also be used to format phone numbers.

SELECT CONCAT('(', SUBSTRING(phone, 1, 3), ') ', SUBSTRING(phone, 4, 3), '-', SUBSTRING(phone, 7)) AS formatted_phone
FROM customers;


-- 6. Combining Concatenation with Other Functions
-- You can combine CONCAT() with other MySQL functions to create complex string manipulations.

SELECT CONCAT(UPPER(contactFirstName), ' ', LOWER(contactLastName)) AS styled_name
FROM customers;

SELECT DATE_FORMAT(shippedDate, '%M %d, %Y') AS formatted_date
FROM orders;


SELECT DATE_FORMAT(shippedDate, '%M %d, %Y at %h:%i %p') AS formatted_datetime
FROM orders;


SELECT CONCAT(
    DATE_FORMAT(shippedDate, '%M %d, %Y'), ' at ', 
    TIME_FORMAT(shippedDate, '%h:%i %p')
) AS formatted_appointment
FROM orders;


SELECT CONCAT(DAY(shippedDate), '-', MONTH(shippedDate), '-', YEAR(shippedDate)) AS custom_date
FROM orders;


SELECT TIME_FORMAT(shippedDate, '%h:%i %p') AS formatted_time
FROM orders;


SELECT CONCAT('Order placed on ', 
              DATE_FORMAT(shippedDate, '%M %d, %Y'),
              ' at ', 
              TIME_FORMAT(shippedDate, '%h:%i %p')
) AS order_report
FROM orders;


-- NUMERIC FUNCTIONS

-- 1. ABS()
-- Description: Returns the absolute value of a number. The absolute value of a number is the non-negative value, regardless of the sign.

SELECT ABS(-15);  -- Output: 15
SELECT ABS(10);   -- Output: 10

-- 2. CEIL() or CEILING()
-- Description: Rounds a number up to the nearest integer. If the number is already an integer, it returns the same value.

SELECT CEIL(4.3);  -- Output: 5
SELECT CEIL(-4.8); -- Output: -4


-- 3. FLOOR()
-- Description: Rounds a number down to the nearest integer, returning the largest integer less than or equal to the number.

SELECT FLOOR(5.9);  -- Output: 5
SELECT FLOOR(-3.2); -- Output: -4


-- 4. ROUND()
-- Description: Rounds a number to a specified number of decimal places. You can specify the number of decimal places you want the number rounded to.

SELECT ROUND(123.456, 2);  -- Output: 123.46
SELECT ROUND(123.456, 0);  -- Output: 123
SELECT ROUND(123.456, -1); -- Output: 120


-- 5. SIGN()
-- Description: Returns the sign of a number. It returns -1 if the number is negative, 1 if the number is positive, and 0 if the number is zero.

SELECT SIGN(-100);  -- Output: -1
SELECT SIGN(0);     -- Output: 0
SELECT SIGN(50);    -- Output: 1


-- 6. MOD()
-- Description: Returns the remainder of a division operation (modulus).

SELECT MOD(10, 3);  -- Output: 1 (since 10 ÷ 3 gives a remainder of 1)
SELECT MOD(20, 5);  -- Output: 0 (since 20 is divisible by 5)


-- 7. TRUNCATE()
-- Description: Truncates a number to a specified number of decimal places, without rounding.

SELECT TRUNCATE(123.456, 2);  -- Output: 123.45
SELECT TRUNCATE(123.456, 0);  -- Output: 123


-- 8. POWER()
-- Description: Raises a number to the power of another number.

SELECT POWER(2, 3);  -- Output: 8 (since 2^3 = 8)
SELECT POWER(5, 2);  -- Output: 25 (since 5^2 = 25)


-- 9. EXP()
-- Description: Returns the value of e raised to the power of a given number (where e ≈ 2.71828, the base of the natural logarithm).

SELECT EXP(1);    -- Output: 2.71828 (since e^1 ≈ 2.71828)
SELECT EXP(2);    -- Output: 7.38906

-- 10. LOG()
-- Description: Returns the natural logarithm (log base e) of a number.

SELECT LOG(1);     -- Output: 0 (since log(e) 1 = 0)
SELECT LOG(2.718); -- Output: 0.9999 (approximately 1, as log(e) of e is 1)

-- 11. LOG10()
-- Description: Returns the base-10 logarithm of a number.
SELECT LOG10(10);   -- Output: 1
SELECT LOG10(100);  -- Output: 2 (since log10(100) = 2)
SELECT LOG10(1000); -- Output: 3 (since log10(1000) = 3)
SELECT LOG10(10000); -- Output: 4 (since log10(10000) = 4)



-- 12. SQRT()
-- Description: Returns the square root of a number.

SELECT SQRT(16);   -- Output: 4
SELECT SQRT(25);   -- Output: 5


-- 13. RADIANS()
-- Description: Converts a degree value into radians.

SELECT RADIANS(180);  -- Output: 3.14159 (π radians, since 180° = π radians)
SELECT RADIANS(90);   -- Output: 1.5708 (π/2 radians)

-- 14. DEGREES()
-- Description: Converts a radian value into degrees.

SELECT DEGREES(PI()); -- Output: 180 (π radians = 180 degrees)
SELECT DEGREES(PI()/2); -- Output: 90

-- PI()
-- Description: Returns the value of π (approximately 3.141593).

SELECT PI();  -- Output: 3.141593


-- 16. RAND()
-- Description: Generates a random floating-point number between 0 and 1.

SELECT RAND();      -- Output: Random number between 0 and 1
SELECT RAND(10);    -- Output: 0.77132064 (same result each time with the same seed)


-- 17. SIN(), COS(), TAN()
-- Description: These trigonometric functions return the sine, cosine, and tangent of a given angle (in radians).

SELECT SIN(PI()/2);  -- Output: 1 (sin(90 degrees) = 1)
SELECT COS(0);       -- Output: 1 (cos(0 degrees) = 1)
SELECT TAN(PI()/4);  -- Output: 1 (tan(45 degrees) = 1)


-- 18. LEAST() and GREATEST()
-- Description:
-- LEAST() returns the smallest number in a list.
-- GREATEST() returns the largest number in a list.

SELECT LEAST(3, 5, 7, 2);  -- Output: 2
SELECT GREATEST(3, 5, 7, 2);  -- Output: 7





-- Useful NULL Functions in MySQL....................................................................................................................




CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT,
    salary DECIMAL(10, 2),
    commission DECIMAL(10, 2)
);

INSERT INTO employees (employee_id, employee_name, manager_id, salary, commission) VALUES
(1, 'John Doe', NULL, 5000.00, 500.00),
(2, 'Jane Smith', 1, 4000.00, NULL),
(3, 'Mike Johnson', 1, NULL, 300.00),
(4, 'Lisa Brown', NULL, 4500.00, NULL),
(5, 'Paul Adams', 2, 4800.00, 600.00);


CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product VARCHAR(50),
    discount DECIMAL(5, 2),
    commission DECIMAL(10, 2)
);

INSERT INTO sales (sale_id, product, discount, commission) VALUES
(1, 'Laptop', NULL, 100.00),
(2, 'Phone', 10.00, NULL),
(3, 'Tablet', 5.00, 50.00),
(4, 'Monitor', NULL, NULL),
(5, 'Printer', 7.50, 70.00);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    delivery_date DATE
);

INSERT INTO orders (order_id, customer_name, order_date, delivery_date) VALUES
(1, 'Alice Johnson', '2024-09-01', '2024-09-05'),
(2, 'Bob Williams', '2024-09-02', NULL),
(3, 'Charlie Brown', '2024-09-03', '2024-09-08'),
(4, 'Diana Adams', '2024-09-04', NULL),
(5, 'Edward White', '2024-09-05', '2024-09-10');




-- 1. IS NULL
-- Description:
-- The IS NULL operator is used to check if a column or expression evaluates to NULL.

select * from customers 
where state is null;


-- 2. IS NOT NULL
-- Description:
-- The IS NOT NULL operator is used to check if a column or expression does not evaluate to NULL.

select * from customers 
where state is not null;


-- 3. COALESCE()
-- Description:
-- The COALESCE() function returns the first non-NULL value in a list of expressions. It is useful for providing default values when encountering NULLs.

select * from sales;

select coalesce(discount, 0) as effective_discount from sales;


-- 4. IFNULL()
-- Description:
-- The IFNULL() function is used to replace NULL values with a specified value. It is similar to COALESCE() but only takes two arguments.

select * from sales;

SELECT IFNULL(discount, 0) AS effective_discount FROM sales;


-- 5. NULLIF()
-- Description:
-- The NULLIF() function returns NULL if two expressions are equal; otherwise, it returns the first expression. This can be useful for handling cases where certain values should be treated as NULL.

select * from employees;

SELECT NULLIF(salary, 0) AS adjusted_salary FROM employees;


-- 6. CASE
-- Description:
-- The CASE statement is used for conditional logic within SQL queries. It can handle NULL values and perform operations based on whether values are NULL or not.

select 
case 
when commission is null THEN 'No commission'
else concat('$', commission)
end as  commission_status
from sales;


SELECT 
  CASE
    WHEN commission IS NULL THEN 'No Commission'
    ELSE concat('$', commission)
  END AS commission_status
FROM sales;


-- 7. IF()
-- Description:
-- The IF() function is used for simple conditional logic, where it can handle NULL values by providing a default result.

select if(salary is null, 'not provided', salary) as salary_status from employees;


-- 8. GROUP_CONCAT()
-- Description:
-- The GROUP_CONCAT() function concatenates values from multiple rows into a single string, with NULL values ignored by default. It is useful for aggregate string concatenation.

SELECT GROUP_CONCAT(employee_name) AS all_employees FROM employees;



-- Useful Date and Time Functions:............................................................................................................................................
-- 1. CURDATE()


SELECT CURDATE();
-- Output: '2024-09-14' (depends on the current date)


-- 2. CURTIME()
-- Returns the current time.

SELECT CURTIME();
-- Output: '14:30:15' (depends on the current time)


-- 3. NOW()
-- Returns the current date and time.

SELECT NOW();
-- Output: '2024-09-14 14:30:15' (depends on the current date and time)


-- 4. ADDDATE()
-- Adds a specified number of days to a date.

SELECT ADDDATE('2024-09-10', INTERVAL 5 DAY);
-- Output: '2024-09-15'


-- 5. DATE_ADD()
-- Adds a specified interval to a date or datetime. The interval can be in days, hours, minutes, seconds, etc.


SELECT DATE_ADD('2024-09-10', INTERVAL 2 MONTH);
-- Output: '2024-11-10'


-- 6. SUBDATE()
-- Subtracts a specified number of days from a date.

SELECT SUBDATE('2024-09-10', INTERVAL 5 DAY);
-- Output: '2024-09-05'


-- 7. DATEDIFF()
-- Returns the number of days between two dates.

SELECT DATEDIFF('2024-09-15', '2024-09-10');
-- Output: 5


-- 8. EXTRACT()
-- Extracts parts (like year, month, day, etc.) from a date or datetime.

SELECT EXTRACT(YEAR FROM '2024-09-14');
-- Output: 2024
SELECT EXTRACT(month FROM '2024-09-14');
SELECT EXTRACT(day FROM '2024-09-14');


-- 9. DATE_FORMAT()
-- Formats a date or datetime value according to the given format.

SELECT DATE_FORMAT('2024-09-14 14:30:15', '%W, %M %e, %Y');
-- Output: 'Saturday, September 14, 2024'


-- 10. STR_TO_DATE()
-- Parses a string into a date based on the specified format.

SELECT STR_TO_DATE('14-09-2024', '%d-%m-%Y');
-- Output: '2024-09-14'

-- 11. TIMESTAMPDIFF()
-- Calculates the difference between two TIMESTAMP values.

SELECT TIMESTAMPDIFF(HOUR, '2024-09-14 10:00:00', '2024-09-14 18:00:00');
-- Output: 8
SELECT TIMESTAMPDIFF(day, '2024-09-14 10:00:00', '2024-09-14 18:00:00');
SELECT TIMESTAMPDIFF(month, '2024-09-14 10:00:00', '2024-09-14 18:00:00');


-- 12. UNIX_TIMESTAMP()
-- Converts a date or datetime value to a Unix timestamp.
-- The UNIX_TIMESTAMP() function in MySQL is used to convert a date or DATETIME value into a Unix timestamp. A Unix timestamp is 
-- the number of seconds that have elapsed since January 1, 1970 (00:00:00 UTC), also known as the Epoch.
SELECT UNIX_TIMESTAMP('2024-09-14 14:30:00');
-- Output: 1726354200

-- 13. FROM_UNIXTIME()
-- Converts a Unix timestamp to a DATETIME format.

SELECT FROM_UNIXTIME(1726354200);
-- Output: '2024-09-14 14:30:00'

-- 14. LAST_DAY()
-- Returns the last day of the month for a given date.

SELECT LAST_DAY('2024-09-14');
-- Output: '2024-09-30'


-- Example Usage of Date and Time Functions:
-- 1. Getting the Current Date and Time:

SELECT NOW() AS current_datetime, CURDATE() AS current_date, CURTIME() AS current_time;

SELECT 
  NOW() AS now, 
  CURDATE() AS date,
  CURTIME() AS time;


-- 2. Adding and Subtracting Dates:

SELECT 
    DATE_ADD('2024-09-10', INTERVAL 10 DAY) AS add_10_days,
    SUBDATE('2024-09-10', INTERVAL 10 DAY) AS subtract_10_days;


-- 3. Calculating the Age of a Person from a Date of Birth:

SELECT 
    FLOOR(DATEDIFF(CURDATE(), '1990-05-15') / 365) AS age;

-- 4. Calculating the Days Between Two Dates:

SELECT DATEDIFF('2024-12-31', '2024-01-01') AS days_between;

-- 5. Formatting Dates:

SELECT DATE_FORMAT(NOW(), '%W, %M %e, %Y') AS formatted_date;


-- Common Interval Functions:............................................................................................................
-- 1. DATE_ADD()
-- Adds an interval to a date or datetime value.

select date_add('2024-09-14', interval 5 day) as future_datee;


-- 2. DATE_SUB()
-- Subtracts an interval from a date or datetime value.

select date_sub('2024-09-14', interval 1 month) as past_date;


-- 3. TIMESTAMPDIFF()
-- Calculates the difference between two timestamps in a specified unit (e.g., seconds, minutes, hours).

select timestampdiff(day, '2024-01-01', '2024-12-31') AS day_difference;
select timestampdiff(month, '2024-01-01', '2024-12-31') AS month_difference;
select timestampdiff(year, '2024-01-01', '2024-12-31') AS year_difference;


-- More Examples Using Intervals:
-- 1. Adding Hours:

SELECT DATE_ADD('2024-09-14 10:00:00', INTERVAL 4 HOUR) AS new_time;

-- 2. Subtracting Minutes:
SELECT DATE_SUB('2024-09-14 10:00:00', INTERVAL 15 MINUTE) AS new_time;

-- 3. Adding Multiple Units Together:
-- You can add different types of intervals in a single query using ADDDATE().
SELECT VERSION();
-- SELECT DATE_ADD('2024-09-14', INTERVAL 1 YEAR + INTERVAL 2 MONTH) AS future_date;

SELECT DATE('2024-09-14' + INTERVAL 1 YEAR) + INTERVAL 2 MONTH AS future2_date;

-- 4. Subtracting Years and Months:
SELECT DATE_SUB('2024-09-14', INTERVAL 1 YEAR) + INTERVAL 3 MONTH AS past_date;


-- Advanced Usage of Intervals:
-- Using Intervals in WHERE Clauses:
-- You can use intervals to query date ranges. For example, to get all records from the last 30 days:

select * from orders where order_date >= date_sub(curdate(), interval 30 day);


-- Using INTERVAL in Time Comparisons:

SELECT * FROM events WHERE event_time BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 1 WEEK);



-- Combining Units in TIMESTAMPDIFF():
-- You can measure differences between two timestamps in different units.

SELECT 
    TIMESTAMPDIFF(HOUR, '2024-09-14 10:00:00', '2024-09-15 12:00:00') AS hours_difference,
    TIMESTAMPDIFF(MINUTE, '2024-09-14 10:00:00', '2024-09-14 10:45:00') AS minutes_difference;












select * from orders;
select * from customers2;
select * from products;
select * from customers;
select * from employees3;
select * from departments;


