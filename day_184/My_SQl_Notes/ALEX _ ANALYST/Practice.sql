

use college2;

select * from college;

insert into college2 ( id,name,age)
values(103, 'Naveed', 22 ),
(104, 'Noreen', 23 )
;


alter table college2
rename to college;


alter table college
add column email varchar(15) after name;

alter table college
drop column date_of_birth;

alter table college
add column date_of_birth int first;

alter table college 
modify column email varchar(50);

desc college;

-- change means that we can change column and data type
alter table college 
change email Email_address varchar(60);

ALTER TABLE college
RENAME COLUMN name TO stu_name;

alter table college 
drop  primary key ;

alter table college 
add constraint pk_stu primary key (id);

alter table college 
add index edx (id);

alter table college 
drop index edx;


DROP TABLE IF EXISTS members;

CREATE TABLE members (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    birthDate DATE,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS reminders;

CREATE TABLE reminders (
    id INT AUTO_INCREMENT,
    memberId INT,
    message VARCHAR(255) NOT NULL,
    PRIMARY KEY (id,memberId)
);

select species, avg(age) as average_age
from animal
where id != 3
group by species
having avg(age) > 3
order by  avg(age) desc;

select city.name, country.name
from city
inner join country
on city.country_id = country.id;


select city,country 
from office
where sales >= 200;

select first_name ,last_name
from employees
where department = sales and salary > 50000;

SELECT first_name, last_name
FROM employees
WHERE department = 'Sales' OR department = 'Marketing';

SELECT first_name, last_name, salary
FROM employees
order by salary desc;

select * from customers;
select * from employees;

use classicmodels;

select contactFirstName, contactLastName
from customers
limit 5;

select COUNTRY,  COUNT(*) as Total_country
FROM CUSTOMERS
Group by country;

select country, count(*) as Total
FROM CUSTOMERS
GROUP BY COUNTRY
having count(*) > 10 order by country desc;


select customers.contactFirstName,customers.contactLastName,employees.jobTitle
from customers
inner join employees on customers.customernumber = employees.employeenumber;


select c.contactFirstName, c.contactLastName, e.jobTitle
from customers as c
inner join employees as e on c.customernumber = e.employeenumber;


SELECT c.customerName, COUNT(e.employeeNumber) AS num_employees, AVG(e.jobtitle) AS avg_salary
FROM employees e
INNER JOIN customerNumber c ON e.employeeNumber = c.customerNumber
WHERE e.jobTitle = 'Sales Rep'
GROUP BY c.customerName
HAVING officeCode > 5
ORDER BY avg_salary DESC
LIMIT 3;

select * from customers;
select * from employees;

select customerName, avg(creditLimit) as average_creditLimit
from customers
where customerNumber!= 103
group by customerName 
having avg(creditLimit) > 1500
order by avg(creditLimit) desc;

select customers.customernumber, employees.employeeNumber
from customers
inner join employees on customers.customernumber = employees.employeeNumber;


select 60*2 as product;


-- AGGREGATION AND GROUPING.........................................

select * from products;

select count(*) from customers;

select count(customerName) from customers;

select count(distinct customerName) from customers;

select Min(buyPrice) from products;
select Max(buyPrice) from products;
select Avg(buyPrice) from products;
select sum(buyPrice) from products;
select group_concat(productName) from products;
select group_concat(distinct productName) from products;

SELECT productScale, GROUP_CONCAT(distinct productName) AS Name
FROM products
GROUP BY productScale;

SELECT productScale, GROUP_CONCAT(distinct productName separator ' | ' ) AS Name
FROM products
GROUP BY productScale;

SELECT productScale, GROUP_CONCAT(distinct productName ORDER BY productName ASC) AS Name
FROM products
GROUP BY productScale;


-- 2. Grouping Data with GROUP BY................................................................



select productLine, count(*)  as NUM_Products
from products
group by productLine;

select productLine, count(*)  as NUM_Products
from products
group by productLine
having count(*) > 15 ;

select * from products;
select productLine, avg(MSRP) as avg_salary, count(*) as num_products
from products
group by productLine
having  avg(MSRP) > 100;


select productLine, avg(MSRP) as avg_salary, count(*) as num_products
from products
group by productLine
having  avg(MSRP) > 100
order by avg(MSRP) asc;

-- 6. Using GROUP BY with Multiple Columns....

select * from products;
select productLine, productName, count(*)  as NUM_Products
from products
group by productLine, productName;


SELECT YEAR(productCode) AS hire_year, COUNT(*) AS num_employees
FROM products
GROUP BY YEAR(productCode);

select productLine, count(*)  as NUM_Products
from products
group by productLine with rollup;

SELECT
  SUM(CASE WHEN productLine = 'Motorcycles' THEN 1 ELSE 0 END) AS Motorcycles,
  SUM(CASE WHEN productLine = 'Classic Cars' THEN 1 ELSE 0 END) AS Classic_Cars,
  SUM(CASE WHEN productLine = 'Trucks and Buses' THEN 1 ELSE 0 END) AS Trucks_and_Buses,
  SUM(CASE WHEN productLine = 'Vintage Cars' THEN 1 ELSE 0 END) AS Vintage_Cars
FROM products;

-- Advanced Grouping Techniques.......

SELECT productLine, productName, SUM(MSRP) AS total_sales
FROM products
GROUP BY productLine, productName WITH ROLLUP;


SELECT productLine, productName, SUM(MSRP) AS total_sales
FROM products
GROUP BY productLine, productName WITH ROLLUP;


-- Window Functions for Advanced Grouping
SELECT 
    productLine,
    productName,
    MSRP,
    SUM(MSRP) OVER (PARTITION BY productLine) AS department_total_salary
FROM products;


-- 1. Basic INSERT Statement.....................................................................................................

INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES (1, 'John Doe', 'USA');

-- Omitting Column Names:...........

INSERT INTO Customers
VALUES (2, 'Jane Smith', 'Canada');


-- 2. Inserting Multiple Rows

INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES 
    (3, 'Alice Johnson', 'UK'),
    (4, 'Robert Brown', 'Australia');

-- 3. Inserting Data with SELECT.........................

INSERT INTO Customers_Backup (CustomerID, CustomerName, Country)
SELECT CustomerID, CustomerName, Country
FROM Customers
WHERE Country = 'Germany';

select * from customers;
insert into customers2 ('customerNumber', 'customerName', 'city')
select customerNumber, customerName, city
from customers 
where country = 'Germany';

-- 4. Inserting with Default Values

INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES (5, 'George White', 'France');

INSERT INTO Customers (CustomerID, CustomerName, Country, CreatedDate)
VALUES (6, 'Henry Black', 'Spain', DEFAULT);

-- 5. Inserting NULL Values

INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES (7, 'Emma Blue', NULL);

-- 6. Inserting Data with AUTO_INCREMENT Columns
   -- For tables with an AUTO_INCREMENT column (often a primary key), you don’t need to specify a value for that column.
   -- MySQL will automatically generate the next sequential value.

INSERT INTO Customers (CustomerName, Country)
VALUES ('Liam Green', 'Ireland');

-- 7. Handling Duplicates with INSERT

-- a. INSERT IGNORE:

INSERT IGNORE INTO Customers (CustomerID, CustomerName, Country)
VALUES (1, 'John Doe', 'USA');

-- b. ON DUPLICATE KEY UPDATE:

INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES (1, 'John Doe', 'USA')
ON DUPLICATE KEY UPDATE 
    CustomerName = VALUES(CustomerName),
    Country = VALUES(Country);


-- 8. Using Stored Procedures to Insert Data

DELIMITER //
CREATE PROCEDURE AddCustomer(
    IN p_CustomerName VARCHAR(100),
    IN p_Country VARCHAR(50)
)
BEGIN
    INSERT INTO Customers (CustomerName, Country)
    VALUES (p_CustomerName, p_Country);
END //
DELIMITER ;

CALL procedure_name(parameter_values);
CALL AddCustomer('Sophia Red', 'Italy');

-- 4. Handling More Complex Logic
-- Stored procedures can include more complex logic, such as conditional statements (IF, CASE), loops (WHILE, LOOP), and error handling.

DELIMITER //

CREATE PROCEDURE AddCustomerIfNotExists(
    IN p_CustomerName VARCHAR(100),
    IN p_Country VARCHAR(50)
)
BEGIN
    DECLARE existing_customer INT;

    -- Check if customer already exists
    SELECT COUNT(*) INTO existing_customer
    FROM Customers
    WHERE CustomerName = p_CustomerName AND Country = p_Country;

    -- If customer does not exist, insert new record
    IF existing_customer = 0 THEN
        INSERT INTO Customers (CustomerName, Country)
        VALUES (p_CustomerName, p_Country);
    END IF;
END //

DELIMITER ;


-- 9. Inserting Data with Transactions......

START TRANSACTION;

INSERT INTO Orders (OrderID, OrderDate, CustomerID)
VALUES (1, '2024-08-10', 1);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES (1, 101, 2);

COMMIT;

-- If any part of the transaction fails, you can use ROLLBACK to undo all changes:
ROLLBACK;

-- 10. Bulk Inserts......

LOAD DATA INFILE '/path/to/your/file.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
(CustomerID, CustomerName, Country);



-- UPDATING DATA................................................................................................................

drop TABLE employees;

CREATE TABLE employees3 (
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

select * from employees3;

SET SQL_SAFE_UPDATES = 0;

-- 1. Basic Syntax.........
UPDATE employees3
SET salary = 75000
WHERE employee_id = 1;

-- 2. Updating Multiple Columns

update employees3
set salary = 70000, department = 'Marketing'
where employee_id = 2;


-- 3. Conditional Updates

update employees3
set salary = salary * 1.10
where department = 'Sales';


-- 4. Using Subqueries

UPDATE employees3
SET salary = salary * 1.10
WHERE department = (SELECT department FROM employees WHERE location = 'New York' limit 1);


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

select * from employees3;
select * from departments;

-- 5. Updating Data in Multiple Tables

update employees3 e
join departments d on e.department = d.department_name
set e.salary = e.salary * 1.10
where d.location = 'New York';

-- 6. Safe Updates and Transactions

START TRANSACTION;

UPDATE employees3
SET salary = salary * 1.10
WHERE department = 'HR';

-- Verify the update
SELECT * FROM employees3 WHERE department = 'HR';

COMMIT; -- or ROLLBACK if necessary

-- 7. Handling Error

DELIMITER //

CREATE PROCEDURE UpdateSalary()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback in case of error
        ROLLBACK;
    END;

    START TRANSACTION;

    UPDATE employees3
    SET salary = salary * 1.05
    WHERE department = 'IT';

    COMMIT;
END //

DELIMITER ;


-- 8. Advanced Features: LIMIT Clause

UPDATE employees3
SET salary = salary * 1.05
WHERE department = 'Sales'
LIMIT 3;

-- 9. Order of Updates
-- Increase the salary by 5% for the top 3 lowest-paid employees in the 'Sales' department.

UPDATE employees3
SET salary = salary * 1.05
WHERE department = 'Sales'
ORDER BY salary ASC
LIMIT 3;





-- Trigers.....................................................

delimiter //

create trigger after_member_insert
after insert
on members
for each row
begin
if new.birthdate is null then
insert into reminders (memberid, message)
values(new.id,concat('Hi ', NEW.name, ', please update your date of birth.'));
end if;
end//

delimiter ;

show triggers;
drop trigger after_member_insert;

INSERT INTO members(name, email, birthDate)
VALUES
    ('John Doe', 'john.doe@example.com', NULL),
    ('Jane Doe', 'jane.doe@example.com','2000-01-01');


SELECT * FROM members;    

SELECT * FROM reminders;    

SHOW CREATE DATABASE college;


DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    id INT AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    fiscalYear SMALLINT NOT NULL,
    fiscalMonth TINYINT NOT NULL,
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12),
    CHECK(fiscalYear BETWEEN 2000 and 2050),
    CHECK (quantity >=0),
    UNIQUE(product, fiscalYear, fiscalMonth),
    PRIMARY KEY(id)
);


