# STRING FUNCTIONS

#1. LENGTH
SELECT LENGTH('SKYFALL');

SELECT * FROM employee_demographics;

SELECT first_name, length(first_name) FROM employee_demographics
ORDER BY 2;

#2. UPPER and LOWER
SELECT UPPER('sky');

SELECT LOWER('SKY');

SELECT first_name, UPPER(first_name) FROM employee_demographics
ORDER BY 2;

#3. TRIM , LEFT TRIM AND RIGHT TRIM
#REMOVES WHITESPECS

SELECT TRIM('                  SKY                 ');
SELECT LTRIM('                  SKY                 ');
SELECT RTRIM('                  SKY                 ');

#4. SUBSTRINGS

SELECT first_name, LEFT(first_name, 4) FROM employee_demographics;
SELECT first_name, LEFT(first_name, 2) FROM employee_demographics;
SELECT first_name, RIGHT(first_name, 2) FROM employee_demographics;

SELECT first_name,SUBSTRING(first_name, 3,2) FROM employee_demographics;

SELECT * FROM employee_demographics;
SELECT first_name,birth_date,SUBSTRING(birth_date,1,4) FROM employee_demographics;


#5. REPLACE
SELECT first_name, REPLACE(first_name, 'a', 'z') FROM employee_demographics;

#6. LOCATE
SELECT LOCATE('x','Alexander'); 

SELECT first_name, LOCATE('An',first_name) FROM employee_demographics;

#7. CONCATENATION
SELECT first_name, last_name ,
CONCAT(first_name,'  ' ,last_name) AS full_name
FROM employee_demographics;
