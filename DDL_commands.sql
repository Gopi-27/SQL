-- DDL COMMANDS
--> DATA DEFINATION LANGUAGE
--> To make changes in Stucture Level
--> Short Cut CARD-T
-- CREATE,ALTER,RENAME,DROP,TURNCATE
--> 1. CREATE
--> To Create a Object in the Database
--> CREATE TABLE table_name(value1 datatype1,value2 datatype2,......)
CREATE TABLE employee(
  id NUMBER,
  name VARCHAR2(50),
  email VARCHAR2(30)
  );
--> 2. ALTER
-->
--> i. ALTER + ADD
--> ii. ALTER + MODIFY
--> iii. ALTER + RENAME
--> iv. ALTER + DROP

--> 2.i ALTER TABLE table_name ADD new_col_name new_data_type; 
--> To add one new column
--> ALTER TABLE table_name ADD (new_col_name1 new_data_type1,new_col2 new_dtype2); 
--> To add multiple new columns
ALTER TABLE employee ADD gender VARCHAR2(7);
ALTER TABLE employee ADD (exp NUMBER,salary NUMBER(8,2));
--> 2.ii ALTER TABLE table_name MODIFY col_name new_dtype;
--> ALTER TABLE table_name MODIFY(col_name1 new_dtype1,col_nname2 new_dtype2);
ALTER TABLE employee MODIFY gender VARCHAR2(13);
ALTER TABLE employee MODIFY(name VARCHAR2(40), salary NUMBER(9,2));
--> 2.iii ALTER TABLE table_name RENAME COLUMN old_name TO new_name
--> To change  name of the column
ALTER TABLE employee RENAME COLUMN email TO mail_id;

--> 2.iv ALTER TABLE table_name DROP COLUMN col_name;
--> TO  remove entire column and data
ALTER TABLE employee DROP COLUMN exp;

--> 3. RENAME - TO change name of the object
--> RENAME old_name TO new_name;
RENAME employee TO emp_data;

--> 4.TRUNCATE - to erase only data present in table
--> TRUNCATE TABLE table_name;
TRUNCATE TABLE emp_data;

--> 5. DROP - to delete entire object;
--> DROP TABLE table_name;
DROP TABLE emp_data;







