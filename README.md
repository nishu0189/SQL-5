# SQL-5

-----------------------------------------------------------TABLE EM -------------------------------------------------------------------------------------------

create  table em(emp_id int , ename varchar(30), dept_id int, manager_id int, salary int, age int);

INSERT INTO em (emp_id, ename , dept_id, manager_id, salary, age) VALUES
(1, 'Alice den', 101, 2, 50000, 39),  -- Alice's manager is Bob (emp_id 2)
(3, 'Charlie', 103, NULL, 80000, 45), -- Charlie has no manager (NULL)
(6, 'Frank', 102, 3, 55000, 25),  -- Frank's manager is Charlie (emp_id 3)
(2, 'Bob kumar', 102, 3, 60000, 34),    -- Bob's manager is Charlie (emp_id 3)
(4, 'David', 101, 2, 80000, 56),  -- David's manager is Bob (emp_id 2)  -- more SALARY than manager bob
(7, 'Grace', 104, 5, 65000,28),  -- Grace's manager is Eve (emp_id 5)
(5, 'Eve', 104, 1, 70000, 59);    -- Eve's manager is Alice (emp_id 1)  -- more SALARY than manager alice 


---------------------------------------------TABLE ORDERS ------------------------------------------------------------------------

create table orders(id int, name varchar(30),or_date date , sales int, region varchar(30) , category varchar(10), ship_date date, city varchar(10),ship_mode varchar(10));

-- drop table orders -- drop table returns select * from orders INSERT INTO orders (id, name, or_date, sales, region, category, ship_date, city ,ship_mode) VALUES (1, 'Laptop1', '2019-10-01', 1500, 'North', 'A', '2019-10-05', 'Delhi','upi'), (1, 'Laptop2', '2019-05-05', 8800, 'East', 'A', '2019-05-09', 'Mumbai','cash'), (3, 'Tablet', '2019-11-10', 600, 'South', 'B', '2019-11-15', 'Pune','upi'), (4, 'Headphones', '2024-03-12', 200, 'West', 'A', '2024-03-16', 'Mumbai','cash'), (5, 'Smartwatch', '2020-10-15', 300, 'North', 'B', '2020-10-19', 'Delhi','cash'), (6, 'Monitor', '2024-12-20', 1200, 'East', 'A', '2024-12-24', 'Mumbai','upi'), (7, 'Keyboard', '2019-07-25', 100, 'South', 'B', '2019-07-30', 'Pune','cash'), (8, 'Mouse', '2024-10-28', 50, 'West', 'C', '2024-11-02', 'Pune','card'), (9, 'Printer', '2024-11-01', 700, 'North', 'B', '2024-11-06', 'Delhi','upi'), (10, 'Router', '2024-02-05', 150, 'South', 'C', '2024-02-10', 'Pune','card'), (20, 'charger', '2024-11-05', 1300, 'west', 'C', '2024-11-10', 'Pune','card'), (25, 'cable', '2024-12-05', 100, 'South', 'B', '2024-12-10', 'Mumbai','upi'), (30, 'cover', '2024-10-05', 150, 'North', 'C', '2024-10-10', 'Delhi','cash');

---------------------------------------------TABLE RETURNS ------------------------------------------------------------------------ create table returns(id int, reason varchar(30), or_date date);

select * from returns INSERT INTO returns (id, reason, or_date) VALUES (1, 'Defective', '2019-10-10'), (2, 'Wrong Item', '2019-05-15'), (3, 'Damaged', '2019-11-20'),
(4, 'Customer Change', '2024-03-20'), (5, 'Defective', '2020-10-25'), (6, 'Wrong Item', '2024-12-30'), (7, 'Damaged', '2019-08-05'),
(10, 'Wrong Item', '2024-02-15'), (15, 'Customer Change', '2024-11-15'), (16, 'Defective', '2024-11-05');

