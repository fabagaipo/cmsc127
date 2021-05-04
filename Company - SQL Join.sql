--Address (location_id, street_address, city, state_province, country_name) of all locations.
--NOTE: Use Natural Join
SELECT Location_ID, Street_Address, City, State_Province, Country_Name
FROM Locations
NATURAL JOIN Countries;

--First and last name of all employees as well as the ID and name of their departments.
--NOTE: Use Inner Join Using(attribute/s)
SELECT Employee_ID, First_Name, Last_Name, Department_Name
FROM Employees
INNER JOIN Departments USING(Department_ID);

--First and last name of employees, as well as their job ID, department ID and name, who are working in Southlake City.
--NOTE: Use Inner Join On Condition
SELECT E.First_Name, E.Last_Name, E.Job_ID, D.Department_ID, D.Department_Name
FROM Employees E
INNER JOIN Departments D
ON E.Department_ID = D.Department_ID
INNER JOIN Locations L
ON D.Location_ID = L.Location_ID
WHERE L.City = 'Southlake';

--ID and last name of employees along with the ID and last name of their manager.
SELECT E.Employee_ID as Emp_Id, E.Last_Name as Employee, M.Employee_ID as Mgr_Id, M.Last_Name as Manager
FROM Employees E 
JOIN Employees M 
ON (E.Manager_ID = M.Employee_ID);

--Name (first_name, last_name) and hire date of the employees who were hired after Stephen Stiles. 
--NOTE: Use Inner Join On Condition
SELECT E1.First_Name, E1.Last_Name, E1.Hire_Date 
FROM Employees E1
INNER JOIN Employees E2
ON (E2.Last_Name = 'Stiles' AND E2.First_Name = 'Stephen') 
WHERE E2.Hire_Date < E1.Hire_Date;

--ID and name of all departments and the ID and first name of the manager handling each department. Include the departments that doesn’t have a manager in the records yet.
SELECT D.Department_ID, D.Department_Name, D.Manager_ID, E.First_Name 
FROM Departments D 
LEFT JOIN Employees E
ON (D.Manager_ID = E.Employee_ID);

--Name of the department, first name of its manager, and the city where it’s located.
SELECT D.Department_Name, E.First_Name, L.City 
FROM Departments D
JOIN Employees E 
ON (D.Manager_ID = E.Employee_ID) 
JOIN Locations L USING (Location_ID);

--Same with number 7, but show all the departments and all cities even if they don’t have matching data for the department or manager yet.
SELECT D.Department_Name, E.First_Name, L.City 
FROM Locations L
LEFT OUTER JOIN Departments D USING(Location_ID)
LEFT JOIN Employees E
ON (D.Manager_ID = E.Employee_ID);
