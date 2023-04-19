

Create table salaries ( 
	emp_no Int not null,
	salary Int not null, 
	from_date Date not null, 
	to_date Date not null	
);

Create Table dept_manager(
	ept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);
Create Table dept_emp(
	emp_no INT NOT NULL,
   dept_no VARCHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

CREATE TABLE titles (
emp_no INT NOT NULL,
   title VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
	);
	
Select emp_no, first_name, last_name 
From employees
Select title,from_date, to_date
From titles

-- Check the table
Create table retirement_titles()

-- Create new table for retiring employees
SELECT employees.emp_no,
     employees.first_name,
     employees.last_name,
	 titles.title,
	 titles.from_date,
	 titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;

--Check the table
Select* from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO current_title
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, title DESC;

SELECT * FROM current_title;

--Create new table for unique titles
SELECT retirement_titles.emp_no, 
	retirement_titles.first_name, 
	retirement_titles.last_name,
	current_title.title
INTO unique_titles
FROM retirement_titles
INNER JOIN current_title
ON retirement_titles.emp_no = current_title.emp_no
WHERE to_date = ('9999-01-01')
ORDER BY retirement_titles.to_date DESC, retirement_titles.emp_no;

SELECT * FROM unique_titles;

--retrieve the number of titles from the Unique Titles table.
SELECT COUNT (title)
FROM unique_titles

--Create the retiring_titles table
	SELECT COUNT (unique_titles.title), title
	INTO retiring_titles
	FROM unique_titles
	GROUP BY unique_titles.title
	ORDER BY unique_titles.title DESC;
	
	SELECT * FROM retiring_titles
ORDER BY count DESC