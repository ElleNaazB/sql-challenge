-- Creating Department table
CREATE TABLE Department (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL UNIQUE
);

-- Creating  Employee table
CREATE TABLE Employee (
    emp_no INT PRIMARY KEY,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- Creating the Dept_Emp table to link employees to departments
CREATE TABLE Dept_Emp (
    emp_no INT,
    dept_no VARCHAR(4),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no) ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES Department(dept_no) ON DELETE CASCADE
);

-- Creating the Dept_Manager table to identify department managers
CREATE TABLE Dept_Manager (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Department(dept_no) ON DELETE CASCADE,
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no) ON DELETE CASCADE
);

-- Creating Salary table
CREATE TABLE Salary (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no) ON DELETE CASCADE
);

-- Creating the Title table
CREATE TABLE Title (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE
);
