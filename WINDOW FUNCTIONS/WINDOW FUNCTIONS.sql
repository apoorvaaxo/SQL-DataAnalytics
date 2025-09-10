#WINDOW FUNCTIONS


SELECT * FROM employee_demographics;

SELECT * FROM employee_salary;

#HOW GROUP BY WORKS
SELECT gender, AVG(salary) as AVG_salary
FROM employee_demographics as dem 
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
GROUP BY gender;


#HOW WINDOW FUNCTIONS WORK
SELECT dem.first_name, dem.last_name , AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics as dem 
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name, dem.last_name , gender, SUM(salary) OVER(PARTITION BY gender)
FROM employee_demographics as dem 
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
;

#ROLLING OVER
SELECT dem.first_name, dem.last_name , gender, salary, 
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS ROLLING_TOTAL
FROM employee_demographics as dem 
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
;


#ROW NUMBER
SELECT dem.employee_id, dem.first_name, dem.last_name , gender, salary, 
row_number() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num
FROM employee_demographics as dem 
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
;


#RANK NUMBER
SELECT dem.employee_id, dem.first_name, dem.last_name , gender, salary, 
row_number() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as rank_num
FROM employee_demographics as dem 
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
;

#DENSE RANK
SELECT dem.employee_id, dem.first_name, dem.last_name , gender, salary, 
row_number() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as rank_num,
dense_rank() OVER(PARTITION BY gender ORDER BY salary DESC) as dense_rank_num
FROM employee_demographics as dem 
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
;


