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