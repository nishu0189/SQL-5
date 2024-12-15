
----------------------------------------  ****SELF JOIN****  --------------------------------------------------------------
--  drop  table em
create  table em(emp_id int , ename varchar(30), dept_id int, manager_id int, salary int, age int);

INSERT INTO em (emp_id, ename , dept_id, manager_id, salary, age) VALUES
(1, 'Alice den', 101, 2, 50000, 39),  -- Alice's manager is Bob (emp_id 2)
(3, 'Charlie', 103, NULL, 80000, 45), -- Charlie has no manager (NULL)
(6, 'Frank', 102, 3, 55000, 25),  -- Frank's manager is Charlie (emp_id 3)
(2, 'Bob kumar', 102, 3, 60000, 34),    -- Bob's manager is Charlie (emp_id 3)
(4, 'David', 101, 2, 80000, 56),  -- David's manager is Bob (emp_id 2)  -- more SALARY than manager bob
(7, 'Grace', 104, 5, 65000,28),  -- Grace's manager is Eve (emp_id 5)
(5, 'Eve', 104, 1, 70000, 59);    -- Eve's manager is Alice (emp_id 1)  -- more SALARY than manager alice 

select * from em

------ find emp name and their manager name 
select e1.emp_id , e1.ename , e2.ename as  managerName  --3
from em e1  --1
inner join em e2 on e1.manager_id = e2.emp_id  --2


-----------find the emp name whose salary is more than their manager
select e1.emp_id , e1.ename , e1.salary, e2.ename as  managerName , e2.salary --3
from em e1  --1
inner join em e2 on e1.manager_id = e2.emp_id  --2
where e1.salary > e2.salary


------------------------------------------------STRING MANIPULATION -----------------------------------------------------

 -- documentations:-   learn.microsoft.com/en-us/sql/t-sql/functions/translate-transact-sql?view=sql-server-ver16 
--min max -> work on string and date
-- min, max, count(), avg -> work on interger 

------------------------------------------------1. STRING_AGG(name, ',') ------------------------------------------------
----list of emp in each dept
select dept_id , STRING_AGG(ename,' , ')
from em 
group by dept_id

--- list of emp  in sorting Alphabetical names
select dept_id , STRING_AGG(ename, ' , ') within group (order by ename)
from em
group by dept_id;

------------------------------------------------2.Len(name)----------------------------------------------------------------------

select ename , len(ename) as length  --no. of letter in name
from em;

------------------------------------------------3.Left(name,3)  ----------------------------------------------------------------------

select ename, left(ename,3) -- first 3 letter from left
from em;

select ename, left(ename,0) , left(ename,1)
from em;

------------------------------------------------4.right(name,3) ----------------------------------------------------------------------

select ename , right(ename,3) --  first 3 letter from right
from em 

------------------------------------------------5.SUBSTRING(name,3,5) ----------------------------------------------------------------------

select 'nishu', SUBSTRING('nishu', 2, 4); --extract name from 2rd letter go to until the total 4 letters

select ename ,substring(ename, 2, 3)
from em

------------------------------------------------6.CharINDEX('a',name)----------------------------------------------------------------------

select ename , charindex('a',ename) --give the first occurence index of 'a' in a word 
from em 

select 'n234n6789n' ,
CHARINDEX('n','n234n6789n'), -- search from starting 
CHARINDEX('n','n234n6789n',2), -- search  2 idx from starting 
CHARINDEX('n','n234n6789n',7)  -- search  7 idx from starting 

------------------------------------------------7.CONCAT ----------------------------------------------------------------------

select ename, CONCAT(ename,age),  --joining without space  of 2 col 
concat(ename,'   ',age),  --joining of 2 col with space or any symbol
concat(ename,'-',age)     --joining of 2 col with hyphon 
from em

         --*************OOORRRR************* if same datatype only
	select	ename, ename +  'X' ,
	ename + ' '+ 'X'
	from em

------------------------------------------------8.REPLACE ----------------------------------------------------------------------

select ename, REPLACE(ename, 'a', 'X'), --replace a with x
 REPLACE(ename, 'ce', '123')
from em

------------------------------------------------9.TRANSLATE----------------------------------------------------------------------

select ename, TRANSLATE(ename, 'AE', 'XY') -- ONE TO ONE MAPPING...A REPLACE BY X AND E WITH Y
from em                                    -- 2nd argument should be eqaul to the 3rd argu

 
------------------------------------------------10.TRIM----------------------------------------------------------------------
SELECT '    bobb  ' , TRIM(' bob  ')  --it trim the leading and trailing spaces 

