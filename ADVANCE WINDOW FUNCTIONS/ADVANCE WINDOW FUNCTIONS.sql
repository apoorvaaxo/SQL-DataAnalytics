# ADVANCED WINDOW FUNCTIONS -- LEAD(), LAG(), FIRST_VALUE(), LAST_VALUE(), Cumulative / Running Totals, 
-- Moving averages / Running totals

SELECT * FROM employees;

#1. For each employee, show their salary, the previous employee’s salary, and 
-- the next employee’s salary within the same department.

SELECT name, salary, dept,
	LAG(salary) OVER(PARTITION BY dept ORDER BY salary DESC) as previous_employee_salary,
    LEAD(salary) OVER (PARTITION BY dept ORDER BY salary DESC) as next_employee_salary
FROM employees;

#2. For each employee, show their department’s highest and lowest salary.
SELECT name, dept, salary,
	FIRST_VALUE(salary) OVER(PARTITION BY dept ORDER BY salary DESC) as highest_salary,
    LAST_VALUE(salary) OVER(PARTITION BY dept ORDER BY salary DESC 
						ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED 
						FOLLOWING) as lowest_salary
FROM employees;

#3. Compute cumulative salary for each department in ascending salary order.

SELECT name, salary, dept,
	SUM(salary) OVER(PARTITION BY dept ORDER BY salary 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as cumulative_sal
FROM employees;