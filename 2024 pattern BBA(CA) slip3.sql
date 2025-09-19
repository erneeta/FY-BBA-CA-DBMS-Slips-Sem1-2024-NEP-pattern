-- Consider the following entities and their relationships. Create a RDB in 3 NF with appropriate data types and Constraints. [15 M]
-- College (code, college_name, address)
-- Teacher (teacher_id, teacher_name, Qualification, specialization, salary, Desg)
-- Relation between Teacher and College is Many to One.Constraint: Primary Key, qualification should not be null.

use bca2024slip;

create table college (
code int primary key, 
college_name varchar(15), 
address varchar(50));

create table teacher (
teacher_id int primary key, 
teacher_name varchar(20), 
Qualification varchar(15), 
specialization varchar(15), 
salary float, desg varchar(15), 
ccode int, 
foreign key(ccode) references college(code));

insert into college values
(1,'Waghire College','Lohegaon,pune'),
(2,'WCS College','Viman nagar,pune'),
(3,'Jaykranti','pune');

insert into teacher values(1, 'Mr Ajay','SET-NET','Computer',36000,'Asst.Prof',2),
(2, 'Mr Vijay','PHD','Comp n/w',46000,'Asso.Prof',2),
(3, 'Mr Sanjay','SET-NET','Computer',36000,'Asst.Prof',1);

-- 1. List the name of staff having qualification i s “SET-NET”.
select teacher_name from teacher where Qualification = 'SET-NET';

-- 2. Update the salary of teacher to 50000 whose qualification is “PhD”.
update teacher set salary = 50000 where Qualification ='PHD';
select * from teacher;

-- 3. Display the details of Teachers who are working in “Waghire College” and their specialization is “Computer”.
select * from teacher t join college c on t.ccode = c.code 
where c.college_name = 'Waghire College' and t.specialization = 'Computer';

-- 4. Display the designation of teacher whose name is “Mr Ajay” and he is working in WCS College.
select t.desg from teacher t join college c on c.code = t.ccode 
where t.teacher_name = 'Mr Ajay' and c.college_name = 'WCS College';

-- 5. Update an address of college to “Katraj” whose name is “Jaykranti College”.
update college set address = "Katraj" where college_name = 'Jaykranti';
select * from college;