------------------------------------------------11.NULL HANDLING FUNCTION----------------------------------------------------------------------
create table demo(id int, city varchar(30),state varchar(30), country varchar(30),sales float)
-- drop  table demo
insert  into demo(id,city, state, country,sales)
 values(1, 'delhi',NULL , 'india',898.09),
       (2, NULL,NULL , NULL,77.89),
	   (3, 'delhi','BIHAR' , 'india',5600.12),
	   (4, NULL ,NULL , 'india',40.99),
	   (5, NULL ,'Pune' , 'india',699.900);
select * from demo

 select city, isnull(city,'unknow')  --if any city is null only then it give known 
 from demo;

 -----------------------------------------------12. COALESCE ----------------------------------------------------------------

 Select  * , coalesce(city,state,country,'ALL_NULL') --check all the argument if it null then go to next argu 
 from demo

------------------------------------------------13.CAST----------------------------------------------------------------

select sales, CAST(sales as int) as int_val
from demo

------------------------------------------------14. ROUND ---------------------------------------------------------------------
select sales, ROUND(sales,1)  --round number at 1 decimal places
from demo



-------------------------------------STRING QUESTIONS--------------------------------------------------------------------
	-- FIND the First name not surname 
	select ename, left(ename, charindex(' ',ename)) as first_name
	from em






----------------------------------------------DATE FUNCTIONS--------------------------------------------------
--find the year of each orders id
select name, DATEPART(year, or_date) as year_of_order_date
from orders 

-- using where 
select name , DATEPART(year, or_date) as year_of_order_date
from orders
where Datepart(year, or_date) < 2020;

-- YEAR, MONTH , WEEK , DAY 
select name, or_date,  Datepart(year, or_date) as or_year, datepart(month, or_date) as or_month ,
datepart(week,or_date) as or_week , datepart(day, or_date) as or_day
from orders;

---------------------------**1** DATEPART ON MY BIRTHDAY DATE -----------------------------------------

select datepart(YY,'2003-02-17') ; --1  year ,yyyy , yy
select datepart(q,'2003-02-17') ; --2  quarter, qq, q
select datepart(mm,'2003-02-17') ; --3  month, mm, m 
select datepart(dy,'2003-02-17') ; --4 dayofyear, dy, y = Day of the year
select datepart(ww,'2003-02-17') ; --5 week, ww, wk = Week

select datepart(dw,'2003-02-17') ; --6 weekday, dw, w = Weekday by default sunday is 1st day odf week
select datepart(hh,'2003-02-17 23:42:03') ; --7 hour, hh = hour
select datepart(mi,'2003-02-17 23:42:03') ; --8 minute, mi, n = Minute
select datepart(ss,'2003-02-17 23:42:03') ; --9 second, ss, s = Second

------------------**2** DATENAME Function on my birthday----------------------------------------

select datename(mm,'2003-02-17'); --1 month name
select datename(dw,'2003-02-17'); --2 weekday name

 ----------------------**3** GETDATE() (to find the current date)--------------------------------
  
  select datename(mm, getdate());  --current month
  select datepart(yy,getdate());   --curent year   

------------------**4**  DATEADD function (which add and substract no form the goven number) -----------

Select dateadd(day,10,'2003-02 -17');  --17 become 27
Select dateadd(day,-10,'2003-02-17');  --17 become 07
Select dateadd(month,2,'2003-02-17');  --2(feb) become 4(april)
Select or_date ,dateadd(yy,4,or_date)
from orders; 

------------------**5**  DATEDIff function  (difference between the two dates)-----------------------------

Select datediff(yy, '2003-02-17', '2006-11-14') ; --1 year diff
Select datediff(mm, '2003-02-17','2006-11-14' ) ; --2 month dif
Select datediff(week, '2003-02-17','2003-02-27' ) ; --3 week dif
Select datediff(day, '2003-02-17', '2003-02-27') ; --4 day diff





---------------------------------------if and else conditions (but in sql use case when end)----------------------------------------------------

select ename, salary,
case 
when salary > 70000 then 'high income'
when  salary >50000 and salary < 70000 then 'moderate income' -- between take the 50000 n 70000 as well  so query is < when salary between 50001 and 69999 then 'moderate income' >
else 'low income'
end as salary_level
from em

----------------2 condtions example---------------------

select ename, salary,
case   -- 1st condition 
when salary > 70000 then 'high income'
when  salary >50000 and salary < 70000 then 'moderate income' -- between take the 50000 n 70000 as well  so query is < when salary between 50001 and 69999 then 'moderate income' >
else 'low income'
end as salary_level
, case --2nd conditions
when emp_id > 4 then 'hii'
else 'bye'
end 
from em




