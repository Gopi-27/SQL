-- > DML COMMANDS 
-- > DATA MANUPULATION LANGUAGES
-- > 1. INSERT 
-- > 2. UPDATE
-- > 3. DELETE

CREATE TABLE employee(
    id NUMBER,
    name VARCHAR2(50),
    salary  NUMBER(7, 2), --> CAN STORE TWO DIGITS AFTER POINT
    doj DATE
);
--> 1. INSERT
INSERT INTO employee VALUES(1, 'Alice', 56000.50, '10-JUL-25');--> CURRENT NLS_DATE_FORMAT, IT MAY VARIES
INSERT INTO employee(name,id) VALUES('Duke',4); -- > USED TO INSERT IN SPECIFIED COLUMNS AND REAMING VALUES ARE NULL

-- Using TO_DATE() function
INSERT INTO employee VALUES(2, 'Bob', 45000.12, TO_DATE('10-08-2024', 'DD-MM-YYYY'));
INSERT INTO employee VALUES(3, 'Charlie', 45000.12, TO_DATE('2023-09-23', 'YYYY-MM-DD'));

SELECT * FROM employee;

-- nls_date_format parameter
-- Command to find the current session's NLS_DATE_FORMAT
SELECT value FROM nls_session_parameters WHERE parameter='NLS_DATE_FORMAT';

-- > 2. UPDATE
CREATE TABLE users(
    u_id NUMBER,
    u_name VARCHAR2(50),
    email_id VARCHAR2(100),
    user_since DATE
);
INSERT INTO users(u_id, u_name) VALUES(1, 'Alice');
INSERT INTO users(u_id, u_name) VALUES(2, 'Bob');
SELECT * FROM users;
-- > WITHOUT WHERE CLAUSE, WILL UPDATE ENTIRE COULMN
UPDATE users SET email_id = 'alice@gmail.com'; -- > ALL THE EMAIL_ID ARE CHANGED TO 'alice@gmail.com'

-- > WITH WHERE CLAUSE, WILL UPDATE ONLY SPECIFIED FILED
UPDATE users SET email_id = 'bob@gmail.com' WHERE u_id = 2;
SELECT * FROM product;
--> DELETE

DELETE FROM product WHERE product_id = 1; -- > USED TO DELETE PARTICULAR ROW
