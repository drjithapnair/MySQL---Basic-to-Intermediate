CREATE DATABASE ORGANISATION;
SHOW DATABASES;
USE ORGANISATION;

-- Table Creation
CREATE table Student(Adm_No int primary key,
Name varchar(25),
Gender char,
DOB date,
Course varchar(20),
Income int );
-- Table Structure
describe Student;
desc Student;
-- inserting Values
insert into Student values(101,'Alex','M','1985-05-28','DSML', 15000);
insert into Student values(102,'Alice','F','1990-06-21','Python', 15000);
insert into Student values(103,'Bob','M','2000-05-23','DSML', 15000);
insert into Student values(104,'Sam','M','1999-09-19','SQL', 15000);
insert into Student values(105,'Pinky','F','1985-05-28','DSML', 15000);

-- DISPLAY TABLE
select * FROM Student;
-- adding new column
ALTER table Student add Address varchar(50);
desc Student;
update Student set address ='#115 SRK  Whitefield , Bangalore -66' where Adm_No = 101;
select * from Student;
-- Remove a Column
Alter Table Student drop Address;
select * from Student;
-- modifyng Column
alter table student modify Gender char(6);
desc student;
-- Rename the field/ column
alter table student rename column Adm_No to Roll_No;
select *from student;
-- rename the name of a table
rename table student to DSML;
select*from DSML;
-- delete a single row 
delete from DSML where course ='SQL';
select*from DSML;
-- remove the values from a table 
truncate table DSML;
select*from DSML;
-- to delete the entire table
drop table DSML;
select*from DSML;



-- Table With Constraints 


Create table Student(Roll_No int primary key auto_increment,
Name varchar(50) not null,
Age int check(age between 18 and 30),
Gender char,
Course varchar(20) default 'DSML',
Phone bigint unique,
Mark int);
desc student;
insert into student (Roll_No,Name,Age,Gender,Course,Phone,Mark) values(101,'Ishaan',20,'M',default,'99409533462',60);
select*from student;
insert into student (Name,Age,Gender,Course,Phone,Mark) values('Vaiga',22,'F',default,'9940953689',70);
insert into student (Name,Age,Gender,Course,Phone,Mark) values('Rmdas',24,'M',default,'8880953689',65);
insert into student (Name,Age,Gender,Course,Phone,Mark) values('Jiji',25,'F',default,'9940912334',50);
insert into student (Name,Age,Gender,Course,Phone,Mark) values('Kishan',27,'F','Python','9940957841',60);
select* from student;
insert into student (Name,Age,Gender,Course,Phone,Mark) values('Vignesh',21,'M',default,'9940951158',70);
select*from student;
-- Foreign Key- Primary key of another table
create table Department (Dname varchar(10),
Roll_no int,
foreign key(Roll_no) references student (Roll_No) on delete cascade);
desc department;
insert into department values('CS',101);
insert into department values('EC',102),('Maths',103),('CS',104),('Mech',105);
select*from department;
delete from student where Roll_No=101;
select*from student;
select *from department;


-- SQL Operators 

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department VARCHAR(50),
    hire_date DATE
);

INSERT INTO employees (employee_id, first_name, last_name, salary, department, hire_date)
VALUES
    (1, 'John', 'Doe', 50000.00, 'IT', '2018-05-01'),
    (2, 'Jane', 'Smith', 65000.00, 'Sales', '2020-03-15'),
    (3, 'Michael', 'Johnson', 75000.00, 'Marketing', '2017-08-10'),
    (4, 'Emily', 'Brown', 60000.00, 'IT', '2021-01-20'),
    (5, 'David', 'Wilson', 80000.00, 'Sales', '2019-11-01');
    
SELECT*FROM EMPLOYEES;
-- IN 
SELECT FIRST_NAME ,SALARY,DEPARTMENT FROM EMPLOYEES WHERE DEPARTMENT IN('IT');
-- NOT IN
SELECT FIRST_NAME ,SALARY,DEPARTMENT FROM EMPLOYEES WHERE DEPARTMENT NOT IN('IT');

-- ARITHMETIC OPERATORS

-- ADDITION
SELECT*FROM EMPLOYEES;
SELECT EMPLOYEE_ID , FIRST_NAME,SALARY,SALARY+5000 AS INCREASED_SALARY FROM EMPLOYEES;

-- SUBSTRACTION
SELECT EMPLOYEE_ID , FIRST_NAME,SALARY,SALARY-5000 AS DECREASED_SALARY FROM EMPLOYEES;

