-- lists employee number, last name, first name,
-- sex, and salary (ordered by increasing employee number)
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s ON
s.emp_no=e.emp_no
ORDER BY emp_no;


-- lists first name, last name, and hire date
-- for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';


-- lists manager of each department along with
-- department number, department name,
-- employee number, last name, and first name
SELECT dept_m.dept_no, depts.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
RIGHT JOIN dept_manager AS dept_m ON
dept_m.emp_no = e.emp_no
RIGHT JOIN departments AS depts ON
depts.dept_no = dept_m.dept_no;