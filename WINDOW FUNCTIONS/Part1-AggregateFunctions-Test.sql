#WINDOW FUNCTIONS - TEST
SELECT * FROM employees;

#Part 1: Aggregate Window Functions (AVG, SUM, MIN, MAX)
#1. Show each employee’s salary along with the average salary in their department.
SELECT name, salary, dept, 
	AVG(salary) OVER (
		PARTITION BY dept    
    ) AS dept_avg_salary
FROM employees;

#2.Show each employee’s salary along with the highest salary in their department.
SELECT name, salary, dept,
	MAX(salary) OVER(
		PARTITION BY dept) AS highest_salary_dept
FROM employees;

#3.Show each employee’s salary compared to the overall company average salary.
SELECT name, salary, dept ,
	AVG(salary) OVER  () as AVG_COMPANY_SALARY
FROM employees;

#4. For each employee, show their salary and the total salary of their department
SELECT name, salary, dept,
	SUM(salary) OVER(
		PARTITION BY dept) as total_sal_dept
FROM employees;


#5. Show each employee’s salary and the difference between their salary and dept average
SELECT name, salary, dept,
	salary - AVG(salary) OVER (
		PARTITION BY dept) as diff_sal_dept
FROM employees;

#6. Find the employees whose salary is greater than their department’s average salary
SELECT name, salary
FROM (
    SELECT name, salary, AVG(salary) OVER (PARTITION BY dept) AS dept_avg
    FROM employees
) t
WHERE salary > dept_avg;

#7. Find the employee(s) earning the minimum salary in each department (keep all rows visible)
SELECT name, salary, dept,
	MIN(salary) OVER (
    PARTITION BY dept
    ) as min_sal_dept
FROM employees;

#8. Find employees whose salary is above their department’s average.
SELECT name, salary, dept
FROM (
    SELECT name, salary, dept,
           AVG(salary) OVER (PARTITION BY dept) AS dept_avg
    FROM employees
) t
WHERE salary > dept_avg;


#9. Find employees above the company average salary
SELECT name,salary,dept
FROM(
SELECT name, salary,dept ,
	AVG(salary) OVER ()
as AVG_SALARY FROM employees
) t
WHERE salary > AVG_SALARY;


#10. Find the highest paid employee(s) in each department.


SELECT name, salary, dept,
	MAX(salary) OVER (
    PARTITION BY dept) as high_employee_dept
    FROM employees
