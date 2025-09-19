-- create database bca2024slip;
-- SET SQL_SAFE_UPDATES = 0;
use bca2024slip;
-- SLIP 01 
-- Consider the following entities and their relationships. Create a RDB in 3 NF with appropriate data types and Constraints.
-- Student (rollno, sname, class, timetable)
-- Lab (LabNo, LabName, capacity, equipment)
-- Relation between Student and Lab is Many to One.Constraint: Primary Key, capacity should not be null.

create table Lab (LabNo int primary key, 
LabName varchar(10), 
capacity int not null, 
equipment varchar(20));
create table Student (
rollno int primary key, 
sname varchar(20), 
class varchar(10), 
timetable varchar(20), 
labno int, 
foreign key(labno) references Lab(LabNo) );
select * from Lab;
select * from Student;
insert into Lab values(1,'DBMS', 20,'computer'),(2,'C',25,'PCs');
insert into Student values(1,'Mr Deepak', 'FY BCS', '10am to 12pm',1),(2,'Miss Neeta','FYBBA(CA)','8am to 10am',1);

-- 1. Add column Phone_No with data type int in Student table.
alter table Student add column phone_no int;

-- 2. Display practical time table of class ‘FYBBA(CA)’.
select timetable as timetable_Of_FYBBACA from Student where class = 'FYBBA(CA)';

-- 3. Display the LabName in which ‘Mr Deepak’ is doing practical.
select l.LabName from
Student s join Lab l on
s.labno = l.LabNo where s.sname = 'Mr Deepak';

-- 4. Delete the column equipment from Lab table.
alter table Lab drop column equipment;
select * from Lab;

-- Update capacity of Lab to 100 whose Number is 1.
update Lab set capacity = 100 where Labno = 1;
select * from Lab;






