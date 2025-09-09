#GROUP BY AND ORDER BY CLAUSE
# GROUP BY
SELECT * FROM employee_demographics;

SELECT avg(age)  FROM employee_demographics GROUP BY gender;

SELECT gender, avg(age)  FROM employee_demographics GROUP BY gender;

SELECT * FROM employee_salary;

SELECT dept_id, avg(salary) FROM employee_salary GROUP BY dept_id;

SELECT  occupation,salary FROM employee_salary GROUP BY occupation,salary;

SELECT gender, avg(age), max(age), COUNT(age),min(age) FROM employee_demographics GROUP BY gender;

#ORDER BY 
SELECT * FROM employee_demographics;

SELECT * FROM employee_demographics ORDER BY first_name;

SELECT * FROM employee_demographics ORDER BY  birth_date DESC;

SELECT * FROM employee_demographics ORDER BY  gender,age DESC,  birth_date ;

SELECT * FROM employee_demographics ORDER BY gender, age;
