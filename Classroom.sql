CREATE DATABASE university;
USE university;

CREATE TABLE unistudent (
rollno INT PRIMARY KEY ,
name VARCHAR(50) ,
marks INT NOT NULL ,
grade VARCHAR (1) ,
city VARCHAR (20)
 );
 
 INSERT INTO unistudent
 ( rollno , name , marks , grade , city )
 VALUES
 (101,"ANIL",78,"C","PUNE"),
 (102,"BHUMIKA",93,"A","MUMBAI"),
 (103,"CHETAN",85,"B","MUMBAI"),
 (104,"DHRUV",96,"A","DELHI"),
 (105,"EMANUEL",12,"F","DELHI"),
 (106,"FARAH",82,"B","DELHI");
 
 SELECT name , city , rollno FROM unistudent;
 SELECT * FROM unistudent;
 SELECT DISTINCT city FROM unistudent;
 
 SELECT * 
 FROM unistudent
 WHERE marks > 80 ;
 
 SELECT * FROM unistudent WHERE city = "MUMBAI" ;
 SELECT * FROM unistudent WHERE marks > 80 AND city = "DELHI";
SELECT * FROM unistudent WHERE marks+10 > 100 ;
SELECT * FROM unistudent WHERE marks > 80 AND city ="MUMBAI";
SELECT * FROM unistudent WHERE marks>90 OR city="MUMBAI";
 SELECT * FROM unistudent WHERE marks BETWEEN 80 AND 90;
 SELECT * FROM unistudent WHERE city IN ("DELHI" , "MUMBAI");
 SELECT * FROM unistudent WHERE city NOT IN ("DELHI" , "MUMBAI");
 SELECT * FROM unistudent LIMIT 3;
 SELECT * FROM unistudent WHERE marks > 75 LIMIT 3;
 SELECT * FROM unistudent ORDER BY city ASC;
 SELECT * FROM unistudent ORDER BY city DESC;
 SELECT * FROM unistudent ORDER BY marks ASC;
 SELECT * FROM unistudent ORDER BY marks DESC LIMIT 3;
 SELECT max(marks) FROM unistudent;
 SELECT avg(marks) FROM unistudent;
 SELECT min(marks) FROM unistudent;
 SELECT count(marks) FROM unistudent;
 SELECT sum(marks) FROM unistudent;
 SELECT  city FROM unistudent GROUP BY city;
 SELECT city , count(rollno) FROM unistudent GROUP BY city;
 SELECT city , avg(marks) FROM unistudent GROUP BY city;
 SELECT city , avg (marks) FROM unistudent GROUP BY city ORDER BY avg(marks) ASC;
 SELECT grade ,count(rollno) FROM unistudent GROUP BY grade ORDER BY grade ASC;
 SELECT city , count(rollno) FROM unistudent GROUP BY city HAVING max(marks) >90;
 # GENERAL ORDER ( SEQUENCE )
 SELECT city
 FROM unistudent
 WHERE grade = "A"
 GROUP BY city
 HAVING max(marks) >=93
 ORDER BY city ASC;
 
 # CHANGE SAFE MODE TO UPDATE 
  SET SQL_SAFE_UPDATES =0;
  
 UPDATE unistudent
 SET grade = "O"
 WHERE grade = "A";
 
 UPDATE unistudent
 SET marks = 92
 WHERE marks = 12;
 
 UPDATE unistudent
 SET marks = 82
 WHERE rollno = 105;
 
 UPDATE unistudent
 SET grade = "B"
 WHERE marks BETWEEN 80 AND 90;
 
 UPDATE unistudent
 SET marks = marks+1;
 
 UPDATE unistudent
 SET marks = 12
 WHERE rollno = 105;
 
 DELETE FROM unistudent
 WHERE marks < 33;
 
 SELECT * FROM unistudent;
 
 # FOREGIN KEY EX AND CASCADING EXAMPLE
 
 CREATE TABLE dept ( id
 INT PRIMARY KEY , name VARCHAR(50) ) ;
 
 INSERT INTO dept
 VALUES
 ( 101 , "SCIENCE" ),
 ( 102 , "IT");
 
 SELECT * FROM dept;
 # UPDATE ON PRIMARY KEY WHICH ARE FOREGIN KEY OF TEACHER I UPDATE HERE CHANGE COMES OTHER SIDE ALSO 
 UPDATE dept
 SET id = "111"
 WHERE id = "101";
 
 CREATE TABLE teacher ( 
 id INT PRIMARY KEY ,
 name VARCHAR(50) ,
 dept_id INT ,
 FOREIGN KEY ( dept_id) REFERENCES dept( id )
 ON UPDATE CASCADE 
 ON DELETE CASCADE 
 );
 
 INSERT INTO teacher
 VALUES
 ( 101 , "VINOD" , 101 ),
 ( 102 , "AMIT" , 102);
 
 SELECT * FROM teacher;
 
 #ALTER COMMANDS
 
 #ADD COLOUMN
 ALTER TABLE unistudent
 ADD COLUMN age INT NOT NULL DEFAULT 19;
 
 #RENAME THE TABLE NAME
 ALTER TABLE unistudent
 RENAME TO stu_age;
 #RECHANGE
 ALTER TABLE stu_age
 RENAME TO unistudent;
 
 #DATATYPE CHANGE
 ALTER TABLE unistudent
 MODIFY age VARCHAR(2);
 
 INSERT INTO unistudent 
 VALUES
 ( 111 , "ANKIT" , 79 ,"B", "UNNAO" , 20 );
 
 #RECHANGE DATATYPE
 ALTER TABLE unistudent
 MODIFY age INT ;
 
 #CHANGE COLOUMN NAME
 ALTER TABLE unistudent
 CHANGE age stu_age INT;
 
 #DELETE A COLUMN
 ALTER TABLE unistudent
 DROP COLUMN stu_age;
 
 SELECT * FROM unistudent;
 
 # TO DELETE WHOLE DATA IN TABLE
 TRUNCATE TABLE unistudent;
 
# PRACTICE QUES 
 ALTER TABLE unistudent
 CHANGE name full_name VARCHAR(50);
 
 DELETE FROM unistudent
 WHERE marks <80;
 
 ALTER TABLE unistudent
 DROP COLUMN grade;
 
 
 
 SELECT AVG(marks)
 FROM unistudent;

 SELECT marks 
 FROM unistudent 
 WHERE marks > 89.00;
 
 