INSERT INTO sales(product, quantity, fiscalYear, fiscalMonth)
VALUES
    ('2003 Harley-Davidson Eagle Drag Bike',120, 2020,1),
    ('1969 Corvair Monza', 150,2020,1),
    ('1970 Plymouth Hemi Cuda', 200,2020,1);


delimiter $$

create trigger before_sales_update
before update
on sales
for each row

begin
declare errormessage varchar(255);
set errormessage = concat('the new quantity',
new.quantity,
'canmot be 3 times greater than the current quantity',
old.quantity);

if new.quantity >  old.quantity * 3 then
signal sqlstate '45000'
set message_text = errormessage;
end if;
end $$

delimiter ;

SELECT * FROM sales;


update sales 
set quantity = 500
where id = 1;

SHOW ERRORS;

DROP TABLE IF EXISTS SalesChanges;

CREATE TABLE SalesChanges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salesId INT,
    beforeQuantity INT,
    afterQuantity INT,
    changedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


delimiter //

create trigger after_sales_update
after update
on sales for each row

begin

IF OLD.quantity <> new.quantity THEN
        INSERT INTO SalesChanges(salesId,beforeQuantity, afterQuantity)
        VALUES(old.id, old.quantity, new.quantity);
    END IF;
end//

delimiter ;

