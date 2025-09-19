-- PL/SQL
-- PROCUDURAL LANGUAGE EXTENSION FOR SQL
-- PL/SQL -> DEDICATED FOR ORACLE
-- FUNCTIONS, PROCEDURES, TRIGGERS
-- LOOP, CONDITIONALS, VARIABLE DECLARATIONS

-- PL/SQL structure
-- DECLARE (Optional) - > INITIALIZING VARIABLES
-- BEGIN (Mandatory)
    -- Holding the executable code
-- EXCEPTION (Optional)
    -- Used to throw exception, if there are any
-- DBMS_OUTPUT.PUT_LINE() 

SET SERVEROUTPUT ON;
-- PRINT HELLO WORLD ON TO THE SCREEN USING PL/SQL
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;
/

-- DECLARE Block
    -- USED TO DECLARE / INITIALIZE VARIABLES
DECLARE
    -- VARIBLE DECELARTION -> VARIABLE_NAME DATATYPE
    a NUMBER;
    b NUMBER;
    c NUMBER;
BEGIN
    -- ASSIGNMENT OPERATOR :=
    a := 10;
    b := 20;
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Sum is: ' || c);
END;
/

DECLARE
    a NUMBER;
    b NUMBER;
    c NUMBER;
BEGIN
    a := &val1; -- > TO TAKE INPUT FROM USER (& SYMBOL)
    b := &val2;
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Sum is: ' || c);
END;
/


-- FOR FETCHING DATA FROM TABLE
-- INTO PL/SQL
DECLARE
    sal1 NUMBER;
    sal2 NUMBER;
    sal_sum NUMBER;
BEGIN
    SELECT salary INTO sal1 FROM employee WHERE id = 1;
    SELECT salary INTO sal2 FROM employee WHERE id = 2;
    sal_sum := sal1 + sal2;
    DBMS_OUTPUT.PUT_LINE('Sum of salaries is: ' || sal_sum);
END;
/


-- CONDITIONALS IN PL/SQL
-- IF, ELSE ELSIF
-- IF condition THEN

-- IF
-- END IF;
  
-- MAX OF THREE NUMBERS
DECLARE
    a NUMBER;
    b NUMBER;
    c NUMBER;
    max_of_three NUMBER;
BEGIN
    a := 10;
    b := 20;
    c := 30;
    IF a >= b AND a >= c THEN
        max_of_three := a;
    ELSIF b >= c AND b >= a THEN
        max_of_three := b;
    ELSE
        max_of_three := c;
    END IF;
    DBMS_OUTPUT.PUT_LINE(max_of_three);
END;
/


-- LOOPS
-- WHILE (condition)
-- FOR
-- EVERY LOOP MUST END WITH END LOOP;

-- PRINTING 1 TO 10 USING WHILE LOOP IN PL/SQL USING WHILE
-- WHILE condition LOOP

DECLARE
    i NUMBER;
BEGIN
    i := 1;
    WHILE i <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE('Number: ' || i);
        i := i + 1;
    END LOOP;
END;
/


-- DBMS_OUTPUT.PUT_LINE()
-- DBMS_OUTPUT.PUT() --> ACCUMLATES THE RESULT
-- 'I am Gopi From ADITYA UNIVERSITY'
BEGIN
    DBMS_OUTPUT.PUT('I am Gopi ');
    DBMS_OUTPUT.PUT('From ADITY UNIVERSITY');
    DBMS_OUTPUT.NEW_LINE(); -- PRINTS EVERYTING ACCUMULATED SO FOR
END;
/

-- FOR loop
-- SYNTAX :
-- FOR loop_variable IN start_number..end_number LOOP
    -- BODY
-- END LOOP;

-- INSTEAD OF BREAK WE CAN USE EXIT;
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/
  
-- TO PRINT 10 9 8 7, , , , 1;
BEGIN
    FOR i IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/
