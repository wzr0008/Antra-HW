Use AdventureWorks
--Question 1
Select ProductId,Name,Color,ListPrice
from Production.product
go
--Question 2
select ProductId,Name,Color,ListPrice
from Production.product
where ListPrice=0.0
go
--Question 3
select ProductId,Name,Color,ListPrice
from Production.product
where color is null
go
--Question 4
select ProductId,Name,Color,ListPrice
from Production.product
where color is not null
go
--Question 5
select ProductId,Name,Color,ListPrice
from Production.product
where color is not null and ListPrice>0
go
--Question 6
select Name,Color
from Production.product
where color is not null
go
--Question 7
select Name,Color
from Production.product
where color in ('Black','Silver')
go
--Question 8
select ProductID,Name
from Production.product
where ProductID between 400 and 500
go
--Question 9
select ProductID,Name,color
from Production.Product
where color in ('black','blue')
go
--Question 10
select *
from Production.Product
where name like 'S%'
go
--Question 11
select Name,ListPrice
from Production.Product
where name like 'S%'
order by name
go
--Question 12
select Name,ListPrice
from Production.product
where name like '[a,s]%'
order by name 
go
-- Question 13
select name
from Production.product
where name like 'SPO[^k]%'
order by name
go
--Question 14
select distinct color
from Production.product
order by color desc
go 
--Question 15
select distinct ProductSubcategoryID, Color 
from Production.product
where ProductSubcategoryID is not null and Color is not null
go
--Question 17
select ProductSubCategoryID, Name,Color,ListPrice
from Production.Product
where ProductSubcategoryID between 1 and 14 and ListPrice in (539.99,1431.5,1364.5,1700.99)
order by ProductSubcategoryID desc,ListPrice desc