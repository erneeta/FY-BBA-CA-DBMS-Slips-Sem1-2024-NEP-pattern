use bca2024slip;
-- Q.2. Consider the following entities and their relationships. Create a RDB in 3 NF with appropriate data types and Constraints. [15 M]
-- Gym (Name, city, charges, scheme)
-- Member (ID, Name, phoneNo, address)
-- Relation between Gym and member is one to many.Constraint: Primary Key, charges must be greater than 0.
create table Gym(
Name varchar(10) primary key, 
city varchar(10), 
charges float check(charges > 0), 
scheme varchar(20));
create table member1(
ID int primary key, 
name varchar(10), 
phoneno int, 
address varchar(20), 
gname varchar(10),
foreign key(gname) references Gym(name));  

insert into Gym values
('Gold Gym','Pune',5000,'Yearly'),
('Fighter','Pimpari',12000,'yearly');
insert into Gym values
('Diamond','Pune',15000,'Yearly');
insert into member1 values
(1,'Mr.Kale',1234567890,'ravet','Fighter'),
(2,'Dole',1034567890,'wakad','Fighter'),
(3,'Patil',1222567890,'lohegaon','Gold Gym');
insert into member1 values
(4,'Kale',1234567890,'ravet','Diamond');
select * from Gym;
select * from member1;

-- 1. Display the scheme details of “Gold Gym”.
select scheme from Gym where Name = "Gold Gym";

-- 2. List out all the gym of “Pimpri” city.
select Name from Gym where city = "Pimpary";

-- 3. Give the details of scheme to which “Mr.Kale” is admitted.
select g.scheme from member1 m join gym g on g.name = m.gname where m.name = "Mr.Kale";

-- 4. Display all the members from pune city who have paid Gym charges more than 10000.
select m.name from member1 m join gym g on g.name = m.gname where g.city = 'pune' and g.charges >10000;

-- 5. Drop column address from Member table.
alter table member1 drop column address;
select * from member1;
