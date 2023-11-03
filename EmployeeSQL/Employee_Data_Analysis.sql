-- 1. lists employee number, last name, first name,
-- sex, and salary (ordered by increasing employee number)
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s ON
s.emp_no=e.emp_no
ORDER BY emp_no;


-- 2. lists first name, last name, and hire date
-- for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';


-- 3. lists manager of each department along with
-- department number, department name,
-- employee number, last name, and first name
SELECT dept_m.dept_no, depts.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
RIGHT JOIN dept_manager AS dept_m ON
dept_m.emp_no = e.emp_no
RIGHT JOIN departments AS depts ON
depts.dept_no = dept_m.dept_no;


-- 4. lists department number for each employee along
-- with employee's employee number, last name,
-- first name, and department name
SELECT depts.dept_no, e.emp_no, e.last_name, e.first_name, depts.dept_name
FROM employees AS e
JOIN dept_emp AS dept_e ON
dept_e.emp_no = e.emp_no
JOIN departments AS depts ON
depts.dept_no = dept_e.dept_no;


-- 5. lists first name, last name, and sex of each employee
-- whose first name is Hercules and last name begins
-- with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- 6. lists each employee from the sales department,
-- including their employee number, last name,
-- first name and department name
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);


-- 7. lists each employee in the Sales and
-- Development departments, including their employee number,
-- last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, depts.dept_name
FROM employees AS e
JOIN dept_emp AS dept_e ON
dept_e.emp_no = e.emp_no
JOIN departments AS depts ON
depts.dept_no = dept_e.dept_no
WHERE depts.dept_name = 'Sales'
OR depts.dept_name = 'Development';


-- 8. lists the frequency counts, in descending order
-- of all the employee last names
SELECT last_name, COUNT(last_name) AS "name_count"
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;