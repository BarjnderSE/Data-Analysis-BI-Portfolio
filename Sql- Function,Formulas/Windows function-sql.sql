select * from employee

select dept_name,max(salary) as maxsalary 
from employee
group by dept_name


select e.* ,
max(salary) over() as maxsalary
from employee as e

select e.* ,
max(salary) over(partition by dept_name) as maxsalary
from employee as e

select e.*,
row_number() over() as rn from employee e;

select e.*,
row_number() over(partition by dept_name) as rn from employee e;

select e.*,
row_number() over(partition by dept_name order by emp_id) as rn from employee e;

select * from(
select e.*,
row_number() over(partition by dept_name order by emp_id) as rn from employee e) as x
where x.rn =1;

-- rank
-- fetch top 3 emloyees who earn max salary

select e.*,
rank() over(partition by dept_name order by salary desc) as rnk from employee e;

select * from(
select e.*,
rank() over(partition by dept_name order by salary desc) as rnk from employee e) x
where x.rnk<4

-- denserank

select e.*,
rank() over(partition by dept_name order by salary desc) as rnk,
row_number() over(partition by dept_name order by salary desc) as rn,
dense_rank() over(partition by dept_name order by salary desc) as densernk
from employee e

-- lead and lg
-- display if salary of an employee is higher,lower or equal to previous employee
select e.*,
lag(salary) over(partition by dept_name order by emp_id) as prev_empl,
lead(salary) over(partition by dept_name order by emp_id) as next_empl
from employee e;

-- use case
select e.*,
lag(salary) over(partition by dept_name order by emp_id) as prev_empl,
case when e.salary>lag(salary) over(partition by dept_name order by emp_id) then 'Higher then previous employee'
     when e.salary<lag(salary) over(partition by dept_name order by emp_id) then 'Lower then previous employee'
	 when e.salary=lag(salary) over(partition by dept_name order by emp_id) then 'Same as previous employee'
	 end sal_range
	 from employee e;

