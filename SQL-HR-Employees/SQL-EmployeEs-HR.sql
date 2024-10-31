select * from employees
select firstname,lastname,departmentid from employees
select * from employees where departmentid =2
select * from employees where hiredate> '2020-01-01'
select firstname,lastname from employees order by lastname desc
select * from employees order by salary desc limit 5
select count(employeeid) as totalemployees from employees
SELECT CEIL(AVG(Salary)) AS AverageSalary FROM Employees;-- ceil is used to round up the salary removing everthing after decimals
SELECT concat('$',' ',ceil((AVG(Salary)))) AS AverageSalary FROM Employees;  -- this is to addd currency in front and space in between
select e.firstname,e.lastname,e.employeeid,sum(ep.hoursworked) as totalhoursworked
from employees e
join employeeprojects as ep
on e.employeeid = ep.EmployeeID
group by e.firstname,e.lastname,e.employeeid
SELECT COUNT(employeeid) AS EmployeeCount, departmentid FROM employees GROUP BY departmentid;
SELECT 
   concat('$',ceil( AVG(salary))) AS Avgsalary, 
    departmentid 
FROM 
    employees 
GROUP BY 
    departmentid;
    
    select e.firstname,e.lastname,e.departmentid,d.departmentname
    from employees as e
    join departments as d
    on e.departmentid = d.DepartmentID;
    

WITH cte AS (
    SELECT 
        e.FirstName,
        e.LastName,
        p.ProjectName,
        p.ProjectID
    FROM 
        Employees e
    JOIN 
        EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
    JOIN 
        Projects p ON ep.ProjectID = p.ProjectID
)
SELECT 
    FirstName,
    LastName,
    COUNT(ProjectID) AS NumberOfProjects
FROM cte
GROUP BY FirstName, LastName
ORDER BY NumberOfProjects DESC;
SELECT 
    FirstName,
    LastName,
    ProjectID,
    ProjectName
FROM cte
ORDER BY LastName, FirstName, ProjectName;
SELECT COUNT(ProjectID) AS TotalProjects
FROM cte;

SELECT 
    e.FirstName,
    e.LastName,
    p.ProjectID,
    p.ProjectName,
    SUM(ep.HoursWorked) AS TotalHoursWorked
FROM 
    Employees e
JOIN 
    EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN 
    Projects p ON ep.ProjectID = p.ProjectID
GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName, p.ProjectID, p.ProjectName;

select avg(salary) from employees
select * from employees where salary >73000
select * from employees
    where salary > (select avg(salary) from employees)
    
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName
FROM 
    Employees e
WHERE 
    EXISTS (
        SELECT 1
        FROM EmployeeProjects ep
        WHERE e.EmployeeID = ep.EmployeeID
    )
ORDER BY 
    e.LastName, e.FirstName;

 SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName
FROM 
    Employees e
WHERE 
    e.EmployeeID IN (
        SELECT DISTINCT ep.EmployeeID
        FROM EmployeeProjects ep
    )
ORDER BY 
    e.LastName, e.FirstName;
    
    select e.firstname,e.lastname,

WITH EmployeeHours AS (
    SELECT 
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        ep.ProjectID,
        p.ProjectName,
        SUM(ep.HoursWorked) AS TotalHoursWorked
    FROM 
        Employees e
    JOIN 
        EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
    JOIN 
        Projects p ON ep.ProjectID = p.ProjectID
    GROUP BY 
        e.EmployeeID, e.FirstName, e.LastName, ep.ProjectID, p.ProjectName
)
select * from employeehours where projectid = null
select * from employeehours where totalhoursworked>100

WITH EPH AS (
    SELECT 
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        p.ProjectID,
        p.ProjectName,
        ep.HoursWorked
    FROM 
        Employees e
    JOIN 
        EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
    JOIN 
        Projects p ON ep.ProjectID = p.ProjectID
)

SELECT * ,sum(hoursworked) over (partition by employeeid order by projectid )  as runningtotalhours from EPH
order by employeeid,projectid