-------------------------------------------QUESTIONS----------------------------------------------------------

/*Run the following command to add and update dob column in employee table
alter table employee add dob date;
update employee set dob = dateadd(year, -1*emp_age,getdate()) */

alter table em
add emp_dob date;

select * from em;

update  em
set emp_dob = dateadd(year, -1*age, getdate())

--Q1:- write a query to print emp name , their manager name and diffrence in their age (in days) 
--for employees whose year of birth is before their managers year of birth.

-- ***********    DO BY TAKING TWO DIFF APPROAD AND CONDITION **********************

-- 1.  find the DIFFERENCE in age by using DOB COL
select e1.ename as emp_name, e2.ename as mang_name,  datediff(day,e1.dob, e2.dob) as diff_in_age
from em e1
inner join em e2 on e1.manager_id = e2.emp_id
where year(e1.dob) < year(e2.dob);

--2.find the DIFFERENCE in age by using AGE COL --but this give appx days as we taking 365 only not considering the LEAP yrs
select e1.ename as emp_name, e2.ename as mang_name,  (e1.age - e2.age)*365 as diff_in_age
from em e1
inner join em e2 on e1.manager_id = e2.emp_id
where e1.age > e2.age; -- Employee born before their manager


--Q2- write a query to find subcategories who never had any return orders in the month of november (irrespective of years)

select * from  orders
select * from returns

SELECT  o.category
FROM orders o
LEFT JOIN returns r ON o.id = r.id AND MONTH(r.or_date) = 11
GROUP BY o.category
HAVING COUNT(r.id) = 0;

/*Q3- orders table can have multiple rows for a particular order_id when customers buys more than 1 product in an order.
write a query to find order ids where there is only 1 product bought by the customer  */

select id 
from orders
group by id
having  count(id) = 1;


/*Q4- write a query to print manager names along with the comma separated list(order by emp salary)
of all employees directly reporting to him.*/

 Select e2.ename as manager_name, 
 string_agg(e1.ename,' , ')  within  group (order by e1.salary) as list_of_emp
 from em e1
 inner join  em e2 on e1.manager_id = e2.emp_id
 group by e2.ename;

 /*Q5- write a query to get number of business days between order_date and ship_date (exclude weekends).
Assume that all order date and ship date are on weekdays only */

select * from orders 

select id, datediff(day,or_date, ship_date) - (datediff(week,or_date,ship_date)*2) AS business_days
from orders

--Q6- write a query to print 3 columns : category, total_sales and (total sales of returned orders)
 

select o.category ,  
sum(o.sales) as total_sales , 
sum( case when r.id is not Null then o.sales else 0 end ) as returned_sales 
from orders o
left join  returns r on o.id = r.id
group by o.category 


/* Q7- write a query to print below 3 columns
category, total_sales_2019(sales in year 2019), total_sales_2020(sales in year 2020) */4

Select  category,
sum(case when YEAR(or_date) = '2019' then sales else 0 end) as total_sales_2019,
sum(case when YEAR(or_date) = '2020' then sales else 0 end )as total_sales_2020
from orders
group by category;


--Q8- write a query print top 5 cities in west region by average no of days between order date and ship date.

select top 5 city , avg(datediff(day,or_date, ship_date)) as avg_day
from orders 
where region = 'West'
group by city
order by avg_day desc --which ensures that the top 5 cities are selected based on a specific criterion

--Q9- write a query to print emp name, manager name and senior manager name (senior manager is manager's manager)

select * from em

select e1.ename  as emp_name , e2.ename as mang_name, e3.ename as senior_name
from em e1
inner join em e2 on  e1.manager_id= e2.emp_id  -- Join to find the manager
inner join em e3 on  e2.manager_id= e3.emp_id  -- Join to find the senior manager

order by e1.ename  -- not required i just do for to see my output a to z order name 

--Q10 create the exams table with below script;
create table exams (student_id int, subject varchar(20), marks int);
 
insert into exams values (1, 'Chemistry',91), (1,'Physics', 91), (1,'Maths',92)
,(2,'Chemistry',80), (2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71), (4,'Physics',54)
,(5, 'Chemistry',79);
 
--Q10(i)-  write a query to find students who have got same marks in Physics and Chemistry.

select e1.student_id
from exams e1
inner join exams e2 on e1.student_id = e2.student_id and e1.subject = 'Chemistry' AND e2.subject = 'Physics'
AND e1.marks = e2.marks;


select student_id 
from exams 
where subject in('Chemistry','Physics')
group by student_id
having  count(distinct marks) = 1 and count(*)=2;



   