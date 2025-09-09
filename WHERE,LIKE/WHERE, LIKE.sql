#WHERE statements
SELECT *  FROM employee_salary WHERE salary = 50000;

SELECT first_name, last_name, salary FROM employee_salary WHERE salary > 70000;

SELECT first_name, last_name, salary FROM employee_salary WHERE salary < 50000;

SELECT first_name, last_name, salary FROM employee_salary WHERE salary <= 50000;

SELECT * FROM employee_demographics;

SELECT * FROM employee_demographics WHERE gender='Male' & 'Female';

SELECT * FROM employee_demographics WHERE gender!='Female';

SELECT * FROM employee_demographics WHERE birth_date > '1985-01-01';


#Logical Operators -> AND, OR, NOT in WHERE CLAUSE

SELECT * FROM employee_demographics WHERE birth_date > '1985-01-01' AND gender='male';

SELECT * FROM employee_demographics WHERE birth_date > '1985-01-01' OR gender='male';

SELECT * FROM employee_demographics WHERE birth_date < '1980-01-01' OR NOT gender='Female';

SELECT * FROM employee_demographics WHERE (first_name='Leslie' AND age=44) OR age > 55;

#LIKE STATEMENTS
# We use symbols like % and _ 
SELECT * FROM employee_demographics
WHERE first_name LIKE '%a%';

SELECT * FROM employee_demographics
WHERE first_name LIKE 'a%';

SELECT * FROM employee_demographics
WHERE first_name LIKE 'L__%';

SELECT * FROM employee_demographics
WHERE birth_date LIKE '198%';