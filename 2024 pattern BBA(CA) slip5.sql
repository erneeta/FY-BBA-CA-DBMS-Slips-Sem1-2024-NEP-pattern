-- Slip 5
-- Consider the following entities and their relationships. Create a RDB in 3 NF with appropriate data types and Constraints. [15 M]
-- Student (rno,sname,address,class)
-- Subject (subno,subname)
-- Relationship: - Student and Subject are related with many-to-many relationship with attribute marks and status.
-- Constraints: - Primary Key, class must be FY,SY,TY.

create table Student5(
rno int primary key, 
sname varchar(20) not null, 
address varchar(25), 
class char(02) check(class in('FY','SY','TY')));

create table Subject5(
subno int primary key, 
subname varchar(15) not null);

create table result5(
rno int,
subno int,
marks float,
status5 varchar(10),
primary key(rno,subno),
foreign key(rno) references student5(rno),
foreign key(subno) references subject5(subno));

insert into student5 values(
1,'Ajay','UruliKanchan','FY'),
(2,'Vijay','Pune','SY'),
(3,'Sanjay','Pimpari','TY'),
(4,'Jay','UruliKanchan','FY');

insert into subject5 values(1,'Database'),
(2,'Electronics'),
(3, 'Statistics'),
(4, 'Comp n/w');

insert into result5 values(1,2,50,'Pass'),
(1,1,35,'Fail'),
(2,3,45,'Pass'),
(3,3,23,'Fail');


-- 1. List the distinct names of students who have either Electronics, or Statistics or both subjects.
select s.sname from student5 s 
join result5 r on s.rno = r.rno 
join subject5 su on su.subno = r.subno 
where su.subname = 'Electronics' or su.subname = 'Statistics';
-- we can solve in another way also
select s.sname from student5 s 
join result5 r on s.rno = r.rno 
join subject5 su on su.subno = r.subno 
where su.subname in ('Electronics','Statistics');
 
-- 2. List the names of students who are either passed or failed.
select s.sname from student5 s 
join result5 r on s.rno = r.rno 
where r.status5 = 'Pass' or r.status5 = 'Fail';
-- we can solve in another way also
select s.sname from student5 s 
join result5 r on s.rno = r.rno 
where r.status5 in ('Pass','Fail');

-- 3. List the students who have “Database” subject and they are not in “TY” class.
select s.sname from student5 s 
join result5 r on s.rno = r.rno 
join subject5 su on su.subno = r.subno 
where su.subname = 'Database' and s.class <> 'TY'; -- <> symbol is use for not equal to

-- 4. List the names of students who are not failed in any subject.
-- here we are using nested query because relationship is many to many and we have to find out those student who dont failed in any subject
-- may be there is possibility that one student is pass in either subject but fail in another subject
SELECT  s.sname
FROM Student5 S
WHERE s.rno NOT IN (
    SELECT r.rno
    FROM result5 r
    WHERE r.status5 = 'Fail'
);

-- 5. List the names of students not staying at “UruliKanchan”.
select sname from student5 where address <> 'UruliKanchan';