SELECT * FROM parks_and_recreation.employee_demographics;


SELECT distinct gender, first_name 
FROM parks_and_recreation.employee_demographics;

select * from employee_demographics
where birth_date > '1985-01-01'
and gender = 'male';


select * from employee_demographics
where birth_date > '1985-01-01'
or gender = 'male';


select * from employee_demographics
where birth_date > '1985-01-01'
or not gender = 'male';

select * from employee_demographics
where (first_name = 'Leslie' and age = 44) or age > 55;

-- LIKE Statement
-- % and _
select * from employee_demographics
where first_name LIKE 'Jer%';

select * from employee_demographics         
where first_name LIKE '%er%';

select * from employee_demographics         
where first_name LIKE 'A%';

select * from employee_demographics         
where first_name LIKE 'a__';

select * from employee_demographics         
where first_name LIKE 'a___%';


select * from employee_demographics         
where birth_date LIKE '1989%';

select gender, AVG(age)
from employee_demographics
group by gender;

select occupation, salary
from employee_salary
group by occupation, salary;

select gender, AVG(age), MIN(age), MAX(age), count(age)
from employee_demographics
group by gender;

-- ORDER BY
SELECT * 
FROM employee_demographics
order by first_name DESC;

select * 
from employee_demographics
order by gender, age;


select gender, avg(age)
from employee_demographics
group by gender 
having avg(age) > 40;

select occupation, avg(salary)
from employee_salary
where occupation LIKE '%manager%'
group by occupation
having avg(salary) > 75000
;

select * from employee_demographics
limit 3;

select * from employee_demographics
limit 3, 1;

-- Aliasing

select gender, avg(age) avg_age
from employee_demographics
group by gender
having avg_age > 40;


