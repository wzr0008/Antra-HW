use Northwind
--Question 1
select distinct c.City
from dbo.Customers as c
inner join dbo.Employees as e
on c.City=e.City
--Question 2
-----(a)
select distinct c.city
from dbo.Customers as c
where c.city not in (
select e.city
from dbo.Employees as e)
------(b)
select  distinct c.city
from dbo.Customers as c
left join dbo.Employees as e
on c.city=e.city
group by c.city
having count(e.employeeId)=0
--Question 3
select p.ProductName,sum(od.quantity) as total
from dbo."Order Details" as od
left join dbo.products as p
on od.ProductId=p.ProductID
group by p.ProductName
--Question 4
select o.ShipCity as City,sum(od.quantity) as total
from dbo.Orders as o 
join dbo."Order Details" as od on
o.OrderId=od.OrderID
group by o.ShipCity
--Quesiton 5
------(a)

-----(b)
select city,count(1) as NumOfCustomer
from dbo.Customers
group by city
having count(1)>=2
---Question 6
select o.ShipCity as city,count(distinct p.ProductName)
from dbo.Orders as o
inner join dbo."Order Details" as od
on o.OrderID=od.orderID
inner join dbo.Products as p
on od.ProductID=p.ProductID
group by o.shipCity
having count(distinct p.productName)>1
---Question 7
select distinct c.contactName,c.city,o.ShipCity
from dbo.Customers as c 
join dbo.Orders as o
on c.CustomerID=O.CustomerID
where c.city!=o.ShipCity
----Question 8
 select top 5 p.ProductName,avg(od.UnitPrice) as AVGprice
 from dbo.Products as p
 join dbo."Order Details" as od
 on p.ProductID=od.ProductID
 group by p.ProductName
 order by sum(od.Quantity) desc
 -----Question 9
 -------(a)
 select e.City
 from dbo.Employees as e
 where e.City not in(select c.City from dbo.Customers as c)
 -------(b)
 select e.city,count(CustomerID)
 from dbo.Employees as e
 left join dbo.Customers as c
 on e.City=c.city
 group by e.city
 having count(CustomerID)=0
 ----Question 10
select dt1.city 
from (select top 1 o.shipcity as city
 from dbo.Orders as o
  group by o.shipcity
  order by count(1) desc) as dt1
inner join 
 (select top 1 o.shipcity as city
 from dbo.Orders as o
 join dbo."Order Details" as od
 on o.orderID=od.orderID
 group by o.shipcity
 order by sum(od.quantity) desc) as dt2
 on dt1.city=dt2.city
 ----Question 11
 delete t1.*
 from atable as t1,atable as t2
 where t1.info=t2.info and t1.id>t2.id
 ----Question 12
 with cte
 as(
  select empid,mgrid,deptid,1 as "level" from Employee where mgrid is null
  union all
  select empid,mgrid,deptid,cte.level+1 from Employee as e inner join cte as c on e.mgrid=c.empid
 )
 select empid from cte where level=max(level)
 ---Question 13
 with cte
 as(
 select departname,rank() over(order by countofemployees desc) as rank
 from table
 )
 select departname,countofemployees 
 from table join cte
 on table.departname=cte.departname
 where cte.rank=1
 ---Question 14
 with cte 
 as(
 select deptname,empid,dense_rank() over(partition by deptname order by salary desc) as "rank"
 from department
 )
 select empid,deptname 
 from cte
 where rank>=1 and rank<=3
 ---- extra Quetion(switch the gender)
 select name,(case when  gender='f' then 'm' else 'f' end) as sex
 from table
 ----- extra Question(Calculate the dis)
 select d1.city-d2.city as road, d1.distance-d2.distance as distance
 from Dist as d1
 cross join Dist as d2
 where distance>0