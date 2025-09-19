-- CHARACTER FUNCTIONS
-- UPPER() -- > TO CAPITAL LETTERS
-- LOWER() -- > TO SMALL LETTERS
-- INITCAP() -- > TO CAPTILIZE EACH WORD
-- SUBSTR() -- > USED TO GET A PART OF THE STRING FROM ORIGINAL STRING
-- INSTR()
-- REPLACE()
-- || --> CONCATENATION

SELECT UPPER('aditya university') FROM dual; -- > ADITYA UNIVERSITY
SELECT LOWER('AdityA UnivERsITy') FROM employee; -- > aditya university
SELECT INITCAP('aditya university') FROM dual; -- > Aditya University

-- || --> Concatentation operator
SELECT 'aditya' || 'university' FROM dual; -- > "adityauniversity"
SELECT 'aditya' || ' ' || 'university' FROM dual; -- > "aditya university"

-- LENGTH() -> USED TO GET THE NUMBER OF CHARACTERS PRESENT IN THE STRING
SELECT LENGTH('technical hub') FROM dual; -- > 13

-- SUBSTR(string, start_position, [no. of chars])
SELECT SUBSTR('technical hub', 4) FROm dual; -- > "hnical hub" (by default it give upto end)
SELECT SUBSTR('technical hub', 4, 1) FROm dual; -- > "h"
SELECT SUBSTR('technical hub', 11) FROM dual; -- > "hub"
SELECT SUBSTR('technical hub', 5, 4); -- > "nica"


SELECT SUBSTR('technical hub', -1) FROm dual; -- > "b" ( from -1(last) to end)
SELECT SUBSTR('technical hub', -3) FROm dual; -- > "hub"
SELECT SUBSTR('technical hub', -3, 1) FROm dual; -- > "h"

-- TO PRINT THE CONCATENATION OF FIRST AND LAST CHARACTER IN "technical hub"
SELECT
    SUBSTR('technical hub', 1, 1) || SUBSTR('technical hub', -1) -- > "th"
FROM dual;

-- INSTR(string, sub_str, [search_position, occur. no])
-- USED TO FIND WHETHER A SUBSTRING IS PRESENT IN THE ORIGINAL STRING OR NOT
-- IF YES, RETURN THE FIRST LETTER POSITION IN THE MAIN STRING, ELSE RETURNS 0

SELECT INSTR('Oracle SQL', 'SQL') FROM dual; -- > 8
SELECT INSTR('Oracle SQL SQL', 'SQL') FROM dual; -- > 8
SELECT INSTR('Oracle SQL', 'SQL', 9) FROM dual; -- > 0
SELECT INSTR('Oracle SQL SQL', 'SQL', 9) FROM dual; -- > 12

-- TRY TO FIND THE [SECOND] OCCURANCE OF "SQL" IN "Oracle SQL SQL" STRING, START SEARCHING FROM 1 POSI
SELECT INSTR('Oracle SQL SQL', 'SQL', 1, 2) FROM dual; -- > 12

-- START FROM POSITION 5
SELECT INSTR('Oracle SQL SQL SQL', 'SQL', 5, 3) FROM dual; -- > 16
SELECT INSTR('Oracle SQL SQL SQL', 'SQL', 15, 3) FROM dual; -- > 0


-- REPLACE(string, substr, new_string)
-- USED TO REPLACE ALL THE OCCURENCES OF SUBSTR IN THE THE STRING WITH NEW__STRING
SELECT REPLACE('Oracle SQL', 'SQL', 'Database') FROM dual; -- > 'Oracle Database'
SELECT REPLACE('Oracle SQL SQL', 'SQL', 'Database') FROM dual; -- > 'Oracle Database Database'
SELECT REPLACE('2-47-15', '-', ':') FROM dual; -- > '2:47:15:'

-- ASCII() 
--> USED TO GIVE ASCII VALUE OF A CHARACTER
SELECT ASCII('a') FROM dual; -- > 97
SELECT ASCII('#') FROM dual; -- > 35
SELECT ASCII('ABC') FROM dual; -- > 65 (IT ONLY CONSIDER FIRST CHARACTER)

-- CHR() 
--> USED TO GIVE ASCII CHARACTER OF A NUMBER
SELECT CHR(97) FROM dual; -- > a
SELECT CHR(35) FROM dual; -- > #

-- TRIM() 
--> USING TRIM() YOU CAN REMOVE LEADING OR TRAILING CHARACTERS FROM STRING

-- TRIM(character FROM string)
SELECT TRIM('*' FROM '***sql***') AS trimmed_string FROM dual; -- > "sql"

SELECT Length(TRIM('*' FROM '***sql***')) AS trimmed_string FROM dual; -- > 3

SELECT TRIM(' ' FROM '   24B11CS374   ') AS new_string FROM dual; -- > "24B11CS374"
