#LIMIT 
SELECT * FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

SELECT * FROM employee_demographics;

SELECT * FROM employee_demographics
LIMIT 5,4;


#ALIASING
SELECT gender,avg(age) FROM employee_demographics GROUP BY gender; #avg(age) can be written as Average_Age
SELECT gender,avg(age) AS Average_Age FROM employee_demographics GROUP BY gender;
