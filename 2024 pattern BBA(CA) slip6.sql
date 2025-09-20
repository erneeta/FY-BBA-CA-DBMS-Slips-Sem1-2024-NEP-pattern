-- slip 6
-- Consider the following entities and their relationships. Create a RDB in 3 NF for the following and answer the queries: [15 M ]
-- Emp(eno ,ename ,designation ,salary,DOJ)
-- Dept(dno,dname ,loc)
-- The relationship between Dept&Emp is one-to-many.

create table Dept(
dno int primary key,
dname varchar(15),
loc varchar(20));

create table emp(
eno int primary key,
ename varchar(15),
designation varchar(15),
salary float,
DOJ date,
dno int,
foreign key(dno) references Dept(dno));

-- 1. Insert at least five records into the tables.
insert into dept values(1,'Quality','Pune'),
(2,'Purchase','Pimpari'),
(3,'Sales','Baramati'),
(4,'Manufacturing','Pune'),
(5,'Marketing','Dhanori');

insert into emp values(1,'Ajay','Manager',60000,'2011-10-10',2),
(2,'Vijay','Manager',60000,'2010-10-10',1),
(3,'Mr.Pawar','Manager',60000,'2010-10-10',3),
(4,'Jay','Accountant',20000,'2010-10-10',3),
(5,'Sanjay','Designer',30000,'2010-10-10',1);

-- 2. Display the names of employees who are working in “Quality Department”.
select e.ename from emp e join dept d on e.dno = d.dno where d.dname = 'Quality';

-- 3. Display the name of employee who is ‘Manager’ of “Purchase Department”.
select e.ename from emp e join dept d on e.dno = d.dno where e.designation = 'Manager' and d.dname = 'Purchase';

-- 4. Display the name of department whose location is “Baramati” and “Mr.Pawar” is working in it.
select d.dname from dept d join emp e on e.dno = d.dno where e.ename ='Mr.Pawar' and d.loc = 'Baramati';

-- 5. Display the names of employees whose salary is greater than 50000 and department is “Quality”.
select e.ename from emp e join dept d on e.dno = d.dno where e.salary > 50000 and d.dname = 'Quality';