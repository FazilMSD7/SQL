-- Views : Virtual table similar as Tables(above any query we can create view)
create view count_of_country as
select country,count(customerNumber) from classicmodels.customers group by country;

create view customer_with_greaterCreditLimit_avg as
select customerName,creditLimit from classicmodels.customers where creditLimit > 
(select avg(creditLimit) from classicmodels.customers);



-- Stored Procedures : Save and reuse query as function(Delimiter &&- create procedure(name)- begin- query -end && Delimiter)
Delimiter &&
create procedure customers_name()
begin
	select customerName from classicmodels.customers;
end &&
Delimiter ;
call classicmodels.customers_name()

Delimiter && 
create procedure get_data()
begin
select * from  classicmodels.customers;
end &&
Delimiter ;
call classicmodels.get_data()

-- Stored procedures - has 3 types(in, out(@,into), inout(@,set))
 -- in : set (in name dtype) - accepts parameters
Delimiter && 
create procedure get_limit(in var int)
begin
select * from  classicmodels.customers limit var;
end &&
Delimiter ;
call classicmodels.get_limit(5)
 
 -- out : extract (out name dtype), into name, select @name
Delimiter &&
 create procedure get_max_creditLimit(out var int)
begin
select max(creditLimit) into var from  classicmodels.customers;
end &&
Delimiter ;
call classicmodels.get_max_creditLimit(@maxVal);
select @maxVal;

-- inout : set and get (into name dtype), set @name, select @name
Delimiter &&
 create procedure get_name(inout var int)
begin
select customerName from  classicmodels.customers where customerNumber = var;
end &&
Delimiter ;
set @nam = 100 ;
call classicmodels.get_name(@nam);
select @nam;


-- Window Functions : processes multiple row and returns individual result col(Row_Number,Rank,Dense_Rank,Ntile)
-- Aggregate fn's - return single col. processing every records

select * from classicmodels.fzemployees1;
select sum(Salary) from classicmodels.fzemployees1;
select *,sum(Salary) over() as Total_Salary from classicmodels.fzemployees1; -- gives total salary with each record
select *,sum(Salary) over(partition by department_id) as Total_Salary from classicmodels.fzemployees1;

select Department_ID,sum(Salary) from classicmodels.fzemployees1 group by Department_ID;
-- using group by we can't get every details

select *,sum(Salary) over(partition by Department_ID order by Employee_ID) as Total_Salary from classicmodels.fzemployees1;
-- running total is generated using inc. order by

select * from classicmodels.fzemployees1;
