-- Dropping tables if they exist within the database

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Creating the departments table
CREATE TABLE departments (
dept_no VARCHAR(10) PRIMARY KEY,
dept_name VARCHAR(20) NOT NULL
);

-- Creating the titles table
CREATE TABLE titles (
title_id VARCHAR(10) PRIMARY KEY,
title VARCHAR(20) NOT NULL
);

-- Creating the employees table
CREATE TABLE employees (
emp_no INT PRIMARY KEY,
emp_title_id VARCHAR(10) NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
sex VARCHAR(5) NOT NULL,
hire_date DATE NOT NULL,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Creating the dept_emp table
CREATE TABLE dept_emp (
emp_no INT,
dept_no VARCHAR(10) PRIMARY KEY,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Creating the dept_manager table
CREATE TABLE dept_manager (
dept_no VARCHAR(10) PRIMARY KEY,
emp_no INT,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Creating the salaries table
CREATE TABLE salaries (
emp_no INT PRIMARY KEY,
salary BIGINT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- Import the csv data into it's respective tables and query them to assess accuracy of the import

SELECT * FROM departments LIMIT 10;
SELECT * FROM dept_emp LIMIT 10;
SELECT * FROM dept_manager LIMIT 10;
SELECT * FROM employees LIMIT 10;
SELECT * FROM salaries LIMIT 10;
SELECT * FROM titles LIMIT 10;
