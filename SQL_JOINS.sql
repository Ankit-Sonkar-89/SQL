CREATE DATABASE STUDENT;
USE  STUDENT;

CREATE TABLE student (
id INT PRIMARY KEY ,
name VARCHAR(50)
);

INSERT INTO student (id , name ) 
VALUES 
( 101 ,"adam" ),
( 102 ,"bob" ),
( 103 ,"casey" );

SELECT * FROM student;

CREATE TABLE course (
id INT PRIMARY KEY , 
course VARCHAR(50) );

INSERT INTO course ( id , course )
VALUES 
( 102 ,"english"),
( 105 ,"math"),
( 103,"science"),
( 107,"computer science");

SELECT * FROM course;

# INNER JOIN PERFOMED
SELECT * 
FROM student
INNER JOIN course 
ON student.id = course.id;

# WE ALSO USE HERE ALIAS (ALTERNATE-NAME)

SELECT *
FROM student as s
INNER JOIN course as c
ON s.id= c.id;

# LEFT JOIN
SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id = c.id;

# RIGHT JOIN
SELECT *
FROM student as s
RIGHT JOIN course as c
ON s.id = c.id;

# FULL JOIN
SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id= c.id
UNION
SELECT *
FROM student as s
RIGHT JOIN course c
ON s.id = c.id;

# LEFT EXCLUSIVE JOIN

SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id = c.id
WHERE c.id IS NULL;

# RIGHT JOIN EXCLUSIVE
SELECT * 
FROM student as s
RIGHT JOIN course as c
ON s.id=c.id
WHERE s.id IS NULL;

# FULL ECXLUSIVE JOIN

SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id = c.id
WHERE c.id IS NULL
UNION
SELECT *
FROM student as s
RIGHT JOIN course as c
ON s.id = c.id 
WHERE s.id IS NULL;

# SELF JOIN CONCEPT

CREATE TABLE employee ( 
id INT PRIMARY KEY ,
name VARCHAR(50) ,
manager_id INT );

INSERT INTO employee ( id , name , manager_id )
VALUES 
( 101 , "adam" , 103 ) ,
( 102 ,"bob" , 104 ) ,
( 103,"casey" , null ) ,
( 104 ,"donald" ,103 );

SELECT * FROM employee;

SELECT 
a.name as manager_name , b.name 
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

# UNION ( ONLY UNIQUE VALUE )
 SELECT name FROM employee
 UNION
 SELECT name FROM employee;
 
 # UNION ALL ( GIVES DUPLICATE VALUE ALSO )
 SELECT name FROM employee
 UNION ALL
 SELECT name FROM employee;
 
 # FOR SQL SUB-QUERY
 
 CREATE TABLE student_1
( id INT PRIMARY KEY , 
name VARCHAR(50) , marks INT );

 INSERT INTO student_1 ( id , name , marks , city )
 VALUES
 ( 101 , "ANIL" , 78,"PUNE"),
 ( 102 , "BHUMIKA" , 93,"MUMBAI"),
 ( 103 , "CHETAN" , 85 ,"DELHI"),
 ( 104 , "DHRUV" , 96 , "DELHI"),
 ( 105 , "EMANUEL" , 92,"MUMBAI"),
 ( 106 , "FARAH" , 82 ,"DELHI");
 
 # QUERY FOR AVG MARKS FIND INDIVIDUALLY
 
 SELECT avg(marks)
 FROM student_1;
 
# FIND NAME WHOSE ABOVE THIS NUMBER 

SELECT marks , name 
FROM student_1
WHERE marks >87.667;

# QUERY - SUB QUERY SINGLE LINE PROCEEDUER SUB- QUERY CONCEPT (DYNAMIC)

SELECT name , marks
FROM student_1
WHERE marks > ( SELECT avg(marks) FROM student_1 );

# QUERY FOR FIND EVEN ID 

SELECT id 
FROM student_1
WHERE id%2=0;

# QUERY FOR FIND EVEN id NAME 

SELECT name 
FROM student_1
WHERE id IN ( 102 , 104 , 106 );

# SUB-QUERY TO FIND EVEN ID ROLLNO NAME

SELECT name , id 
FROM student_1
WHERE id IN ( SELECT id
FROM student_1
WHERE id%2=0 ); 



CREATE TABLE student2( id INT , name VARCHAR(50) , marks INT , city VARCHAR(50));

INSERT INTO student2( id , name , marks , city )
 VALUES
 ( 101 , "ANIL" , 78,"PUNE"),
 ( 102 , "BHUMIKA" , 93,"MUMBAI"),
 ( 103 , "CHETAN" , 85 ,"DELHI"),
 ( 104 , "DHRUV" , 96 , "DELHI"),
 ( 105 , "EMANUEL" , 92,"MUMBAI"),
 ( 106 , "FARAH" , 82 ,"DELHI");
 
 # QUERY FOR DELHI
 
SELECT city 
FROM student2
WHERE city = "DELHI";

# QUERY FOR FIND MAX INTO DELHI

SELECT max(marks)
FROM student2
WHERE city = "DELHI";

# QUERY FOR FIND MAX MARKS FROM SUB-QUERY

SELECT max(marks)
FROM ( SELECT*FROM student2 WHERE city = "DELHI" ) AS temp;

# USING SELECT SUB-QUERY

SELECT ( SELECT max(marks) FROM student2) , name FROM student2; 

# MY SQL VIEWS

CREATE VIEW view1 AS
SELECT id , name , marks  FROM student2;

SELECT * FROM view1;

SELECT * FROM view1
WHERE marks>80;

DROP VIEW view1;

CREATE VIEW view1 AS
SELECT id , name , marks FROM student2;

SELECT * FROM view1;

CREATE VIEW view2 AS
SELECT id , marks FROM student2;

SELECT * FROM view2;

DROP VIEW view1;
DROP VIEW view2;