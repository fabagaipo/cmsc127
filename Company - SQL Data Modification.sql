--Insert values in the Locations Relation by a single statement
INSERT INTO Locations VALUES(3300, '1057 Gorordo Avenue', 6000, 'Cebu City', 'Cebu', 'PH'),
(3400, '77 Salinas Drive', 6000, 'Cebu City', 'Cebu', 'PH');

--Find the Country ID in Locations Relation that is not yet recorded in the Countries Relation. Give that Country its proper name based on its ID and provide also its 
--Region ID (1-Europe, 2-America, 3-Asia/Australia, 4-Africa). Then insert that information in the Countries Relation
SELECT *
FROM Locations
WHERE Country_ID NOT IN(SELECT Country_ID FROM Countries);

INSERT INTO Countries VALUES('PH', 'Philippines', 3);

--Find the Department that is not recorded yet in the Employees Relation and is located in Germany. 
--Have its Department ID be added to this record below then insert the whole information in the Employees Relation.
SELECT *
FROM Departments
WHERE Department_ID NOT IN(SELECT Department_ID FROM Employees) AND Location_ID = 2700;

INSERT INTO Employees VALUES(150, 'John', 'Doe', 'johndoe@company.com', 'PR_REP', 0, 10500, 204, 70, '2021-01-01');

--Change the email with ‘not available' for those employees whose Department ID is 100 and gets a commission less than 20% (Commission_PCT).
UPDATE Employees 
SET Email = 'not available'
WHERE Department_ID = 100 and Commission_PCT < 0.20;

--Change the salary of an employee to 8,000 whose ID is 105 and if the existing salary is less than 5000.
UPDATE Employees
SET Salary = 8000 
WHERE Employee_ID = 105 AND Salary < 5000;

--Change the Job ID of an employee which ID is 118, to SH_CLERK if the employee belongs to a Department, which ID is 30 and the existing Job ID does not start with SH.
UPDATE Employees 
SET Job_ID= 'SH_CLERK' 
WHERE Employee_ID = 118 AND Department_ID = 30 AND NOT Job_ID LIKE 'SH%';

--Increase the minimum and maximum salary of Purchasing Clerk by 2,000 as well as the salary for those employees by 20% and commission percent by 0.10 (Use 2 SQL statements).
UPDATE Jobs
SET Min_Salary = Min_Salary+2000, 
Max_Salary = Max_Salary+2000
WHERE Job_ID = 'PU_CLERK';

UPDATE Employees
SET Salary = Salary +(Salary*.20),
Commission_PCT = Commission_PCT+.10
WHERE Job_ID = 'PU_CLERK';

--Delete all employee records whose salary is greater than 15,000.
DELETE FROM Employees
WHERE Salary > 15000;

--Delete all jobs not found in the Employees Relation.
DELETE FROM Jobs
WHERE Job_ID NOT IN(SELECT Job_ID FROM Employees);

--Delete employees whose manager is not found in the Employees Relation.
DELETE FROM	Employees
WHERE Manager_ID NOT IN (SELECT Employee_ID FROM Employees);