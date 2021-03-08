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

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary. DONE!!!
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986. DONE!!!
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name. DONE!!!

SELECT m.dept_no, m.emp_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager m
INNER JOIN  departments d 
ON d.dept_no = m.dept_no
INNER JOIN employees e 
ON e.emp_no = m.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name. DONE!!!
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN  dept_emp dp 
ON e.emp_no = dp.emp_no
INNER JOIN departments d 
ON d.dept_no = dp.dept_no;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." DONE!!!
SELECT last_name, first_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name. DONE!!!
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN  dept_emp dp 
ON e.emp_no = dp.emp_no
LEFT JOIN departments d 
ON d.dept_no = dp.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN  dept_emp dp 
ON e.emp_no = dp.emp_no
LEFT JOIN departments d 
ON d.dept_no = dp.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT first_name, COUNT(first_name) AS "times counted"
FROM employees
GROUP BY first_name
ORDER BY "times counted" DESC;



