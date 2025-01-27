CREATE DATABASE StudentMarksProject;
USE StudentMarksProject;
CREATE TABLE Students (
    RollNumber INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender ENUM('Male', 'Female') NOT NULL,
    DOB DATE NOT NULL
);
CREATE TABLE Marks (
    RollNumber INT,
    Tamil INT CHECK (Tamil BETWEEN 0 AND 100),
    English INT CHECK (English BETWEEN 0 AND 100),
    Maths INT CHECK (Maths BETWEEN 0 AND 100),
    Physics INT CHECK (Physics BETWEEN 0 AND 100),
    Chemistry INT CHECK (Chemistry BETWEEN 0 AND 100),
    Biology INT CHECK (Biology BETWEEN 0 AND 100),
    Total INT GENERATED ALWAYS AS 
        (Tamil + English + Maths + Physics + Chemistry + Biology) STORED,
    FOREIGN KEY (RollNumber) REFERENCES Students(RollNumber) ON DELETE CASCADE
);

INSERT INTO Students (RollNumber, Name, Gender, DOB)
VALUES
(1, 'Arun Kumar', 'Male', '2005-06-15'),
(2, 'Saleth Nivetha', 'Female', '2006-01-23'),
(3, 'Vikram Raj', 'Male', '2005-03-12'),
(4, 'Divya Angel', 'Female', '2005-09-14'),
(5, 'Karthik Suresh', 'Male', '2006-07-18'),
(6, 'Nisha Chrispin', 'Female', '2005-08-30'),
(7, 'Rohit Verma', 'Male', '2005-04-25'),
(8, 'Meena Kumari', 'Female', '2005-11-20'),
(9, 'Sanjay Kumar', 'Male', '2005-03-10'),
(10, 'Anjali Mary', 'Female', '2006-06-06'),
(11, 'Ashwin Reddy', 'Male', '2005-07-07'),
(12, 'Neha Sri', 'Female', '2005-12-24'),
(13, 'Rahul Nair', 'Male', '2006-02-01'),
(14, 'Rincy Jerlin', 'Female', '2005-09-05'),
(15, 'Rajesh Pandey', 'Male', '2006-03-08'),
(16, 'Sneha Joy', 'Female', '2005-08-14'),
(17, 'Amit Mishra', 'Male', '2005-05-20'),
(18, 'Swetha Rani', 'Female', '2006-01-01'),
(19, 'Hari Prasad', 'Male', '2005-02-22'),
(20, 'Gayathri Merlin', 'Female', '2005-10-10');

INSERT INTO Marks (RollNumber, Tamil, English, Maths, Physics, Chemistry, Biology)
VALUES
(1, 85, 88, 92, 89, 94, 90),
(2, 78, 74, 80, 85, 79, 88),
(3, 69, 70, 72, 75, 40, 57),
(4, 90, 39, 95, 94, 97, 96),
(5, 87, 82, 59, 81, 78, 85),
(6, 58, 61, 93, 90, 85, 89),
(7, 72, 76, 33, 74, 30, 79),
(8, 85, 88, 92, 91, 87, 89),
(9, 67, 68, 72, 70, 75, 33),
(10, 89, 85, 37, 90, 92, 88),
(11, 77, 79, 81, 33, 84, 82),
(12, 30, 92, 94, 95, 96, 34),
(13, 76, 79, 80, 78, 77, 75),
(14, 89, 88, 92, 41, 93, 94),
(15, 78, 74, 79, 75, 41, 80),
(16, 90, 34, 56, 98, 97, 99),
(17, 42, 70, 75, 74, 73, 32),
(18, 84, 86, 89, 85, 33, 82),
(19, 69, 30, 72, 74, 76, 75),
(20, 88, 89, 90, 92, 51, 93);

UPDATE Marks
SET Tamil = 95, Maths = 99
WHERE RollNumber = 5;

SELECT * FROM Marks WHERE RollNumber = 5;
COMMIT;

DELETE FROM Students WHERE RollNumber = 10;
ROLLBACK;
SELECT * FROM Students WHERE RollNumber = 10;

CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'readonly_password';
GRANT SELECT ON StudentMarksProject.* TO 'readonly_user'@'localhost';
REVOKE DELETE ON StudentMarksProject.* FROM 'readonly_user'@'localhost';

SELECT s.RollNumber, s.Name, s.Gender, s.DOB, m.Total
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber;

