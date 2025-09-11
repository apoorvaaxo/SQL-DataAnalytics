#PART 2: RANKING FUNCTIONS - row_number() , rank() and dense_rank()

SELECT * FROM employees;

#1. Write a query to get the top 3 salaries in each department. 
-- Show the employee name, department, salary, and rank using ROW_NUMBER().

SELECT name, dept, salary,
	ROW_NUMBER() OVER( 
    PARTITION BY dept ORDER BY salary DESC
    ) as row_num
FROM employees;

#2. Show the rank and dense rank of employees by salary in each department.
-- Display name, dept, salary, RANK(), DENSE_RANK().

SELECT name, dept, salary,
	rank() OVER (PARTITION BY dept ORDER BY salary DESC) AS rank_num,
    dense_rank() OVER (PARTITION BY dept ORDER BY salary DESC) AS dense_rank_num
FROM employees;

#3. Find the 2nd highest salary in each department using a ranking function.

SELECT name, dept, salary
FROM (
    SELECT name, dept, salary,
           DENSE_RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS dense_rnk
    FROM employees
) t
WHERE dense_rnk = 2;

#4. Find the 3rd highest salary in each department using a ranking fucntion
SELECT name, dept, salary
FROM (
SELECT name, dept, salary,
	dense_rank() OVER (PARTITION BY dept ORDER BY salary DESC) as dense_rank_num
FROM employees
) t
WHERE dense_rank_num=3;

#5. Get the employee with the highest salary in each department using ROW_NUMBER(). 
-- Only show one row per department.
SELECT name, salary, dept
FROM(
SELECT name, salary, dept, 
	ROW_NUMBER() OVER(PARTITION BY dept ORDER BY salary DESC) as row_num
FROM employees
) t
WHERE row_num =1;


#6. Divide employees into 4 groups based on salary using NTILE(4) 
-- and show name, salary, group_number.

SELECT name, salary,
	NTILE(4) OVER (ORDER BY salary ASC) AS group_number
FROM employees;

#7. List employees in the "Sales" department with RANK() by salary. 
-- Observe where gaps occur when multiple employees have the same salary.

SELECT name, salary, dept, rank_num
FROM(
SELECT name, salary, dept,
	RANK() OVER(PARTITION BY dept ORDER BY salary DESC) as rank_num
FROM employees
) t
WHERE dept='Sales';

#8. Use NTILE(10) to divide employees into 10 percentile groups based on salary. 
-- Show name, salary, percentile_group.

SELECT name, salary, 
	NTILE(10) OVER (ORDER BY salary DESC) as ntile_sal
FROM employees;

#9. List the 3 highest unique salaries across all employees, ignoring ties, and show ranks.

SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

#10. Show name, dept, salary, RANK() OVER (PARTITION BY dept), 
-- DENSE_RANK() OVER (ORDER BY salary DESC) for all employees.

SELECT name, dept, salary,
	RANK() OVER(PARTITION BY dept ORDER BY salary DESC) as rank_dept,
    DENSE_RANK() OVER(ORDER BY salary DESC) as dense_sal
FROM employees;

