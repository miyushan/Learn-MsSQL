--create a new batabase
CREATE DATABASE happy;
USE happy;	--initialize the database


--create another database
CREATE DATABASE sad;
--delete a database
DROP DATABASE sad;



--create a table
CREATE TABLE employee(
	e_id INT,
	e_name VARCHAR(20),
	e_salary INT,
	e_age INT,
	e_gender VARCHAR(20),
	e_dept VARCHAR(20),
	PRIMARY KEY(e_id)
);
DROP TABLE employee;		--to delete the table


--enter data to the table
INSERT INTO employee VALUES(
	1,'Sam',95000,45,'Male','Operations'
);
INSERT INTO employee VALUES(
	2,'Bob',8000,21,'Male','Support'
);
INSERT INTO employee VALUES(
	3,'Anne',125000,25,'Female','Analytics'
);
INSERT INTO employee VALUES(
	4,'Julia',73000,30,'Female','Analytics'
);
INSERT INTO employee VALUES(
	5,'Matt',159000,33,'Male','Sales'
);
INSERT INTO employee VALUES(
	6,'Jeff',112000,27,'Male','Operations'
);
SELECT * FROM employee;



--create a new tabe with its data
CREATE TABLE department(
	d_id INT,
	d_name VARCHAR(20),
	d_location VARCHAR(20),
	PRIMARY KEY(d_id)
);

SELECT * FROM department;

INSERT INTO department VALUES(1,'Content','New York'),
(2,'Support','Chicago'),
(3,'Analytics','New York'),
(4,'Sales','Boston'),
(5,'Tech','Dallas'),
(6,'France','Chicago');




--select specific data from the database
SELECT e_age FROM employee;
SELECT e_name, e_gender FROM employee;

--select all data from the database
SELECT * FROM employee;



--select distinct values in a column
SELECT DISTINCT e_gender FROM employee




--Clause Syntax/Filter
SELECT * from employee WHERE e_gender='Female';
SELECT * from employee WHERE e_age<30;
SELECT * from employee WHERE e_salary>100000; 


 
--AND operator
SELECT * from employee WHERE e_gender='Male' AND e_age<30;
SELECT * from employee WHERE e_dept='Operations' AND e_salary>100000;
--OR operator
SELECT * from employee WHERE e_dept='Operations' OR e_dept='Analytics';
--NOT operator
SELECT * FROM employee WHERE NOT e_gender='Female';
--LIKE operator
SELECT * FROM employee WHERE e_age LIKE '3_';
--BETWEEN operator
SELECT * FROM employee WHERE e_age BETWEEN 25 AND 30;



--functions
--min()
SELECT min(e_age) FROM employee;
--max()
SELECT max(e_salary) FROM employee;
--count()
SELECT count(*) FROM employee WHERE e_gender='Male';
--sum()
SELECT sum(e_salary) FROM employee;
--avg()
SELECT avg(e_age) FROM employee;


--ltrim()	--remove left space
SELECT '    space';
SELECT ltrim('    space');
--lower()
SELECT 'THIS IS UPPERCASE';
SELECT lower('THIS IS UPPERCASE');
--upper()
SELECT 'this is lowercase';
SELECT upper('this is lowercase');
--reverse()
SELECT 'this will reverse';
SELECT REVERSE('this will reverse');
--substring()
SELECT 'This will substring';
SELECT SUBSTRING('This will substring',11,9);



--order by syntax
--ascending order
SELECT * FROM employee ORDER BY e_salary;
--descending order
SELECT * FROM employee ORDER BY e_salary DESC;


--top
SELECT TOP 3 * FROM employee;


--top by ordering
SELECT TOP 3 * FROM employee ORDER BY e_age DESC;

SELECT avg(e_age), e_dept from employee GROUP BY e_dept ORDER BY avg(e_age) DESC;


--having Clause
SELECT e_dept, avg(e_salary) as avg_salary
FROM employee
GROUP BY e_dept
HAVING avg(e_salary) >100000


--Update data/ modify
UPDATE employee SET e_age=42 WHERE e_name='Sam';
UPDATE employee SET e_dept='Tech' WHERE e_gender='Female';
SELECT * FROM employee;		--see modified table
UPDATE employee SET e_salary=50000;


--Delete records
DELETE FROM employee WHERE e_age=33;
DELETE FROM employee WHERE e_name='Sam';
SELECT * FROM employee;		--see modified table


--Truncate data/ Delete all data in a table
TRUNCATE TABLE employee; 
SELECT * FROM employee;		--see modified table



--Inner join
SELECT employee.e_name, employee.e_dept, department.d_name, department.d_location
FROM employee
INNER JOIN department ON employee.e_dept=department.d_name;

--Left join
SELECT employee.e_name, employee.e_dept, department.d_name, department.d_location
FROM employee
LEFT JOIN department ON employee.e_dept=department.d_name;

--Right join
SELECT employee.e_name, employee.e_dept, department.d_name, department.d_location
FROM employee
RIGHT JOIN department ON employee.e_dept=department.d_name;

--Full join
SELECT employee.e_name, employee.e_dept, department.d_name, department.d_location
FROM employee
FULL JOIN department ON employee.e_dept=department.d_name;


--Update using join
UPDATE employee
SET e_age=e_age+10
FROM employee
JOIN department ON employee.e_dept=department.d_name
WHERE d_location = 'New York'
SELECT * FROM employee;		--see modified table


--Delete using join
DELETE employee
FROM employee
JOIN department ON employee.e_dept=department.d_name
WHERE d_location = 'New York';
SELECT * FROM employee;		--see modified table