CREATE TABLE Worker (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATE,
    DEPARTMENT VARCHAR(50)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(1, 'Monika', 'Arora', 10000, '2014-02-20', 'HR'),
(2, 'Niharika', 'Singh', 80000, '2014-06-11', 'Admin'),
(3, 'Vishal', 'Sanghal', 300000, '2014-02-20', 'HR'),
(4, 'Amitabh', 'Singh', 50000, '2014-06-11', 'Admin'),
(5, 'Vivek', 'Diwan', 50000, '2014-06-11', 'Account'),
(6, 'Satish', 'Kumar', 75000, '2014-01-21', 'Account'),
(7, 'Geetika', 'Chauhan', 90000, '2014-04-11', 'Admin');

#(1) ans
SELECT * FROM Worker 
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

#(2) ans
SELECT * FROM Worker 
WHERE FIRST_NAME IN ('Vipul', 'Satish');

#(3) ans
SELECT * FROM Worker 
WHERE FIRST_NAME LIKE '_____h';

#(4) ans
SELECT * FROM Worker 
WHERE SALARY BETWEEN 1 AND 75000;

#(5) ans
SELECT FIRST_NAME, LAST_NAME, COUNT(*) 
FROM Worker 
GROUP BY FIRST_NAME, LAST_NAME 
HAVING COUNT(*) > 1;

#(6) ans
SELECT * FROM Worker 
LIMIT 6;

#(7) ans
SELECT DEPARTMENT, COUNT(*) AS Employee_Count 
FROM Worker 
GROUP BY DEPARTMENT 
HAVING COUNT(*) < 5;

#(8) ans
SELECT DEPARTMENT, COUNT(*) AS Employee_Count 
FROM Worker 
GROUP BY DEPARTMENT;

#(9) ans
SELECT DEPARTMENT, COUNT(*) 
FROM Worker 
WHERE SALARY = (SELECT MAX(SALARY) FROM Worker) 
GROUP BY DEPARTMENT;


CREATE TABLE Student (
    StdID INT PRIMARY KEY,
    StdName VARCHAR(100),
    Sex VARCHAR(10),
    Percentage INT,
    Class INT,
    Sec CHAR(1),
    Stream VARCHAR(50),
    DOB DATE
);

INSERT INTO Student (StdID, StdName, Sex, Percentage, Class, Sec, Stream, DOB) VALUES
(1001, 'Surekha Joshi', 'Female', 82, 12, 'A', 'Science', '1998-03-08'),
(1002, 'Maahi Agrawal', 'Female', 56, 11, 'C', 'Commerce', '2008-11-23'),
(1003, 'Sanam Verma', 'Male', 73, 6, 'C', 'Commerce', '2006-06-25'),
(1004, 'Ronit Kumar', 'Male', 63, 11, 'C', 'Commerce', '1997-11-05'),
(1005, 'Dinesh Pulkit', 'Male', 78, 11, 'B', 'Science', '2003-03-14'),
(1006, 'Jahanvi Puri', 'Female', 72, 11, 'B', 'Commerce', '2008-11-07'),
(1007, 'Sanam Kumar', 'Male', 23, 12, 'F', 'Commerce', '1998-03-09'),
(1008, 'Sahil Sarkar', 'Male', 55, 11, 'C', 'Commerce', '2006-01-07'),
(1009, 'Akshaj Agrawal', 'Male', 72, 12, 'B', 'Commerce', '1996-10-01'),
(1010, 'Stuti Mishra', 'Female', 39, 11, 'F', 'Science', '2008-11-23'),
(1011, 'Harsh Agrawal', 'Male', 56, 3, 'B', 'Science', '1998-03-08'),
(1012, 'Nikunj Agrawal', 'Male', 49, 12, 'C', 'Commerce', '1998-06-28'),
(1013, 'Arkiti Saxena', 'Female', 78, 12, 'A', 'Science', '2008-11-23'),
(1014, 'Tani Rastogi', 'Female', 82, 12, 'A', 'Science', '2008-11-23');

#(1) ans
SELECT * FROM Student;

#(2) ans
SELECT StdName, DOB FROM Student;

#(3) ans
SELECT * FROM Student 
WHERE Percentage >= 80;

#(4) ans
SELECT StdName, Stream, Percentage 
FROM Student 
WHERE Percentage > 80;

#(5) ans
SELECT * FROM Student 
WHERE Stream = 'Science' AND Percentage > 75;

