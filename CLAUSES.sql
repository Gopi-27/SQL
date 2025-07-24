---- CLAUSES
-- 1. WHERE
-- 2. CASE

-- USING SELECT:

SELECT name,age,salary,salary+25000 AS new_salary FROM employee;
 -- GETS SALARY + 25000 AS NEW COLUMN TO DISPLAY

SELECT name,department,gender FROM employee WHERE department='HR';
 -- GETS ALL HR DEPARTMENT EMPLOYEES DATA

SELECT id,name,date_of_joining,department,gender FROM employee WHERE gender='Female' AND department='Operations'; 
-- GETS THE ALL OPERATIONS DEPARTEMENT FEMALE EMPLOYESS DATA

SELECT name,salary,department FROM employee WHERE (department='SW' OR department='Testing') AND salary > 50000;
-- GETS THE ALL THE EMPLOYEES DATA WHOSE SALARY IS MORE THAN Rs. 50,000.00/- AND DEPARTMENT BELONGS TO EITHER 'SW' OR 'TESTING'

SELECT id,name,email,date_of_joining FROM employee WHERE date_of_joining IS NULL;
-- CHECKING THE NULL VALUE IS ONLY DONE USING KEYWORDS LIKE "IS NULL , IS NOT NULL"

SELECT * FROM employee WHERE department='SW' AND date_of_joining > TO_DATE('01-01-2020','DD-MM-YYYY' );
-- DATE CAN BE COMPARE LIKE ABOVE QUERY

SELECT id,name,email,salary,
CASE 
    WHEN salary >= 75000 THEN 'High'
    WHEN salary >= 50000 THEN 'Medium'
    WHEN salary IS NOT NULL THEN 'Low'
    ELSE  'Can ''t be determine'
END AS level_of_payment
FROM employee;

-- USING UPDATE:

UPDATE employee SET age = 34 WHERE id = 1;
-- UPDATES EMPLOYEE AGE OF ID NUMBER 1

UPDATE employee SET department = 'SWE' WHERE department = 'SW';
-- CHANGES THE DEPARTMENT SW TO SWE

UPDATE employee SET salary = salary + 2000 WHERE department = 'Operations' AND salary < 40000;
-- INCREASES THE SALARY OF EMPLOYEES WHOSE DEPARTEMENT IS OPERATIONS AND SALARY IS LESSTAN 40000

UPDATE employee SET age = 21 WHERE age IS NULL;
-- CHANGES THE AGE OF EMPLOYEE WHOSE DATE IS NULL 

UPDATE employee SET salary = 
CASE 
    WHEN department = 'HR' THEN salary * 1.10 -- INCREASE BY 10%
    WHEN department = 'SW' THEN  salary * 1.15 --INCREASE BY 15%
    WHEN department = 'Operations' THEN salary * 1.20 -- INCREASEE BY 20%
    WHEN department = 'Testing' THEN salary * 1.25 -- INCREASE BY 25%
END;