UPDATE Sales 
SET quantity = 350
WHERE id = 1;

SELECT * FROM SalesChanges;

SET SQL_SAFE_UPDATES = 0;


UPDATE Sales 
SET quantity = CAST(quantity * 1.1 AS UNSIGNED);


DROP TABLE IF EXISTS Salaries;

CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0
);

INSERT INTO salaries(employeeNumber,validFrom,amount)
VALUES
    (1002,'2000-01-01',50000),
    (1056,'2000-01-01',60000),
    (1076,'2000-01-01',70000);

DROP TABLE IF EXISTS SalaryArchives;    

CREATE TABLE SalaryArchives (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employeeNumber INT,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0,
    deletedAt TIMESTAMP DEFAULT NOW()
);



delimiter $$

create trigger before_salaries_delete
before delete 
on salaries for each row
begin
insert into salaryarchives (employeeNUMBER, VALIDFrom, AMOUNT)
 values(old.employeenumber, old.validfrom, old.amount);
 end$$
 
 delimiter ;


DELETE FROM salaries 
WHERE employeeNumber = 1002;

SELECT * FROM SalaryArchives;    
DELETE FROM salaries;

SELECT * FROM SalaryArchives;


CREATE TABLE Salaries2 (
    employeeNumber INT PRIMARY KEY,
    salary DECIMAL(10,2) NOT NULL DEFAULT 0
);

INSERT INTO Salaries2(employeeNumber,salary)
VALUES
    (1002,5000),
    (1056,7000),
    (1076,8000);

CREATE TABLE SalaryBudgets(
    total DECIMAL(15,2) NOT NULL
);

INSERT INTO SalaryBudgets(total)
SELECT SUM(salary) 
FROM Salaries2;

SELECT * FROM SalaryBudgets;        

create trigger after_salaries_delete
after delete 
on salaries2 for each row
update salarybudgets
set total = total - old.salary;


DELETE FROM Salaries
WHERE employeeNumber = 1002;

SELECT * FROM SalaryBudgets;    

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Salaries2;

SELECT * FROM SalaryBudgets;   




 
