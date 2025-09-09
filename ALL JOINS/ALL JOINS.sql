#JOINS
SELECT * FROM parks_and_recreation.employee_demographics;
SELECT * FROM parks_and_recreation.employee_salary;

#1. INNER JOINS
SELECT * 
FROM parks_and_recreation.employee_demographics
INNER JOIN parks_and_recreation.employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
;

#using aliasing
SELECT * 
FROM parks_and_recreation.employee_demographics AS ed
INNER JOIN parks_and_recreation.employee_salary AS es
	ON ed.employee_id = es.employee_id
;


SELECT ed.employee_id, age, occupation 
FROM parks_and_recreation.employee_demographics AS ed
INNER JOIN parks_and_recreation.employee_salary AS es
	ON ed.employee_id = es.employee_id
;


#OUTER JOINS

SELECT * 
FROM parks_and_recreation.employee_demographics AS ed
LEFT OUTER JOIN parks_and_recreation.employee_salary AS es
	ON ed.employee_id = es.employee_id
;


SELECT * 
FROM parks_and_recreation.employee_demographics AS ed
RIGHT OUTER JOIN parks_and_recreation.employee_salary AS es
	ON ed.employee_id = es.employee_id
;

#SELF JOIN

SELECT emp1.employee_id AS emp_santa,
emp1.first_name as first_name_santa, emp1.last_name as last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name as first_name, emp2.last_name as last_name 
FROM parks_and_recreation.employee_salary emp1
JOIN parks_and_recreation.employee_salary emp2
	ON emp1.employee_id+1 =emp2.employee_id 
;

#JOIN MULTIPLE TABLES TOGETHER

SELECT *
FROM parks_and_recreation.employee_demographics AS ed
INNER JOIN parks_and_recreation.employee_salary AS es
	ON ed.employee_id = es.employee_id
INNER JOIN parks_and_recreation.parks_departments as pd 
	ON es.dept_id=pd.department_id 
;

SELECT * FROM parks_and_recreation.parks_departments;