-- MULTIPLICATION
SELECT EMPLOYEE_ID , FIRST_NAME,SALARY,SALARY*12 AS ANNUAL_SALARY FROM EMPLOYEES;

-- DIVISION
SELECT EMPLOYEE_ID , FIRST_NAME,SALARY,SALARY/30 AS DAILY_SALARY FROM EMPLOYEES;

-- MODULUS
SELECT EMPLOYEE_ID , FIRST_NAME,SALARY,SALARY%12 AS BALANCE_SALARY FROM EMPLOYEES;

-- COMPARISON OPERATORS  

-- EQUAL TO
SELECT FIRST_NAME , DEPARTMENT FROM EMPLOYEES WHERE DEPARTMENT='IT';
-- NOT EQUAL TO
SELECT FIRST_NAME , DEPARTMENT FROM EMPLOYEES WHERE DEPARTMENT<>'IT';

select*FROM EMPLOYEES WHERE SALARY > 65000 ;
select*FROM EMPLOYEES WHERE SALARY < 65000 ;
select*FROM EMPLOYEES WHERE SALARY >= 65000 ;
select*FROM EMPLOYEES WHERE SALARY <= 65000 ;

-- LOGICAL OPERATORS ( AND ,OR , NOT)

-- AND
SELECT*FROM EMPLOYEES WHERE DEPARTMENT='IT' AND SALARY > 55000;

-- OR
SELECT*FROM EMPLOYEES WHERE DEPARTMENT='IT' OR SALARY > 55000;

-- NOT
SELECT*FROM EMPLOYEES WHERE NOT DEPARTMENT ='IT';

-- LIKE
SELECT*FROM EMPLOYEES WHERE FIRST_NAME LIKE 'J%';
SELECT*FROM EMPLOYEES WHERE LAST_NAME LIKE '_M%';

-- NOT LIKE
SELECT*FROM EMPLOYEES WHERE DEPARTMENT NOT LIKE 'IT%';
SELECT*FROM EMPLOYEES WHERE DEPARTMENT NOT LIKE '%ing%';



-- SQL Clauses
SELECT*FROM EMPLOYEES;
-- DISTINCT
SELECT DISTINCT DEPARTMENT FROM EMPLOYEES;
-- ALL
SELECT ALL DEPARTMENT FROM EMPLOYEES;
-- WHERE
SELECT*FROM EMPLOYEES WHERE DEPARTMENT='IT';
-- LIMIT
SELECT*FROM EMPLOYEES LIMIT 3;
-- AS
SELECT FIRST_NAME, SALARY, SALARY*12 AS ANNUAL_SALARY FROM EMPLOYEES;
-- ORDER BY
SELECT*FROM EMPLOYEES ORDER BY FIRST_NAME;
SELECT*FROM EMPLOYEES ORDER BY FIRST_NAME DESC;
SELECT*FROM EMPLOYEES ORDER BY SALARY;
SELECT*FROM EMPLOYEES ORDER BY SALARY DESC;
-- AGGREGATE FUNCTIONS
SELECT MAX(SALARY), MIN(SALARY),SUM(SALARY),avg(SALARY) FROM EMPLOYEES;
SELECT COUNT(*)FROM EMPLOYEES WHERE DEPARTMENT='IT';

-- GROUP BY
SELECT DEPARTMENT,COUNT(*)AS TOTAL_EMPLOYEES 
FROM EMPLOYEES GROUP BY DEPARTMENT;
SELECT*FROM STUDENT;
INSERT INTO STUDENT VALUES(7,'ANU',21,'F','CS','989876543',77),
(8,'AMMU',19,'F','FSD','898745567',67),
(9,'ANJALI',28,'F','CS','7867548948',91);
SELECT NAME , MAX(MARK) AS 'MAXIMUM MARK' FROM STUDENT GROUP BY NAME;
SELECT NAME , MARK FROM STUDENT WHERE MARK=(SELECT MAX(MARK) FROM STUDENT);
SELECT NAME , MARK FROM STUDENT WHERE MARK=(SELECT MIN(MARK) FROM STUDENT);
SELECT GENDER, AVG(AGE) AS AVERAGE_AGE FROM STUDENT GROUP BY GENDER;
-- HAVING 
SELECT COURSE,COUNT(*) AS 'TOTAL' FROM STUDENT GROUP BY COURSE HAVING
COUNT(*)<=2;
SELECT GENDER, avg(AGE) FROM STUDENT GROUP BY GENDER HAVING AVG(AGE)>20;

