CREATE TABLE Employee (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5),
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE Department (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL 
);

CREATE TABLE Title (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Dept_Emp (
    emp_no INT,
    dept_no VARCHAR(4),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
);

CREATE TABLE Dept_Manager (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);

CREATE TABLE Salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);


select * from Employee
select * from department
select * from dept_emp
select * from Dept_Manager
select * from salaries
select * from title

SELECT 
    Employee.emp_no,       -- This gets the employee number from the Employee table
    Employee.last_name,    -- This gets the last name from the Employee table
    Employee.first_name,   -- This gets the first name from the Employee table
    Employee.sex,          -- This gets the sex from the Employee table
    salaries.salary          -- This gets the salary from the Salary table
FROM 
    Employee               -- This tells the database you're working with the Employee table
INNER JOIN 
    salaries                 -- This tells the database to link the salaries table with the Employee table
    ON Employee.emp_no = salaries.emp_no;  -- This is the key: it links the two tables by the employee number


SELECT 
    first_name,      -- This selects the first name column from the Employee table
    last_name,       -- This selects the last name column from the Employee table
    hire_date        -- This selects the hire date column from the Employee table
FROM 
    Employee         -- This indicates that you're selecting from the Employee table
WHERE 
    EXTRACT(YEAR FROM hire_date) = 1986;  -- This filters the rows to only those where the hire date year is 1986


SELECT 
    Department.dept_no,         -- This gets the department number
    Department.dept_name,       -- This gets the department name
    Employee.emp_no,            -- This gets the employee number for the manager
    Employee.last_name,         -- This gets the manager's last name
    Employee.first_name         -- This gets the manager's first name
FROM 
    Department                  -- This tells the database you're using the Department table
JOIN 
    Dept_Manager                -- This tells the database to link the Dept_Manager table
    ON Department.dept_no = Dept_Manager.dept_no  -- This matches the department number in both tables
JOIN 
    Employee                    -- This tells the database to link the Employee table
    ON Dept_Manager.emp_no = Employee.emp_no;    -- This matches the employee number of the manager
	


SELECT 
    Dept_Emp.dept_no,           -- This gets the department number the employee is in
    Employee.emp_no,            -- This gets the employee's number
    Employee.last_name,         -- This gets the employee's last name
    Employee.first_name,        -- This gets the employee's first name
    Department.dept_name        -- This gets the name of the department
FROM 
    Employee                    -- This indicates you're selecting from the Employee table
JOIN 
    Dept_Emp                    -- This tells the database to link the Dept_Emp table with Employee
    ON Employee.emp_no = Dept_Emp.emp_no  -- This matches the employee number in both tables
JOIN 
    Department                  -- This tells the database to link the Department table with Dept_Emp
    ON Dept_Emp.dept_no = Department.dept_no;  -- This matches the department number in both tables


SELECT 
    first_name,       -- This selects the first name column from the Employee table
    last_name,        -- This selects the last name column from the Employee table
    sex               -- This selects the sex column from the Employee table
FROM 
    Employee          -- This tells the database you're selecting from the Employee table
WHERE 
    first_name = 'Hercules' AND  -- This filters the rows to only those with a first name of 'Hercules'
    last_name LIKE 'B%';         -- This filters those rows further to only those where the last name starts with 'B'



SELECT 
    Employee.emp_no,       -- This selects the employee's number from the Employee table
    Employee.last_name,    -- This selects the employee's last name from the Employee table
    Employee.first_name    -- This selects the employee's first name from the Employee table
FROM 
    Employee               -- This tells the database you're selecting from the Employee table
JOIN 
    Dept_Emp               -- This tells the database to link the Dept_Emp table with Employee
    ON Employee.emp_no = Dept_Emp.emp_no  -- This matches the employee number in both tables
JOIN 
    Department             -- This tells the database to link the Department table with Dept_Emp
    ON Dept_Emp.dept_no = Department.dept_no  -- This matches the department number in both tables
WHERE 
    Department.dept_name = 'Sales';  -- This filters the rows to only those in the Sales department


SELECT 
    Employee.emp_no,       -- This selects the employee's number from the Employee table
    Employee.last_name,    -- This selects the employee's last name from the Employee table
    Employee.first_name,   -- This selects the employee's first name from the Employee table
    Department.dept_name   -- This selects the department name from the Department table
FROM 
    Employee               -- This tells the database you're selecting from the Employee table
JOIN 
    Dept_Emp               -- This tells the database to link the Dept_Emp table with Employee
    ON Employee.emp_no = Dept_Emp.emp_no  -- This matches the employee number in both tables
JOIN 
    Department             -- This tells the database to link the Department table with Dept_Emp
    ON Dept_Emp.dept_no = Department.dept_no  -- This matches the department number in both tables
WHERE 
    Department.dept_name IN ('Sales', 'Development');  -- This filters rows to only those in Sales or Development


SELECT 
    last_name,                   -- This selects the last name column from the Employee table
    COUNT(last_name) AS count    -- This counts how many times each last name occurs
FROM 
    Employee                     -- This tells the database you're selecting from the Employee table
GROUP BY 
    last_name                    -- This groups the rows by last name, so each last name is counted
ORDER BY 
    count DESC;                  -- This orders the results by the count, from highest to lowest
