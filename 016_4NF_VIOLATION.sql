-- 4NF VIOLATION EXAMPLE
-- IF A TABLE IS ALREADY IN 3NF AND DOESN'T CONTAIN
-- AND MULTI-VALUED DEPENDENCIES,THEN IT'S IN 4NF
CREATE TABLE aspirants
(
    a_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    age NUMBER,
    email VARCHAR2(50)
);

INSERT INTO aspirants (a_id, name, age, email) VALUES (101, 'Alex King', 22, 'alex@email.com');
INSERT INTO aspirants (a_id, name, age, email) VALUES (102, 'Sara Khan', 25, 'sara@email.com');
INSERT INTO aspirants (a_id, name, age, email) VALUES (103, 'Mike Chen', 19, 'mike@email.com');
INSERT INTO aspirants (a_id, name, age, email) VALUES (104, 'Lena Ortiz', 28, 'lena@email.com');

SELECT * FROM aspirants;

CREATE TABLE aspirant_interests
(
    aspirant_id NUMBER REFERENCES aspirants(a_id),
    skill VARCHAR2(50),
    hobby VARCHAR2(100)
);

INSERT INTO aspirant_interests VALUES(101, 'Java', 'Skating');
INSERT INTO aspirant_interests VALUES(101, 'Python', 'Gaming');
INSERT INTO aspirant_interests VALUES(101, 'UI/UX', 'Skating');

INSERT INTO aspirant_interests VALUES (102, 'Java', 'Reading');
INSERT INTO aspirant_interests VALUES (102, 'Java', 'Cooking');
INSERT INTO aspirant_interests VALUES (102, 'Java', 'Yoga');

INSERT INTO aspirant_interests VALUES (103, 'Design', 'Drawing');
INSERT INTO aspirant_interests VALUES (103, 'UI/UX', 'Drawing');

INSERT INTO aspirant_interests VALUES (104, 'Testing', 'Running');
INSERT INTO aspirant_interests VALUES (104, 'Leadership', 'Guitar');
INSERT INTO aspirant_interests VALUES (104, 'C++', 'Sailing');

SELECT * FROM aspirant_interests;

-- 4 NF VIOLATION 
-- IT IS NOT MANDATORY TO HAVE NEW HOBBY WHILE YOUR LEARNING NEW SKILL
-- AND VICE VERSA

-- NO 2 OR MORE ATTRIBUTES ARE COMBINED THAT ARE COMPLETELY INDIPENDENT AND CAN HAVE MULTIPLE VALUES

-- DECOMPOSE:

CREATE TABLE aspirants_skills AS (
    SELECT aspirant_id,skill FROM aspirant_interests
    GROUP BY aspirant_id,skill
);

CREATE TABLE aspirants_hobbies AS (
    SELECT aspirant_id,hobby FROM aspirant_interests
    GROUP BY aspirant_id,hobby
);
-- WITH OUT ASPIRANT THEIR IS NO SKILL EXISTS
ALTER TABLE aspirants_skills ADD CONSTRAINT fk_id
FOREIGN KEY(aspirant_id) REFERENCES aspirants(a_id);

-- NO PERSON IS ALLOWED TO LEARN SAME SKILL AGAIN AND AGAIN
ALTER TABLE aspirants_skills ADD CONSTRAINT pk_skill
PRIMARY KEY(aspirant_id,skill);

-- NO HOBBY EXIST WITHOUT AN ASPIRANT  
ALTER TABLE aspirants_hobbies ADD CONSTRAINT fk_a_id
FOREIGN KEY(aspirant_id) REFERENCES aspirants(a_id);

-- NO ASPIRANTS IS ALLOWED TO HAVE SAME HOBBY AGAIN AND AGAIN
ALTER TABLE aspirants_hobbies ADD CONSTRAINT pk_skill
PRIMARY KEY(aspirant_id,hobby);

DROP TABLE aspirant_interests;
