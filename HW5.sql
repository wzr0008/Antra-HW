---Question 1
create table customer(cust_id int,iname varchar(50))
create table order(order_id int,cust_id int,amount money,order_date smalldatetime)
go
select c.iname,sum(o.amount) as thetotal
from customer as c
right join order as o
on c.cust_id=o.cust_id
where year(o.order_date)=2002
group by o.cust_id
go
---Question 2
create table person(id int,firstname varchar(100),lastname varchar(100))
go
select firstname,lastname
from person
where lastname like 'A%'
---Question 3
create table person(person_id int primary key,manager_id int null,name varchar(100) not null)
go
select name
from person
where manager_id is null and person_id in (
select manager_id
from person)
---Question 4
 
---Question 5
create table Company(companyId INT primary key,name varchar(100))
create table Division(DivisonId INT Primary key,name varchar(100), companyName varchar(100),loca varchar(100),companyId INT FOREIGN KEY REFERENCES company(companyID))
create table Contacts(Id int primary key,DivisionId int foreign key references division(divisonId),MailDrop varchar(1000))

