-- INTEGRITY CONSTRAINTS
-- 1. NOT NULL  --> MUST AND SHOULD GIVE
-- 2. UNIQUE    --> MUST AND SHOULD BE UNIQUE WHICH IS NOT PRESENT PREVIOUSLY IN THE TABLE
-- 3. CHECK     --> CHECK THE CONDITION BEFORE INSERT/UPDATE
-- 4. PRIMARY KEY --> (NOT NULL + UNIQUE)
-- 5. FOREIGN KEY -> JOINING TO TABLES


-- 1. NOT NULL
CREATE TABLE emp(
    id NUMBER,
    name VARCHAR2(40) NOT NULL
);

INSERT INTO emp VALUES(1, 'Alice'); -- works
INSERT INTO emp(name) VALUES('Bob'); -- works
INSERT INTO emp(id) VALUES(3); -- Fails because name is mandatory

-- 2. UNIQUE
CREATE TABLE emp(
    id NUMBER,
    name VARCHAR2(40),
    email VARCHAR2(50) UNIQUE
);

INSERT INTO emp VALUES(1,'Alice','alice@gmail.com'); -- works
INSERT INTO emp(name,email) VALUES('Bob','bob@gmail.com'); -- works
INSERT INTO emp(id,email) VALUES(3,'bob@gmail.com'); -- Fails because 'bob@gmail.com' is already exists

-- 3.CHECK
CREATE TABLE emp(
    id NUMBER,
    name VARCHAR2(40),
    email VARCHAR2(50),
    age NUMBER CHECK(age > 0 AND age < 120)
);

INSERT INTO emp VALUES(1,'Alice','alice@gmail.com',19); -- works
INSERT INTO emp VALUES(2,'Bob','Bob@gmail.com',-20); -- Fails because age is negetive
INSERT INTO emp(name,age) VALUES('charlie',40); --Works
INSERT INTO emp(id,name,age) VALUES ('4','Dukky',140) -- Fails because age is greaterthan 120

-- 4. PRIMARY KEY
-- MORE THAN ONE PRIMARY KEY IS NOT ALLOWED IN THE TABLE
CREATE TABLE emp(
    id NUMBER PRIMARY KEY,
    name VARCHAR2(40),
    email VARCHAR2(50)
);

INSERT INTO emp VALUES(1, 'Alice','alice@gmail.com'); -- Works
INSERT INTO emp VALUES(1, 'Bob','bob@gmail.com') -- Fails because id must be unique
INSERT INTO emp(name,email) VALUES ('Chalie','charlie@gmail.com'); -- Fails because id must be not equal to null
-- 5. FOREIGN KEY
CREATE TABLE courses(
    c_id NUMBER PRIMARY KEY,
    c_name VARCHAR2(30) NOT NULL,
    price NUMBER NOT NULL,
    durartion NUMBER NOT NULL
);
--DROP TABLE courses;
INSERT INTO courses VALUES(101,'C Programming',6000,180);
INSERT INTO courses VALUES(102,'Python',7000,160);
INSERT INTO courses VALUES(103,'Java',8000,200);

CREATE TABLE student(
    s_id NUMBER PRIMARY KEY,
    S_name VARCHAR2(30) NOT NULL,
    eamil VARCHAR2(40) NOT NULL,
    Age NUMBER CHECK(age >= 18 AND age <= 100),
    course_id NUMBER REFERENCES courses(c_id)
);
INSERT INTO student VALUES(1,'Alice','alice@gmail.com',19,101);
INSERT INTO student VALUES(2,'Bob','bob@gmail.com',20,103);
SELECT * FROM student;
INSERT INTO student VALUES(3,'Charlie','charlie@gmail.com',18,106);--Falis
 ============================================================================================================================================
                                                            ADDITIONAL
-- FOREIGN KEY WITH
     -- i. ON DELETE CASCADE
     -- ii. ON DELETE SET NULL
-- i. ON DELETE CASCADE
CREATE TABLE departments(
    d_id NUMBER PRIMARY KEY,
    d_name VARCHAR2(30) NOT NULL,
    d_location VARCHAR2(40) NOT NULL
);

CREATE TABLE employee (
    e_id NUMBER PRIMARY KEY,
    e_name VARCHAR2(40) NOT NULL,
    d_id NUMBER REFERENCES departments(d_id) ON DELETE CASCADE
);
-- IF YOU DELETE ANY DEPARTMENT FROM THE DEPARTMENTS TABLE THEN ALL THE EMPLOYEES
-- BELONGS TO THAT DEPARTMENT IN THE EMPLOYEES TABLE ALSO GET DELETED DIRECTLY 

-- II. ON DELETE SET NULL 
CREATE TABLE departments(
    d_id NUMBER PRIMARY KEY,
    d_name VARCHAR2(30) NOT NULL,
    d_location VARCHAR2(40) NOT NULL
);

CREATE TABLE employee (
    e_id NUMBER PRIMARY KEY,
    e_name VARCHAR2(40) NOT NULL,
    d_id NUMBER REFERENCES departments(d_id) ON DELETE SET NULL
);
-- IF YOU DELETE ANY DEPARTMENT IN THE DEPARTMENTS TABLE THE DEPARTMET ID OF THE 
-- EMPLOYEES BELONGS TO THAT DEPARTMENT IS TO NULL IN THE EMPLOYEES TABLE DIRECTLY

     
-- WE CAN USE MULTIPLE CONSTRIANTS FOR ONE COLUMN TOOO
CREATE TABLE emp(
    id NUMBER PRIMARY KEY, -- Only one primary key for one table
    name VARCHAR2(50) NOT NULL,
    mail VARCHAR2(40) UNIQUE NOT NULL,-- two constraints
    age NUMBER CHECK(age > 0 AND age < 100)
);
INSERT INTO emp VALUES(1,'Alice','Alice@gmail.com',19); -- Works
INSERT INTO emp VALUES(2,'Bob','Alice@gmail.com',18); -- Fails because mail should be unique  
INSERT INTO emp(id) VALUES(3); -- Fails because name and mail is mandatory

-- TO SEE THE ALL THE CONSTRAINTS
SELECT constraint_name FROM  USER_CONSTRAINTS WHERE table_name = 'EMP';
SELECT constraint_name,constraint_type FROM  USER_CONSTRAINTS WHERE table_name = 'EMP';

-- > CHANGING CONTRAINT_NAMES
CREATE TABLE employee(
    e_id NUMBER,
    e_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100),
    age NUMBER,
    -- SYTAX : constraint constraint_name constraints_type();
    CONSTRAINT pk_emp PRIMARY KEY(e_id),
    CONSTRAINT mail_uq UNIQUE(email),
    CONSTRAINT age_ck CHECK(age > 18)
    
);




