Use AdventureWorks
go
--Question 1
select count(*)
from Production.Product
go
--Question 2
select count(*)
from Production.product
where ProductSubcategoryID is not null
go 
--Question 3
select ProductSubcategoryID,count(1) as CountedProducts
from Production.product
group by ProductSubcategoryID
go
--Question 4
select ProductSubcategoryID,count(1) as CountedProducts
FROM Production.product
where productSubcategoryId is null
group by ProductSubcategoryID
go
--Question 5
select sum(Quantity) 
from Production.productInventory 
go
--Question 6
select ProductId,sum(Quantity) as [The Sum]
from Production.ProductInventory
where LocationID=40
group by ProductId
having sum(Quantity)<100
go
--Question 7
select Shelf,ProductId, sum(quantity) as TheSum
from Production.productInventory
where locationID=40
group by shelf,productId
having sum(quantity)<100
go
--Question 8
select ProductID,avg(quantity) as TheAvg
From Production.ProductInventory
where LocationId=10
group by ProductID
go
--Question 9
select ProductID,Shelf,avg(quantity) as TheAvg
from Production.productInventory
group by ProductID,Shelf
go
--Question 10
select ProductID,Shelf,avg(quantity) as TheAvg
from Production.productInventory
where Shelf !='N/A'
group by ProductID,Shelf
go
--Question 11
select color,class,count(1) as TheCount,avg(ListPrice) as AvgPrice
from Production.Product
where color is not null  and class is not null
group by color,class
go
--Question 12
select c.name as Country,s.name as Province
from Person.CountryRegion as c join Person.StateProvince as s
on c.CountryRegionCode=s.CountryRegionCode
go
--Question 13
select c.name as Country,s.name as Province
from Person.CountryRegion as c join Person.StateProvince as s
on c.CountryRegionCode=s.CountryRegionCode
where c.name='Germany'  or c.name='Canada'
go
use Northwind
go
--Question 14
select distinct p.ProductName
from dbo.Products as p join dbo."Order Details" as od on p.ProductID=od.ProductID 
     join dbo.Orders as o on od.OrderID=o.OrderID
where o.ShippedDate is not null and 2021-year(shippedDate)<=25
--Question 15
select top 5 o.ShipPostalCode as ZipCode
from  dbo.Orders as o right join dbo."Order Details" as od 
on o.OrderID=od.OrderId
order by od.Quantity desc
--Question 16
select o.ShipPostalCode as ZipCode,o.ShippedDate
from  dbo.Orders as o right join dbo."Order Details" as od 
on o.OrderID=od.OrderId
where 2021-year(o.ShippedDate)<=20
order by od.Quantity desc
--Question 17
select City,count(ContactName) AS NumOfCustomer
from dbo.Customers
group by City
--Question 18
select City,count(1) as NumOfCumstomer
from dbo.Customers
group by City
having count(1)>=10
--Question 19
select c.ContactName,o.OrderDate
from dbo.Customers as c 
right join dbo.Orders as o 
on c.CustomerID=o.CustomerID
where o.OrderDate> '1/1/98'
go
--Question 20
select c.ContactName,max(o.OrderDate) as recentOrder
from dbo.Customers as c 
right join dbo.Orders as o
on c.CustomerID=o.CustomerID
group by c.ContactName
go
--Question 21
select c.ContactName,sum(Freight) as SumFreight
from dbo.Customers as c
right join dbo.Orders as o
on c.CustomerID=o.CustomerID
group by c.ContactName
go 
--Question 22
select c.ContactName,sum(Freight) as SumFreight
from dbo.Customers as c
right join dbo.Orders as o
on c.CustomerID=o.CustomerID
group by c.ContactName
having sum(Freight)>100
go 
--Question 23
select s.CompanyName as "Supplier Company Name",ss.CompanyName as "Shipping Company Name"
from dbo.Suppliers as s cross join dbo.Shippers as ss
go
--Question 24
select p.ProductName,o.OrderDate
from dbo.Orders as o 
left join dbo."Order Details" as od on o.OrderId=od.OrderID
left join dbo.Products as p on od.ProductId=p.ProductID
go
--Question 25
select e1.LastName,e1.FirstName,e2.LastName,e2.FirstName
from dbo.employees as e1 
cross join dbo.employees as e2
where (e1.LastName!=e2.LastName or e1.FirstName !=e2.FirstName) AND (e1.title=e2.title)
--Question 26
select e2.LastName,e2.FirstName,e2.EmployeeID
from dbo.Employees as e2
where e2.EmployeeId in(
select e2.EmployeeId
from dbo.Employees as e1 
right join dbo.Employees as e2
on e1.ReportsTo=e2.EmployeeID
group by e2.EmployeeID
having count(e2.EmployeeId)>=2
)
--Question 27
select c.city,c.ContactName as Name,'Customer' as Type
from dbo.Customers as c
union all
select s.city,s.ContactName as Name,'Supplier' 
from dbo.Suppliers as s
--Question 28
