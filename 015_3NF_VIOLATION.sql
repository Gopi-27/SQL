-- 3 NF VIOLATION 
-- SOLUTION FOR 3 NF

CREATE TABLE students
(
    s_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    age NUMBER,
    d_id NUMBER,
    d_name VARCHAR2(50),
    d_location VARCHAR2(100)
);

INSERT INTO students
VALUES 
(1, 'Alice', 21, 101, 'CSE', 'Billgates'),
(2, 'Bob', 18, 102, 'IT', 'Ratan Tata'),
(3, 'Charlie', 19, 101, 'CSE', 'Billgates'),
(4, 'Diana', 17, 103, 'AIML', 'KL Rao'),
(5, 'Frank', 19, 101, 'CSE', 'Billgates'),
(6, 'Gwen', 20, 103, 'AIML', 'KL Rao'),
(7, 'Harry', 18, 102, 'IT', 'Ratan Tata'),
(8, 'Irina', 19, 104, 'DS', 'Billgates'),
(9, 'Jack', 20, 104, 'DS', 'Billgates');

SELECT * FROM students ORDER BY d_id;

-- STEP 1 : CREATE A NEW TALBLE
CREATE TABLE departments AS(
    SELECT d_id,d_name,d_location FROM students
    GROUP BY d_id,d_name,d_location
);

-- STEP 2 : MAKE THE D_ID AS PRIMARY KEY
ALTER TABLE departments MODIFY d_id NUMBER PRIMARY KEY;
  
-- STEP 3: DROP THE EXTRA COLUMNS IN THE STUDENTS TABLE
ALTER TABLE students DROP (d_name,d_location);

-- STEP 4 : ADD FOREIGN KEY
ALTER TABLE students ADD CONSTRAINT fk_dept
FOREIGN KEY(d_id) REFERENCES departments(d_id);


-- TASK ON 3 NF VIOLATION

-- Here each employee can work on only one project
-- And each project is having only 1 client.
-- But the below table is not normalized
-- Your task is to normalize this table and
-- remove the data redundancies

-- DROP TABLE employees CASCADE CONSTRAINTS;
CREATE TABLE employees
(
    e_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    salary NUMBER,
    email VARCHAR2(100),
    project_id NUMBER,
    project_name VARCHAR2(100),
    dead_line DATE,
    client_id NUMBER,
    client_org VARCHAR2(50),
    client_city VARCHAR2(50)
);

-- STEP 1 : CREATE NEW TABLES CALLED PROJECTS AND CLIENTS

CREATE TABLE projects AS(
    SELECT DISTINCT project_id,project_name,dead_line,client_id
    FROM employees
);

CREATE TABLE clients AS(
    SELECT DISTINCT client_id,client_org,client_city
    FROM employees
);

-- STEP 2 : MAKE id's AS PRIMARY KEY IN BOTH PROJECTS AND CLIENTS TABLE;

ALTER TABLE projects MODIFY project_id NUMBER PRIMARY KEY;
ALTER TABLE clients MODIFY client_id NUMBER PRIMARY KEY;


-- STEP 3 : MAKE client_id AS FOREIGN KEY IN THE PROJECTS TABLE
--          MAKE project_id AS FOREIGN KEY IN THE employees TABLE

ALTER TABLE projects ADD CONSTRAINT fk_clnt
FOREIGN KEY(client_id) REFERENCES clients(client_id);

ALTER TABLE employees ADD CONSTRAINT fk_proj
FOREIGN KEY(project_id) REFERENCES projects(project_id);

-- STEP 4 : DROP THE UN NECCESSARY COLUMNS IN THE EMPLOYEES TABLE

ALTER DROP TABLE employees DROP (project_name,dead_line,client_id,client_org,client_city)



