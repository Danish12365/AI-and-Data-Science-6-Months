
select database();

create table employees (
empid int primary key,
firstname varchar(50) not null,
lastname varchar(50) not null,
dateofbirth date,
HireDate DATE,
salary decimal(10, 2) check (salary > 0)
);

select * from track;


select * from customers;




with customers_in_usa as (
select customername, state
from customers
where country = 'USA')

select customername, state
from customers_in_usa
where state = 'CA'
order by customername;

select customername, state
from customers
where country = 'USA';

select * from orders;

WITH topsales2003 AS (
    SELECT 
        salesRepEmployeeNumber employeeNumber,
        SUM(quantityOrdered * priceEach) sales
    FROM
        orders
            INNER JOIN
        orderdetails USING (orderNumber)
            INNER JOIN
        customers USING (customerNumber)
    WHERE
        YEAR(shippedDate) = 2003
            AND status = 'Shipped'
    GROUP BY salesRepEmployeeNumber
    ORDER BY sales DESC
    LIMIT 5
)
SELECT 
    employeeNumber, 
    firstName, 
    lastName, 
    sales
FROM
    employees
        JOIN
    topsales2003 USING (employeeNumber);