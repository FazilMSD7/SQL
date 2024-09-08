SELECT * FROM demo1.esd;

-- where 
select Full_Name,Annual_Salary from demo1.esd where Department = "IT";

-- and or not
select Full_Name,Age from demo1.esd where age>=50 and Gender="Male";
select Full_Name,Gender,Country from demo1.esd where Gender = "Male" or country = "China";
select Full_Name,Department,Annual_Salary from demo1.esd where not Department = "IT";

-- like
select * from demo1.esd where Full_Name like "%mar%";
select * from demo1.esd where Full_Name like "mar%";
select * from demo1.esd where Full_Name like "%mar";

-- order by
select Full_Name,Age from demo1.esd order by age desc;
select Full_Name,Department,Age from demo1.esd order by Department desc, Age, Full_Name;

-- limit
select * from demo1.esd order by Full_Name,Age limit 3;
select * from demo1.esd order by Full_Name,Age limit 2,5;

-- between
select * from demo1.esd where Age between 30 and 40;

-- in, not in
select * from demo1.esd where Department in ("IT","Finance");
select * from demo1.esd where Job_Title not in ("Director","Vice President") and City in ("Seattle","Chicago");

-- String Fn
select concat(Job_Title," - ",Department) as Designation from demo1.esd;
select concat_ws(" - ",Job_Title,Department,Full_Name) as Designation from demo1.esd;
select length(Full_Name) as NameLength, Full_Name from demo1.esd;
select upper(Full_Name) as Name from demo1.esd;	select lower(Full_Name) as Name from demo1.esd;
select left(Full_Name,4) as Name from demo1.esd; select right(Full_Name,3) as Name from demo1.esd;
select mid(Full_Name,5) as Name from demo1.esd;

-- Data Aggregation and Numeric Fn
select * from sakila.payment;
select sum(amount) as Total_Payment from sakila.payment;
select avg(amount) as Avereage_Amount from sakila.payment;
select count(EEID) as Employees from demo1.esd where Department = "IT";
select max(Annual_Salary) from demo1.esd where Job_Title = "Analyst";
select min(Annual_Salary) from demo1.esd where Job_Title = "Analyst";
select truncate(amount,1) from sakila.payment;	-- after decimal how many values
select ceil(amount) as higher_value from sakila.payment;
select floor(amount) as lower_value from sakila.payment;

-- Date Fn
select * from sakila.rental;
select date(return_date) as Date from sakila.rental;
select time(return_date) as Time from sakila.rental;
select rental_date,return_date,datediff(return_date,rental_date) as DateDiff from sakila.rental;	--  date difference
select day(return_date) from sakila.rental;	select dayname(return_date) from sakila.rental;
select month(return_date) from sakila.rental; select monthname(return_date) from sakila.rental;
select year(return_date) from sakila.rental; select hour(return_date) from sakila.rental;

-- Case operator(case when then else end as)
select * from sakila.film;
select title,length,
case 
	when length < 90 then "short movie" 
    else "movie duration is good"
end as movie_duartion
from sakila.film;

select * from classic.`order details`;
select orderNumber,quantityOrdered,
case
	when quantityOrdered <= 30 then "min order"
    when quantityOrdered >= 40 then "max order"
    else "Avg Order"
end as Order_Type
from classic.`order details`;