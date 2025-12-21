USE College;
CREATE TABLE student (
 rollno INT PRIMARY KEY,
 name VARCHAR(50)
);

SELECT * FROM student;

INSERT INTO  student
( rollno , name )
VALUES
( 1001 , " RAM " ) ,
(1002 , " SHYAM " ),
(1003 , " GHANSHYAM " );

INSERT INTO student VALUES ( 1004 , " VANSHYAM " );

#NEW PRACTICE QUES 

CREATE DATABASE infosys;
USE infosys;
CREATE TABLE employee(
 id INT PRIMARY KEY , name VARCHAR(50) , salary INT 
);

INSERT INTO employee 
( id , name , salary )
VALUES
( 1 , " ADAM ", 25000 ) ,
( 2 , " BOB " , 30000 ) ,
( 3 , " CASEY " , 40000 );

SELECT * FROM employee;

CREATE TABLE temp1 (
id INT UNIQUE
);

INSERT INTO temp1 VALUES ( 101 )

