-- Question 1: Retrieve all employee records
SELECT * FROM employees;

-- Question 2: Retrieve first name, last name, and department ID of all employees
SELECT firstname, lastname, departmentid FROM employees;

-- Question 3: Retrieve all employees from department ID 2
SELECT * FROM employees WHERE departmentid = 2;

-- Question 4: Retrieve employees hired after January 1, 2020
SELECT * FROM employees WHERE hiredate > '2020-01-01';

-- Question 5: Retrieve first and last names of employees ordered by last name in descending order
SELECT firstname, lastname FROM employees ORDER BY lastname DESC;

-- Question 6: Retrieve top 5 employees by salary in descending order
SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

-- Question 7: Count total number of employees
SELECT COUNT(employeeid) AS totalemployees FROM employees;

-- Question 8: Calculate average salary (rounded up)
SELECT CEIL(AVG(Salary)) AS AverageSalary FROM Employees; -- ceil is used to round up the salary removing everything after decimals

-- Question 9: Calculate average salary with currency formatting
SELECT CONCAT('$', ' ', CEIL((AVG(Salary)))) AS AverageSalary FROM Employees; -- this adds currency in front and space in between

-- Question 10: Calculate total hours worked by each employee
SELECT e.firstname, e.lastname, e.employeeid, SUM(ep.hoursworked) AS totalhoursworked
FROM employees e
JOIN employeeprojects AS ep ON e.employeeid = ep.EmployeeID
GROUP BY e.firstname, e.lastname, e.employeeid;

-- Question 11: Count number of employees in each department
SELECT COUNT(employeeid) AS EmployeeCount, departmentid FROM employees GROUP BY departmentid;

-- Question 12: Calculate average salary by department
SELECT 
    CONCAT('$', CEIL(AVG(salary))) AS Avgsalary, 
    departmentid 
FROM 
    employees 
GROUP BY 
    departmentid;

-- Question 13: Retrieve employee names and their department names
SELECT e.firstname, e.lastname, e.departmentid, d.departmentname
FROM employees AS e
JOIN departments AS d ON e.departmentid = d.DepartmentID;

-- Question 14: CTE for project assignments
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
-- Question 15: Count number of projects per employee
SELECT 
    FirstName,
    LastName,
    COUNT(ProjectID) AS NumberOfProjects
FROM cte
GROUP BY FirstName, LastName
ORDER BY NumberOfProjects DESC;

-- Question 16: Retrieve project details for each employee
SELECT 
    FirstName,
    LastName,
    ProjectID,
    ProjectName
FROM cte
ORDER BY LastName, FirstName, ProjectName;

-- Question 17: Count total number of projects
SELECT COUNT(ProjectID) AS TotalProjects FROM cte;

-- Question 18: Retrieve total hours worked per project by each employee
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

-- Question 19: Calculate average salary
SELECT AVG(salary) FROM employees;

-- Question 20: Retrieve employees earning above $73,000
SELECT * FROM employees WHERE salary > 73000;

-- Question 21: Retrieve employees earning above the average salary
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

-- Question 22: Retrieve employees who are assigned to projects
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

-- Question 23: Retrieve employees assigned to any project
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

-- Question 24: CTE for employee hours
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
-- Question 25: Retrieve employee hours for projects (note: using NULL condition as per original query)
SELECT * FROM employeehours WHERE projectid IS NULL;

-- Question 26: Retrieve employees with total hours worked greater than 100
SELECT * FROM employeehours WHERE totalhoursworked > 100;

-- Question 27: CTE for employee project hours with running total
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
-- Question 28: Calculate running total of hours worked per employee
SELECT *, SUM(HoursWorked) OVER (PARTITION BY EmployeeID ORDER BY ProjectID) AS runningtotalhours 
FROM EPH
ORDER BY EmployeeID, ProjectID;
