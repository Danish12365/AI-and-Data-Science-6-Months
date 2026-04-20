
create database school_management;
use school_management;

create table students (
student_id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50),
age int,
grade varchar(10));

insert into students (first_name, last_name, age, grade)
values 
('John', 'Doe', 14, '8th'),
('Emma', 'Smith', 15, '9th'),
('Liam', 'Johnson', 13, '7th'),
('Olivia', 'Brown', 14, '8th'),
('Noah', 'Davis', 15, '9th');

select * from students;

select * from students 
where grade= "9th";

select * from students 
where age= 14;


SET SQL_SAFE_UPDATES = 0; 

update students set
grade="9th" 
where first_name="John" and last_name="Doe";

delete from students 
where grade='7th';

alter table students
add column email varchar(60) after grade;

select * from students;

alter table students
modify grade varchar(15);

select * from students
order by age desc, grade Asc;

select count(student_id) Total_student,avg(age) Average_Age, max(age) Maximum_Age from students;

select distinct grade from students;

insert into students (first_name, last_name, age, grade)
values 
('Moin ', 'Khan', 16, '10th'),
('Naveed', 'Shan', 17, '11th');

create view high_school_students as
select * from students
where grade in ('9th', '10th', '11th', '12th');

select * from high_school_students;

create table teacher(
teachier_id int primary key auto_increment,
first_name varchar(60),
 last_name varchar(60),
 subjects varchar(60));
 
 insert into teacher(first_name, last_name, subjects)
VALUES ('Alice', 'White', 'Math'), 
('Robert', 'Green', 'Science');

select * from teacher;
select * from students;

select students.first_name,students.last_name,students.grade,teacher.first_name,teacher.last_name,teacher.subjects from students
inner join teacher on students.student_id=teacher.teachier_id;

select grade, count(student_id) AS number_of_students from students
group by grade
HAVING COUNT(*) > 1;  -- only grades with more than 1 student; 


select * from students
where age = (select max(age) from students);

SELECT first_name, last_name, age,
    CASE
        WHEN age < 14 THEN 'Under 14'
        WHEN age >= 14 THEN '14 and above'
 END AS age_group
FROM students;














