--Question 1
select * from dbo.Region
insert into dbo.Region values(5,'Middle Earth')
insert into dbo.Territories(TerritoryID,TerritoryDescription,RegionID) values(12345,'Gondor',5)
--Question 2
update dbo.Territories set TerritoryDescription='Arnor' where TerritoryDescription='Gondor'
--Question 3
delete from dbo.Region where RegionDescription='Middle Earth'
go
--Question 4
create view [view_product_order_WANG] as
select p.productName,od.Quantity
from dbo."Order Details" as od left join
dbo.Products as p
on od.ProductID=p.ProductID
go
select * from dbo.view_product_order_WANG

---Question 5
create procedure sp_product_order_quantity_WANG
@id int,
@summation int output
as
select @summation=sum(Quantity) from dbo."Order Details" where OrderID=@id
go
declare @total int
exec sp_product_order_quantity_WANG 12350,@total output
print @total
go
---Question 6
select * from dbo.Orders
create procedure sp_product_order_city_WANG
@input varchar(100)
as
select top 5 o.ShipCity
from Orders as o
left join "Order Details" as od
on o.OrderID=od.OrderId
left join dbo.Products as p
on od.productId=p.productId
where p.ProductName=@input
order by od.Quantity 
go
---Question 7
select * from dbo.Territories
create procedure sp_move_employees_WANG
@Territory varchar(100)='Tory'
as
select e.LastName,e.FirstName
from dbo.Employees as e
right join dbo.EmployeeTerritories as et
on e.EmployeeID=et.EmployeeID
right join dbo.Territories as t
on et.TerritoryID=t.TerritoryID
where t.TerritoryDescription=@Territory
go
exec sp_move_employees_WANG
exec sp_move_employees_WANG 'North'
exec sp_move_employees_WANG 'Stevens Point'
go
---Question 8

 ---Question 9
 create table people_your_last_name(id int not null,name varchar(100) not null,city int foreign key references city_your_last_name(id))
 go
 create table city_your_last_name(id int primary key not null,city varchar(100) not null)
 go
 insert city_your_last_name values(1,'Seattle')
 insert city_your_last_name values(2,'Green Bay')
 insert people_your_last_name values(1,'Aaron Rodgers',2)
 insert people_your_last_name values(2,'Russell Wilson',1)
 insert people_your_last_name values(3,'Jody Nelson',2)
insert city_your_last_name values(3,'Madison')
update people_your_last_name set city=3 where city=1;
delete from city_your_last_name where city='Seattle'
go
create view Packers_your_name
as
select p.name,c.city
from people_your_last_name as p
left join city_your_last_name as c
on p.city=c.id
where c.city='Green Bay'
go
select * from Packers_your_name
go
---Question 10
create procedure sp_birthday_employees_WANG
as
drop table birthday_employees_your_last_name
select * into birthday_employees_your_last_name
from dbo.Employees
where month(BirthDate)=2;
select * from birthday_employees_your_last_name
drop table birthday_employees_your_last_name
go
exec sp_birthday_employees_WANG

---Question 11
---Method 1
create procedure sp_your_last_name_1
as 
with cte as(
select c.CustomerID,c.city,sum(case when o.OrderID is null then 0 else 1 end) as total
from dbo.Customers as c
left join dbo.Orders as o 
on c.CustomerID=o.CustomerID
group by c.CustomerID,c.city
having sum(case when o.OrderID is null then 0 else 1 end)<=1
)
select city
from cte
group by city
having count(1)>=2
go
exec sp_your_last_name_1

---Question 12
---1.I will check the columns of two tables, if two tables have different columns name, then two tables are not the same. On the contrary, two tables have the same columns
---  and same rows, we go to the next steps
---2. I will check each element at the same position of two tables, if any element is different in two tables, then two tables are not the same.
---3. After the previous two steps, we can get the conclusion that two tables are the same.
---Question 14
select ([First Name]+' '+[LastName]+' '+(case when [Middle Name] is null then '' else [Middle Name]+'.' end]) as [Full Name]
from table
---Question 15
select top 1 student
from table
where sex='F' and Marks in(
select max(student)
from table
where sex='F')
---Question 16
select top 1 student
from table
where sex='F' and Marks in(
select max(student)
from table
where sex='F')