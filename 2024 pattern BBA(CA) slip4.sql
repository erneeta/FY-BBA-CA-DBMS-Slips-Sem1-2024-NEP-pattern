-- SLIP 4
-- Consider the following entities and their relationships. Create a RDB in 3 NF with appropriate data types and Constraints. [15 M]
-- Train (train_no, train_name, depart_time, arrival_time,source_stn, dest_stn)
-- Passenger (p_id,p_name,address,age, gender)
-- Relation between Train and Passenger is Many to Many with seat_no, amount and date as descriptive attribute.
-- Constraint: Primary key, seat_no should not be null.

use bca2024slip;
create table Train(
train_no int primary key,
train_name varchar(25),
depart_time time,
arrival_time time,
source_stn varchar(15),
dest_stn varchar(15));

create table Passenger(
p_id int primary key,
p_name varchar(20),
address varchar(50),
age int check(age>0),
gender char check(gender in ('M','F','O') ));

create table booking(
train_no int,
p_id int,
seat_no varchar(10),
amount float,
traveling_date date,
primary key(train_no,p_id,seat_no,amount,traveling_date),
foreign key(train_no) references Train(train_no),
foreign key(p_id) references Passenger(p_id));

insert into Train values(1,'sahyadri express','05:00:00','06:00:00','Pune','UruliKanchan'),
(2,'Shatabdi Express','05:00:00','06:00:00','Pune','Mumbai');

insert into passenger values(1,'Mr. Roy','pune',52,'M'),
(2,'Rani','pimpari',25,'F'),
(3,'Raja','pune',56,'M');

insert into booking values(1,1,'A01',1500,'2025-09-19'),
(1,2,'A02',1500,'2025-09-19'),
(1,3,'A03',1500,'2025-09-19'),
(2,1,'B01',2000,'2025-09-20'),
(2,2,'B02',2000,'2025-09-20'),
(2,3,'B03',2000,'2025-09-20');

select * from Train;
select * from passenger;
select * from booking;

-- 1. Display passenger names and their seat no’s of train “sahyadri express”.
select p.p_name, b.seat_no from 
passenger p join booking b on p.p_id = b.p_id 
join train t on t.train_no = b.train_no 
where t.train_name='sahyadri express';

-- 2. Display details of train in which “Mr. Roy” is travelling from “Pune” to “UruliKanchan”.
select t.train_no, t.train_name, t.depart_time, t.arrival_time, t.source_stn, t.dest_stn from 
train t join booking b on t.train_no = b.train_no 
join passenger p on b.p_id = p.p_id 
where p.p_name = 'Mr. Roy' and t.source_stn = 'Pune' and t.dest_stn = 'UruliKanchan';

-- 3. Display passenger details having age>50
select * from passenger where age >50;

-- 4. Find total number of passenger of “Pune to Mumbai” route.
select count(p.p_id) from 
passenger p join booking b on p.p_id = b.p_id 
join train t on t.train_no = b.train_no
where t.source_stn = 'Pune' and t.dest_stn = 'Mumbai';

-- 5. Calculate total number of male passenger in “Shatabdi Express”.
select count(p.p_id) from 
passenger p join booking b on p.p_id = b.p_id 
join train t on t.train_no = b.train_no
where t.train_name = 'Shatabdi Express' and gender = 'M';