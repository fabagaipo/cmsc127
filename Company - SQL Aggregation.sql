--Get the total salaries payable to employees.
SELECT SUM(Salary) as TotalSalaryToPay
FROM Employees;

--Get the minimum salary from employees relation.
SELECT MIN(Salary) as minSalary
FROM Employees;

--Get the maximum salary of an employee working as a Programmer.
SELECT MAX(Salary) as maxSalary
FROM Employees E, Jobs J
WHERE E.Job_ID = J.Job_ID and Job_Title = 'Programmer';

--Get the average salary and number of employees working the department 100.
SELECT AVG(Salary) as avgSalary, count(*) as count
FROM Employees 
WHERE Department_ID = 100;

--Get the highest, lowest, sum, and average salary of all employees.
SELECT MAX(Salary) as Maximum, MIN(Salary) as Minimum, SUM(Salary) as Sum, AVG(Salary) as Average
FROM Employees;

--Get the number of employees with the same job.
SELECT Job_ID, count(*) as count
FROM Employees
GROUP BY Job_ID;

--Get the difference between the highest and lowest salaries of employees for each job.
SELECT E.Job_ID, J.Job_Title, max(salary) - min(salary) as DIFFERENCE
FROM Employees E, Jobs J
WHERE J.Job_ID = E.Job_ID
GROUP BY E.Job_ID;

--Find the manager ID of all managers and the salary of the lowest-paid employee for that manager. Display the list in descending order by salary.
SELECT Manager_ID, MIN(Salary)
FROM Employees
WHERE Manager_ID
GROUP BY Manager_ID
ORDER BY min(Salary) DESC;

--Get the department ID and the total salary payable in each department. Include in the display the name of the departments, the country name and street address where each department is located.
SELECT E.Department_ID, D.Department_Name, Country_Name, Street_Address, SUM(Salary) as Sum
FROM Employees E, Countries C, Locations L, Departments D
WHERE D.Location_ID = L.Location_ID and L.Country_ID = C.Country_ID and D.Department_ID = E.Department_ID
GROUP BY E.Department_ID;

--Get the average salary for each job excluding jobs from the Executive department.
SELECT Job_ID, AVG(salary) 
FROM Employees E, Departments D
WHERE E.Department_ID = D.Department_ID and D.Department_Name <> 'Executive' 
GROUP BY Job_ID;

--Get the average salary for the departments employing more than 4 employees. Display the ID and name of the departments and their state province where they’re located.
SELECT D.Department_ID, D.Department_Name, L.State_Province, AVG(salary)
FROM Employees E, Departments D, Locations L
WHERE E.Department_ID = D.Department_ID and D.Location_ID = L.Location_ID
GROUP BY D.Department_ID
HAVING count(*) > 4;

--Get the 5 minimum salaries from the Employees relation. Display the list in descending order.
SELECT DISTINCT Salary 
FROM Employees E
WHERE (SELECT count(DISTINCT Salary) FROM Employees 
WHERE Salary < E.Salary ) < 5
ORDER BY Salary DESC;

--Get the department name and number of employees in the department. Display in ascending order by department name.
SELECT Department_Name, count(*) as "No. of employees" 
FROM Employees 
INNER JOIN Departments USING(DEPARTMENT_ID) 
GROUP BY Department_Name;
