
create database ED;
use ED;
CREATE TABLE College ( CollegeID INT PRIMARY KEY,CollegeName VARCHAR(100) NOT NULL,
    CollegeLocation VARCHAR(50));
CREATE TABLE University ( UniversityID INT PRIMARY KEY,UniversityName VARCHAR(100) NOT NULL,
    UniversityLoc VARCHAR(50));
CREATE TABLE Student ( StudentID INT PRIMARY KEY, StudentName VARCHAR(50) NOT NULL,
    CollegeID INT FOREIGN KEY REFERENCES College(CollegeID),
    UniversityID INT FOREIGN KEY REFERENCES University(UniversityID));
CREATE TABLE Professor (ProfessorID INT PRIMARY KEY, ProfessorName VARCHAR(50) NOT NULL,
    CollegeID INT FOREIGN KEY REFERENCES College(CollegeID),
    UniversityID INT FOREIGN KEY REFERENCES University(UniversityID));
CREATE TABLE HOD (HodID INT PRIMARY KEY, HodName VARCHAR(50) NOT NULL,HodDepartment VARCHAR(50) NOT NULL,
    CollegeID INT FOREIGN KEY REFERENCES College(CollegeID),
    UniversityID INT FOREIGN KEY REFERENCES University(UniversityID));

insert into College values (1001,'Saratha','Goa');
insert into College values (1002,'Mahendhra','TamilNadu');
insert into College values (1003,'Moonlight', 'Chennai');
select * from college;

insert into University values(101,'AnnaUniversity','India');
insert into University values(102, 'Oxford University', 'England');
select * from University;

INSERT INTO Student (StudentID, StudentName, CollegeID, UniversityID) VALUES (501, 'Prem', 1001, 101);
INSERT INTO Student (StudentID, StudentName, CollegeID, UniversityID) VALUES (502, 'Kumar', 1002, 101);
INSERT INTO Student (StudentID, StudentName, CollegeID, UniversityID) VALUES (503, 'Emily', 1002, 101);
INSERT INTO Student (StudentID, StudentName, CollegeID, UniversityID) VALUES (504, 'Anbu', 1001, 101);
INSERT INTO Student (StudentID, StudentName, CollegeID, UniversityID) VALUES (505, 'Johnson', 1002, 101);
INSERT INTO Student (StudentID, StudentName, CollegeID, UniversityID) VALUES (506, 'Raghu', 1003, 101);
INSERT INTO Student (StudentID, StudentName, CollegeID, UniversityID) VALUES (507, 'sagar', 1003, 101);
select * from student;

INSERT INTO Professor (ProfessorID, ProfessorName, CollegeID, UniversityID) VALUES (301, 'Dr. Robert', 1001, 101);
INSERT INTO Professor (ProfessorID, ProfessorName, CollegeID, UniversityID) VALUES (302, 'Dr. Prabu', 1002, 101);
INSERT INTO Professor (ProfessorID, ProfessorName, CollegeID, UniversityID) VALUES (303, 'Dr. Soundhar', 1001, 101);
INSERT INTO Professor (ProfessorID, ProfessorName, CollegeID, UniversityID) VALUES (304, 'Dr. Kumar', 1003, 101);
INSERT INTO Professor (ProfessorID, ProfessorName, CollegeID, UniversityID) VALUES (305, 'Dr. aj', 1003, 101);
select * from professor;

INSERT INTO HOD (HodID, HodName, HodDepartment, CollegeID, UniversityID) VALUES (701, 'Dr. John', 'ComputerScience', 1003, 101);
INSERT INTO HOD (HodID, HodName, HodDepartment, CollegeID, UniversityID) VALUES (704, 'Dr. Thara', 'English', 1001, 101);
INSERT INTO HOD (HodID, HodName, HodDepartment, CollegeID, UniversityID) VALUES (702, 'Dr. Kannan', 'Business', 1002, 101);
INSERT INTO HOD (HodID, HodName, HodDepartment, CollegeID, UniversityID) VALUES (705, 'Dr. Ramana', 'IT', 1002, 101);
INSERT INTO HOD (HodID, HodName, HodDepartment, CollegeID, UniversityID) VALUES (707, 'Dr. Sumi', 'Physics', 1001, 101);
select * from hod;
--===============================
SELECT
    Student.StudentID, 
	Student.StudentName, 
	College.CollegeName AS StudentCollege,
    University.UniversityName AS StudentUniversity,
	Professor.ProfessorID,Professor.ProfessorName,
    HOD.HodID,HOD.HodName,HOD.HodDepartment,
    College.CollegeLocation AS HodCollegeLocation,
	University.UniversityLoc AS HodUniversityLocation
FROM 
    Student INNER JOIN College
	ON Student.CollegeID = College.CollegeID
	 INNER JOIN University 
	ON Student.UniversityID = University.UniversityID
	LEFT JOIN Professor 
	ON Student.CollegeID = Professor.CollegeID AND Student.UniversityID = Professor.UniversityID
    LEFT JOIN HOD 
	ON Student.CollegeID = HOD.CollegeID AND Student.UniversityID = HOD.UniversityID
	order by Student.StudentName desc;

--===================================









