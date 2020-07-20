-- Creating tables for PH-EmployeeDB
CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
CREATE TABLE departments (
  dept_no Varchar(4) NOT NULL,
  dept_name VARCHAR NOT NULL,
  PRIMARY KEY (dept_no)
);
CREATE TABLE dept_emp (
	 emp_no INT NOT NULL,
     dept_no VARCHAR(4) NOT NULL,
	 from_date DATE NOT NULL,
  to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
          PRIMARY KEY (emp_no)
);

DROP TABLE dept_emp;

CREATE TABLE dept_emp (
	 emp_no INT NOT NULL,
     dept_no VARCHAR(4) NOT NULL,
	 from_date DATE NOT NULL,
  to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
          PRIMARY KEY (emp_no, dept_no)
	);
	
CREATE TABLE titles (
	 emp_no INT NOT NULL,
     title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

DROP TABLE titles;

CREATE TABLE titles (
	 emp_no INT NOT NULL,
     title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, title)
);

DROP TABLE titles;

CREATE TABLE titles (
	 emp_no INT NOT NULL,
     title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, title, from_date)
);

SELECT*FROM dept_manager;

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';


SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';


SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';


SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables

SELECT retirement_info.emp_no,
	retirement_info.first_name,
retirement_info.last_name,
	dept_emp.to_date
	FROM retirement_info
	LEFT JOIN dept_emp
	ON retirement_info.emp_no = dept_emp.emp_no;
	
	SELECT ri.emp_no,
	ri.first_name,
ri.last_name,
	de.to_date 
	
	FROM retirement_info as ri
LEFT JOIN dept_emp as de

ON ri.emp_no = de.emp_no;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
	 
	 FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
de.to_date

INTO current_emp

FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no

WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

CREATE TABLE skill_drill as (
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no
);

SELECT * FROM salaries;

SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT emp_no,
	first_name,
last_name,
	gender
	
	INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT e.emp_no,
	e.first_name,
e.last_name,
	e.gender,
	s.salary,
	de.to_date
	
	INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)

INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)

WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 
	      AND (de.to_date = '9999-01-01');
		  
		  -- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
		SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name	

-- INTO dept_info

FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

SELECT em.emp_no, em.first_name, em.last_name, d.dept_name
INTO sales_info
FROM employees AS em
    INNER JOIN dept_emp AS de
        ON (em.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no);

DROP TABLE sales_info;

SELECT em.emp_no, em.first_name, em.last_name, d.dept_name
INTO sales_info
FROM employees AS em
    INNER JOIN dept_emp AS de
        ON (em.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
		WHERE d.dept_name = ('Sales');
		
SELECT em.emp_no, em.first_name, em.last_name, d.dept_name
INTO sales_info2
FROM employees AS em
    INNER JOIN dept_emp AS de
        ON (em.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
		WHERE d.dept_name = ('Sales')
		OR d.dept_name = ('Development');

-- Creating tables for PH-EmployeeDB-Challenge

--Number of Retiring Employees by Title


SELECT em.emp_no, em.first_name, em.last_name, em.birth_date, t.title, t.from_date, s.salary
INTO retiring_employees_by_title
FROM employees AS em
    INNER JOIN titles AS t
        ON (em.emp_no = t.emp_no)
    INNER JOIN salaries AS s
        ON (em.emp_no = s.emp_no)

DROP TABLE retiring_employees_by_title

SELECT em.emp_no, em.first_name, em.last_name, t.title, t.from_date, s.salary
INTO retiring_employees_by_title
FROM employees AS em
    INNER JOIN titles AS t
        ON (em.emp_no = t.emp_no)
    INNER JOIN salaries AS s
        ON (em.emp_no = s.emp_no)
		WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
		GROUP BY t.title,  em.emp_no, t.from_date, s.salary
		

		
SELECT COUNT(em.emp_no), t.title
INTO number_retiring_by_title
FROM employees AS em
    INNER JOIN titles AS t
        ON (em.emp_no = t.emp_no)
    INNER JOIN salaries AS s
        ON (em.emp_no = s.emp_no)
		WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
		GROUP BY t.title  
		
SELECT COUNT(em.emp_no)
INTO number_retiring_total
FROM employees AS em
    INNER JOIN titles AS t
        ON (em.emp_no = t.emp_no)
    INNER JOIN salaries AS s
        ON (em.emp_no = s.emp_no)
		WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
		  
				
		
		
-- Partition the data to show only most recent title per employee


SELECT  emp_no, first_name, last_name, title, from_date, to_date, salary
INTO most_recent_title
FROM 
 (SELECT emp_no, first_name, last_name, title, from_date, to_date, salary,
  ROW_NUMBER() OVER
 (PARTITION BY (emp_no)
 ORDER BY to_date DESC) rn
 FROM retiring_employees_by_title
 ) tmp WHERE rn = 1
ORDER BY emp_no;

		
-- Partition the data to show only mentorship eligible employees

SELECT em.emp_no, em.first_name, em.last_name, t.title, t.from_date, t.to_date, em.birth_date, s.salary
INTO mentorship_eligibility
FROM employees AS em
    INNER JOIN titles AS t
        ON (em.emp_no = t.emp_no)
    INNER JOIN salaries AS s
        ON (em.emp_no = s.emp_no)
		WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
			 AND (t.to_date ='9999-01-01')
		GROUP BY t.title,  em.emp_no, t.from_date, t.to_date, s.salary
		

SELECT  emp_no, first_name, last_name, title, from_date, to_date
INTO mentorship_eligibility_final
FROM 
 (SELECT emp_no, first_name, last_name, title, from_date, to_date,
  ROW_NUMBER() OVER
 (PARTITION BY (emp_no)
 ORDER BY to_date DESC) rn
 FROM mentorship_eligibility
 ) tmp WHERE rn = 1
ORDER BY emp_no;		

-- Miscellaneous

SELECT em.emp_no, em.first_name, em.last_name, t.title, t.from_date, s.salary, em.gender
INTO retiring_employees_misc
FROM employees AS em
    INNER JOIN titles AS t
        ON (em.emp_no = t.emp_no)
    INNER JOIN salaries AS s
        ON (em.emp_no = s.emp_no)
		WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
		GROUP BY t.title,  em.emp_no, t.from_date, s.salary
		
SELECT em.emp_no, em.first_name, em.last_name, t.title, t.from_date, t.to_date, em.birth_date, em. gender, s.salary
INTO mentorship_eligibility_misc
FROM employees AS em
    INNER JOIN titles AS t
        ON (em.emp_no = t.emp_no)
    INNER JOIN salaries AS s
        ON (em.emp_no = s.emp_no)
		WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
			 AND (t.to_date ='9999-01-01')
		GROUP BY t.title,  em.emp_no, t.from_date, t.to_date, s.salary		
