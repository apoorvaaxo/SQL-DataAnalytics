#HAVING vs WHERE

SELECT * FROM employee_demographics;

SELECT gender, avg(age) FROM employee_demographics  GROUP BY gender HAVING avg(age) > 40;

SELECT * FROM employee_salary;

SELECT occupation, avg(salary) 
FROM employee_salary 
WHERE occupation LIKE '%manager%' 
GROUP BY occupation 
HAVING avg(salary) > 75000;