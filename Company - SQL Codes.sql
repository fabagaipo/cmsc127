--Name (first and last) and salary of employees who have a higher salary than the employee whose last name is ’Weiss’.
SELECT First_Name, Last_Name, Salary 
FROM Employees 
WHERE Salary > 
(SELECT Salary FROM Employees WHERE Last_Name = 'Weiss');

--Name (first and last) of all employees who works in the IT department.
SELECT First_Name, Last_Name 
FROM Employees 
WHERE Department_ID 
IN (SELECT Department_ID FROM Departments WHERE Department_Name='IT');

--Name (first and last) of employees who have a manager and worked in California.
SELECT First_Name, Last_Name FROM Employees 
WHERE Manager_ID 
IN (SELECT Employee_ID 
FROM Employees WHERE Department_ID 
IN (SELECT Department_ID FROM Departments WHERE Location_ID 
IN (SELECT Location_ID from Locations where State_Province = 'California')));

--Name (first and last) of employees who are managers.
SELECT First_Name, Last_Name 
FROM Employees 
WHERE (Employee_ID IN (SELECT Manager_ID FROM Employees));

--ID and name of all departments where no employee is working
SELECT Department_ID, Department_Name FROM Departments 
WHERE Department_ID 
NOT IN (select Department_ID FROM Employees);

--Name (first and last) and salary of employees whose salary is greater than the average salary.
SELECT First_Name, Last_Name, Salary FROM Employees
WHERE Salary > 
(SELECT AVG(Salary)FROM Employees);

--Name (first and last) and salary of employees who earns more than the average salary and works in the IT department.
SELECT First_Name, Last_Name, Salary 
FROM Employees 
WHERE Department_ID IN 
(SELECT Department_ID FROM Departments WHERE Department_Name = 'IT') 
AND Salary > (SELECT AVG(Salary) FROM Employees);

--Employee ID, first name, last name, and department names of all employees. (NOTE: Use subquery in SELECT clause)
SELECT Employee_ID, First_Name, Last_Name, 
(SELECT Department_Name FROM Departments D
WHERE E.Department_ID = D.Department_ID) Department 
FROM Employees E;

--Employee ID, first name, last name, salary of all employees whose salary is above average for their departments.
SELECT Employee_ID, First_Name, Last_Name, Salary
FROM Employees E
WHERE Salary > 
(SELECT AVG(Salary) FROM Employees WHERE Department_ID = E.Department_ID);

--Write a query to select last 10 records from a table.
SELECT * FROM
(SELECT * FROM Employees ORDER BY Employee_ID DESC LIMIT 10)
ORDER BY Employee_ID ASC;