-- Joins 
use organisation;
select * from student;
select * from department;
insert into student (Name,Age,Gender,Course,phone,Mark) values('John',19,'m',default,'9961284967',255);
-- inner join

select student.name,student.Course,student.mark,student.Roll_no,department.Dname 
from student inner join department on student.Roll_no=department.Roll_no;

-- left join

select student.name,student.Course,student.mark,student.Roll_no,department.Dname from 
student left join department on student.Roll_no=department.Roll_no;

-- right join

select student.name,student.Course,student.mark,student.Roll_no,department.Dname
 from student right join department on student.Roll_no=department.Roll_no;

-- union

select student.name,student.Course,student.mark,student.Roll_no,department.Dname from student left join 
department on student.Roll_no=department.Roll_no
union
select student.name,student.Course,student.mark,student.Roll_no,department.Dname from student right join 
department on student.Roll_no=department.Roll_no;

-- cross join

select s.Roll_no,s.name,d.Roll_no,d.Dname from student s cross join department d ;

-- display student name and department name

select s.name,d.dname from student s join department d on s.Roll_no= d.Roll_no ;

-- show a list of all students and their department, including those without asiigned department 

select * from student left join department on student.Roll_no = department.Roll_no;

-- retrive name of departments and name of student assigned to them (if any)

select d.dname,s.name from department d inner join student s on s.Roll_no=d.Roll_no;

-- buit in functions
-- STRING FUNCTIONS

SELECT CONCAT('HELLO', ' ', 'WORLD') AS CONCATENATED_STRING;

-- SUBSTRING
SELECT SUBSTRING('EXAMPLE STRING', 8, 6) AS SUBSTRING_RESULT;

-- UPPERCASE AND LOWERCASE
SELECT UPPER('flower');
SELECT UCASE('flower');

SELECT LOWER('TREE');
SELECT LCASE('TREE');

-- CHAR LENGTH
SELECT CHAR_LENGTH('FLOWER POT');

-- LEFT AND RIGHT
SELECT LEFT('FLOWER POT', 5);
SELECT RIGHT('FLOWER POT', 3);

-- REPLACE
SELECT REPLACE( 'REPLACE ME' , 'ME', 'YOU');

-- REVERSE
SELECT REVERSE('HELLO');

-- NUMERICAL FUNCTIONS
-- ABS FUNC
SELECT ABS(-10);
SELECT ABS(-25);

-- CEIL 
SELECT CEIL(8.01);
-- FLOOR
SELECT FLOOR(8.9);

-- ROUND
SELECT ROUND(3.1415,2);
-- SQUARE ROOT
SELECT SQRT(64);

-- TRUNCATE
SELECT TRUNCATE(25.26,1);
SELECT ROUND(25.26,1);

-- DATE AND TIME
SELECT NOW();
SELECT SYSDATE();
SELECT CURDATE(); 
SELECT CURTIME();
SELECT YEAR('2023-01-19');
SELECT MONTH('2023-01-19');
SELECT DAY('2023-01-19');

SELECT HOUR('12:30:45');
SELECT MINUTE('12:30:45');
SELECT SECOND('12:30:45');

-- DATEDIFF
SELECT DATEDIFF('2024-05-15','2024-03-03');

-- USER DEFINED FUNCTIONS
-- TO FIND SQUARE OF A NUMBER
DELIMITER #
CREATE FUNCTION SQUARE(N INT)
RETURNS INT 
DETERMINISTIC 
BEGIN 
	RETURN N*N;
END #
DELIMITER ;
SELECT SQUARE(5);

-- SHOW FUNCTION
SHOW FUNCTION STATUS WHERE DB = 'organisation';


CREATE TABLE person (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    population INT,
    rating DECIMAL(3,2),
    country_id INT,
    country_name VARCHAR(100),
    dob DATE
);

