-- DELIVERABLE 1
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date >= '1952-01-01' AND e.birth_date <= '1955-12-31')
ORDER BY e.emp_no;


-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

select * from unique_titles;

-- Number of unique titles
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;