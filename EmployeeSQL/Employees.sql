DROP TABLE IF EXISTS departments, dept_emp, dept_manager, title, employees, salaries;

CREATE TABLE departments(
    dept_no VARCHAR(255) NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(dept_no)
);

CREATE TABLE title(
    title_id VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    PRIMARY KEY(title_id)
);

CREATE TABLE employees(
    emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR(255) NOT NULL,
    birth_date VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex VARCHAR(255) NOT NULL,
    hire_date VARCHAR(255) NOT NULL,
    PRIMARY KEY(emp_no),
    FOREIGN KEY(emp_title_id) REFERENCES title (title_id)
);

CREATE TABLE dept_emp(
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(255) NOT NULL,
    PRIMARY KEY(emp_no, dept_no),
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE salaries(
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    PRIMARY KEY(emp_no),
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager(
	emp_no INTEGER NOT NULL,
    dept_no VARCHAR(255) NOT NULL,
    PRIMARY KEY(emp_no, dept_no),
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no

SELECT * FROM employees
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name
FROM employees e
WHERE hire_date = 1986

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no, m.emp_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager m
INNER JOIN  departments d ON
d.dept_no = m.dept_no
INNER JOIN employees e ON
e.emp_no = m.emp_no

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN  dept_emp dp ON
e.emp_no = dp.emp_no
INNER JOIN departments d ON
d.dept_no = dp.dept_no



