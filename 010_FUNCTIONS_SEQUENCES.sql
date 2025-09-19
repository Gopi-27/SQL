
-- FUNCTIONS
-- A FUNCTION MUST ALWAYS RETURN A VALUE
-- THE PARAMETERS FOR FUNCTION ARE OPTIONAL
-- SYNTAX :
-- CREATE [OR REPLACE] FUNCTION function_name[(OPT. PARAMETER])
-- RETURN datatype IS/AS
      -- declaration section
-- BEGIN
         -- body
-- END;

-- FUNCTION THAT ADDS TWO NUMBERS AND RETURNS THE RESULT
CREATE OR REPLACE FUNCTION add_two(a NUMBER, b NUMBER)
RETURN NUMBER IS
    c NUMBER;
BEGIN
    c := a + b;
    RETURN c;
END;
/
-- WAY :- 1
-- CALLING THE FUNCTION
-- DIRECTLY USE IN SQL STATEMENTS

SELECT add_two(10, 20) FROM dual;
SELECT add_two(age, salary) FROM employee;
-- WAY :- 2
-- CALLING THE FUNCTION IN ANTOTHER PL/BLOCK
DECLARE
    res NUMBER;
BEGIN
    res := add_two(100, 200);
    DBMS_OUTPUT.PUT_LINE(res);
END;
/

-- NAME, GENDER
CREATE OR REPLACE
FUNCTION wish(name VARCHAR2, gender VARCHAR2) 
RETURN VARCHAR2 IS
    res VARCHAR2(200);
BEGIN
    IF gender = 'Male' THEN
        res := 'Hi, Mr. ' || name;
    ELSE
        res := 'Hi, Ms. ' || name;
    END IF;
    RETURN res;
END;
/

SELECT wish('GOPI', 'Male') FROM dual;
SELECT wish(name, gender) FROM employee;

-- MONTHS_BETWEEN() RETURN THER NUMBERS OF MONTHES BETWEEN TWO GIVEN DATES
SELECT 
    MONTHS_BETWEEN(CURRENT_DATE, DATE '2024-09-11') AS months
FROM dual; 

CREATE OR REPLACE FUNCTION
getYears(join_date DATE) RETURN NUMBER
IS
    months NUMBER;
    exp NUMBER;
BEGIN
    months := MONTHS_BETWEEN(CURRENT_DATE, join_date);
    exp := TRUNC(months/12);
    RETURN exp;
END;
/


-- SEQUENCES 
  -- SEQUENCES ARE SQL OBJECTS THAT HELPS US GENERATE NUMBERS IN SEQUENCE

-- SYNTAX :
CREATE SEQUENCE my_first_seq START WITH 1 INCREMENT BY 1;

-- TO RESTART THE SEQUENCE 
ALTER SEQUENCE my_first_seq RESTART START WITH 1;

-- TO GET NEXT VALUE USE
-- SEQUENCE_NAME.NEXTVAL

SELECT 'ORD-' || LPAD(my_first_seq.NEXTVAL, 5, 0) FROM dual;

-- LPAD([number], [no.of digits],[value to place in empty places])

CREATE OR REPLACE FUNCTION generateNewOrderId
RETURN VARCHAR2 IS
BEGIN
    RETURN 'ORD-' || LPAD(my_first_seq.NEXTVAL, 5, 0);
END;
/

-- THE ORDER IDS ARE GENERATED USING THE SEQUENCES
  
INSERT INTO orders(ord_id, customer_id, product_id)
VALUES
(generateNewOrderId(), 1, 102),
(generateNewOrderId(), 2, 103),
(generateNewOrderId(), 3, 101),
(generateNewOrderId(), 1, 101);
