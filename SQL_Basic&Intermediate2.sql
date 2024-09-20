SELECT * FROM demo1.esd;

-- group by : to grp same values in specified col. Allows to use aggregate fn
select Department,count(EEID) from demo1.esd group by Department;
select Department, count(*) from demo1.esd group by Department;
select gender, count(EEID) from demo1.esd group by Gender;

select * from classic.products;
select productLine,count(productCode) from classic.products group by productLine order by count(productCode) desc;

-- Having : to filter same as where clause but use after group by, also can use in aggregate fn
select Department, count(EEID) from demo1.esd group by Department having count(EEID) > 150;
select productLine,sum(quantityInStock) from classic.products group by productLine having sum(quantityInStock) > 50000;

-- Joins : combine 2 or more tables based on related columns 
-- here in below both tables have prd.code
select * from classic.products;
select * from classic.`order details`;

-- inner join : matching values in both tables
select products.productLine, sum(`order details`.quantityOrdered) from classic.products 
inner join classic.`order details` on products.productCode = `order details`.productCode
group by productLine;

-- left join : all values in left table and matched values in both tables, if no match null is returned on right side
select products.productLine, `order details`.quantityOrdered
from classic.products left join classic.`order details`
on products.productCode = `order details`.productCode;

-- right join : all values in right table and matched values in both tables, if no match null is returned on left side
select products.productLine, `order details`.quantityOrdered
from classic.products right join classic.`order details`
on products.productCode = `order details`.productCode;

-- cross join : all values in either right or left, if no match null is returned(joins 2 tables)
select * from classic.products cross join classic.`order details` 
on products.productCode = `order details`.productCode;

select products.productLine as p, `order details`.quantityOrdered as o, products.quantityInStock as q
from classic.products cross join classic.`order details` on products.productCode = `order details`.productCode;

-- Set Operators : allows to combine results from queries
-- Union : Combines results from queries but removes duplicates
select FirstName,Department from employee1 union select FirstName,Department from employees2;

-- Union all: Combines results from queries and keeps duplicates
select FirstName,Department from employee1 union all select FirstName,Department from employees2;

-- Intersect: Returns only same in both queries(can't use intersect directly in MySql)
select FirstName,Department from employee1 intersect select FirstName,Department from employees2; 
-- instead use as where in-- 
select FirstName,Department from employee1 where firstname in (select firstname from employees2);

-- Except(or Minus): returns rows in 1st table that are not present in 2nd table(same we can't use Except in MySql)
select FirstName,Department from employee1 except select FirstName,Department from employees2;

select firstname,department from employee1 where firstname not in (select firstname from employees2);


-- Subqueries: query inside another query. Asking for extra info from main query(inner query exceutes then outer)
select * from employee1





 