INSERT INTO person (id, name, population, rating, country_id, country_name, dob)
VALUES 
(1, 'John Doe', 1000000, 4.5, 1, 'United States', '1990-05-15'),
(2, 'Jane Smith', 500000, 4.2, 1, 'United States', '1985-09-20'),
(3, 'Alice Johnson', 750000, 4.8, 2, 'Canada', '1992-03-10'),
(4, 'Bob Williams', 300000, 3.9, 3, 'United Kingdom', '1988-11-30'),
(5, 'Emma Brown', 1200000, 4.6, 4, 'Australia', '1995-07-25'),
(6, 'Michael Lee', 900000, 4.3, 5, 'South Korea', '1987-12-05'),
(7, 'Sophia Garcia', 600000, 4.1, 6, 'Spain', '1993-02-18'),
(8, 'Liam Murphy', 400000, 3.8, 7, 'Ireland', '1991-08-22'),
(9, 'Olivia Chen', 1500000, 4.9, 8, 'China', '1989-04-12'),
(10, 'Noah Müller', 800000, 4.4, 9, 'Germany', '1994-10-08');


select* from person;

DELIMITER #
CREATE FUNCTION get_dobs(person_id INT)
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE result_dob DATE;
    SELECT dob INTO result_dob FROM person WHERE id = person_id;
    RETURN result_dob;
END#
DELIMITER ;

SELECT get_dobs(1) AS DateOfBirth;

DELIMITER #
CREATE FUNCTION get_age(person_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE result_age INT;
    SELECT FLOOR(DATEDIFF(CURDATE(), dob)/365) INTO result_age
    FROM person    WHERE id = person_id;
    RETURN result_age;
END#
DELIMITER ;

SELECT get_age(1) AS Age;

-- views
select * from student;
-- create view
create view stdntview as select roll_no,name,course 
from student; 
select* from stdntview;
-- create or replace view
create or replace view stdntview as select roll_no,
name,course,mark from student;
-- insert
insert into stdntview(roll_no,name,course,mark)
values(109,'aadhya','CS',45000);
-- update
update stdntview set course='CS' where roll_no=105;

-- delete
delete from stdntview where roll_no=107;

-- drop
drop view stdntview;

-- subqueries
select *from employees;
select *from student;
select avg(mark) from student;
select *from student where age< 25;
select avg(age) from student;

select *from student where age< (select avg(age) from student);
select *from student where age> (select avg(age) from student);

select name, age, (select avg(age) from student) as avg_age from student;

-- display name & course of a student with maximum age

select max(age) from student;
select name, course from student where age = 35;

-- subquery
select name, course, age from student where age= (select max(age) from student);

-- show name, department & salary of employees with max salary from each department
select first_name, department, salary from employees where (department, salary)
in 
(select department, max(salary) from employees group by department);


select first_name, department, salary from employees where (department, salary)
in 
(select department, min(salary) from employees group by department);

select *from employees where employee_id 
in 
(select employee_id from employees where department = 'it');

-- find the avg age of each course

select *from student s1 where age>(select avg(age) from student s2 where s1.course = s2.course);

select course, avg(age) from student group by course;

-- stored procedures

-- 1 get details of all students from d_32 table
delimiter # 
create procedure Student_details()
begin
	select * from student;
End #
delimiter ;
call Student_details;

-- 2 get details of student by Roll_No

delimiter #
create procedure Get_student(Id int)
begin 
select* from student where Roll_No= Id;
end #
delimiter ;
call Get_student(7);


-- IN PARAMETERS
DELIMITER #
CREATE PROCEDURE STUDENT_COURSEs(IN COURSEs VARCHAR(20))
BEGIN
	SELECT* FROM Student WHERE COURSE = COURSEs;
END #
DELIMITER ;
CALL STUDENT_COURSEs('cs');
select*from student;
-- ----------------------------------------------------------- --
-- OUT PARAMETERS
DELIMITER #
CREATE PROCEDURE AVERAGE_INCOME(OUT AVG_INCOME FLOAT)
BEGIN
	SELECT AVG(Mark) INTO AVG_INCOME FROM student;
END #
DELIMITER ;
-- MENTION THE OUTPUT PARAMETER
CALL AVERAGE_INCOME(@RESULT);
SELECT @RESULT AS AVERAGE_INCOME;
-- -------------------------------------------------------------- --
-- COUNT
DELIMITER $
CREATE PROCEDURE TOTAL_STUDENT(OUT STUDENT_COUNT INT)
BEGIN
	 SELECT COUNT(*) INTO STUDENT_COUNT FROM student;
	END $
DELIMITER ;
CALL TOTAL_STUDENT(@result);
SELECT @RESULT AS NUMBEROFSTUDENTS;
-- ---------------------------------------------------------------- --
-- TO DELETE A PROCEDURE
DROP PROCEDURE TOTAL_STUDENTS;
-- ------------------------------------------------------------------ --
-- IN-OUT PARAMETER
DELIMITER $
CREATE PROCEDURE AVG_mark_BY_AGE(IN MIN INT, IN MAX INT, OUT AVG_Mark FLOAT)
BEGIN
	SELECT AVG(Mark) INTO AVG_MARK FROM Student WHERE AGE BETWEEN MIN AND MAX;
    # OR WRITE
    # SELECT AVG(F_INCOME) FROM D_32 WHERE AGE BETWEEN MIN AND MAX;
END $
DELIMITER ;
CALL AVG_mark_BY_AGE(22, 27, @Mark);
SELECT @Mark;
-- ----------------------------------------------------------------- --


-- Create the employee table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    emp_salary DECIMAL(10, 2),
    emp_department VARCHAR(20)
);
-- Insert 10 values into the employee table
INSERT INTO employee (emp_id, emp_name, emp_salary, emp_department)
VALUES
    (1, 'John Doe', 50000.00, 'Sales'),
    (2, 'Jane Smith', 60000.00, 'Marketing'),
    (3, 'Michael Johnson', 55000.00, 'IT'),
    (4, 'Emily Davis', 62000.00, 'Finance'),
    (5, 'David Wilson', 58000.00, 'HR'),
    (6, 'Sarah Thompson', 52000.00, 'Operations'),
    (7, 'Robert Anderson', 65000.00, 'Sales'),
    (8, 'Jessica Taylor', 57000.00, 'Marketing'),
    (9, 'Christopher Brown', 61000.00, 'IT'),
    (10, 'Ashley Miller', 54000.00, 'Finance');
    select* from employee;
    -- before insert trigger
    -- Create a before trigger to automatically update the employee name to uppercase
    
    -- before insert
    
    