SELECT s.Name, m.Biology
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
WHERE m.Biology > 90;

SELECT s.Name, m.maths
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
WHERE m.maths > 90;

SELECT s.Name, m.tamil
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
WHERE m.tamil > 90;

SELECT s.Name, m.english
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
WHERE m. english > 90;

select s. name, m.chemistry
from students s 
join marks m on s.rollnumber = m.rollnumber
where m.chemistry > 90;

SELECT 
    AVG(Tamil) AS Avg_Tamil,
    AVG(English) AS Avg_English,
    AVG(Maths) AS Avg_Maths,
    AVG(Physics) AS Avg_Physics,
    AVG(Chemistry) AS Avg_Chemistry,
    AVG(Biology) AS Avg_Biology
FROM Marks;

SELECT s.Name, m.Total
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
ORDER BY m.Total DESC
LIMIT 3;

SELECT 
    MAX(Total) AS Max_Total,
    MIN(Total) AS Min_Total
FROM Marks;


SELECT COUNT(*) AS Count_Above_90
FROM Marks
WHERE Maths > 90;

SELECT s.Gender, AVG(m.Total) AS Avg_Total_Marks
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
GROUP BY s.Gender;

SELECT 
    MAX(Tamil) AS Max_Tamil,
    MAX(English) AS Max_English,
    MAX(Maths) AS Max_Maths,
    MAX(Physics) AS Max_Physics,
    MAX(Chemistry) AS Max_Chemistry,
    MAX(Biology) AS Max_Biology
FROM Marks;

SELECT 
    MIN(Tamil) AS Min_Tamil,
    MIN(English) AS Min_English,
    MIN(Maths) AS Min_Maths,
    MIN(Physics) AS Min_Physics,
    MIN(Chemistry) AS Min_Chemistry,
    MIN(Biology) AS Min_Biology
FROM Marks;

SELECT RollNumber, Total
FROM Marks;

SELECT 
    MAX(Total) AS Max_Total
FROM Marks;


SELECT 
    COUNT(*) AS Count_Tamil_Above_90
FROM Marks
WHERE Tamil > 90;

SELECT 
    COUNT(*) AS Count_chemistry_Above_90
FROM Marks
WHERE chemistry > 90;

SELECT 
    COUNT(*) AS Count_english_Above_90
FROM Marks
WHERE english > 90;

SELECT s.Name AS Student_Name, m.Tamil AS Max_Tamil
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
WHERE m.Tamil = (SELECT MAX(Tamil) FROM Marks);


SELECT s.Name AS Student_Name, m.English AS Max_English
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
WHERE m.English = (SELECT MAX(English) FROM Marks);

SELECT s.Name AS Student_Name, m.maths AS Max_Maths
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
WHERE m.maths = (SELECT MAX(maths) FROM Marks);

SELECT s.Name AS Student_Name, m.Physics AS Max_Physics
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
WHERE m.Physics = (SELECT MAX(Physics) FROM Marks);

Select s. name as student_name, m.Chemistry as max_Chemistry
from students s
join marks m on s. rollnumber = m. rollnumber
where m.Chemistry =(select max(chemistry) from marks);

Select s. name as student_name, m.biology as max_biology
from students s
join marks m on s. rollnumber = m. rollnumber
where m.biology =(select max(biology) from marks);

Select s. name as student_name, m.tamil as min_tamil
from students s
join marks m on s. rollnumber = m. rollnumber
where m.tamil =(select min(tamil) from marks);


SELECT s.Name AS Student_Name, m.English AS Min_English
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
WHERE m.English = (SELECT Min(English) FROM Marks);

SELECT s.Name AS Student_Name, m.maths AS Min_Maths
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
WHERE m.maths = (SELECT Min(maths) FROM Marks);

SELECT s.Name AS Student_Name, m.Physics AS min_Physics
FROM Students s
JOIN Marks m ON s.RollNumber = m.RollNumber
WHERE m.Physics = (SELECT min(Physics) FROM Marks);

Select s. name as student_name, m.Chemistry as min_Chemistry
from students s
join marks m on s. rollnumber = m. rollnumber
where m.Chemistry =(select min(chemistry) from marks);

Select s. name as student_name, m.biology as min_biology
from students s
join marks m on s. rollnumber = m. rollnumber
where m.biology =(select min(biology) from marks);

select * from students;
select * from Marks;