DELIMITER $$
CREATE TRIGGER before_insert_employee
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    SET NEW.emp_name = UPPER(NEW.emp_name);
END$$
DELIMITER ;
insert into employee values(11,'ajo babu',25000,'IT');
select * from employee;

-- before update 

DELIMITER $$
CREATE TRIGGER before_update_employee
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN

 -- Check if the new salary is within the allowed range (50000 to 100000)
    IF NEW.emp_salary < 50000 OR NEW.emp_salary > 100000 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Salary must be between 50000 and 100000';
    END IF;
END$$
DELIMITER ;
update employee set emp_salary= 120000 where emp_id = 1;
update employee set emp_salary= 75000 where emp_id = 1;

-- before delete

DELIMITER $$
CREATE TRIGGER before_delete_employee
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
    -- Check if the employee being deleted is in the 'Sales' department
    IF OLD.emp_department = 'Sales' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot delete employees from the Sales department';
    END IF;
END$$
DELIMITER ;
select* from employee;
delete from employee where emp_id = 1;
delete from employee where emp_id = 2;

-- after insert 

DELIMITER $$
CREATE TRIGGER after_insert_employee
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    -- Insert a new record into an audit table
    INSERT INTO employee_audit (audit_action, emp_id, audit_timestamp)
    VALUES ('INSERT', NEW.emp_id, NOW());
END$$
DELIMITER ;
-- Create the employee_audit table
CREATE TABLE employee_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    audit_action VARCHAR(10),
    emp_id INT,
    audit_timestamp TIMESTAMP
);
INSERT INTO employee (emp_id, emp_name, emp_salary, emp_department)
VALUES (12, 'Alice George', 58000.00, 'Sales');
select* from employee;
select * from employee_audit;

-- after delete

delimiter #
create trigger after_delete
after delete on employee for each row 
begin
	update emp_salary_budget set total_budget = total_budget - old.emp_salary;
    end #
delimiter ;
delete from employee where emp_id = 3;
create table emp_salary_budget(total_budget decimal (10,2));
insert into emp_salary_budget values ((select sum(emp_salary) from employee));
select * from emp_salary_budget;
delete from employee where emp_id = 5;

-- after update

delimiter #
create trigger after_update_log
after update on employee for each row
begin
	insert into employee_log(employee_id, action_type, action_time) values (new.emp_id,'update',now());
    end #
delimiter ;

create table employee_log(log_id int auto_increment primary key, 
employee_id int, 
action_type varchar(10),
action_time timestamp
);
update employee set emp_salary = 85000 where emp_id = 1;
select * from employee;
select * from employee_log;


