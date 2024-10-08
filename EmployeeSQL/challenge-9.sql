-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

-- List the manager of each department along with 
-- their department number, department name, employee number,last name, and first name

SELECT 
    dm.dept_no,
    d.dept_name,
    dm.emp_no,
    e.last_name,
    e.first_name
FROM 
    dept_manager dm
JOIN 
    department d ON dm.dept_no = d.dept_no
JOIN 
    employees e ON dm.emp_no = e.emp_no
ORDER BY 
    dm.dept_no ASC;

-- 4. List the department number for each employee along with 
--that employee’s employee number, last name, fi rst name,and department name.

SELECT 
    de.dept_no,
	e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
	employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    department d ON de.dept_no = d.dept_no;

-- 5.List first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name beginswith the letter B.

SELECT first_name, 
		last_name,
		sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6.List each employee in the Sales department, 
--including their employee number, last name, and fi rst name.

SELECT 
	e.emp_no, 
	e.first_name,
	e.last_name
FROM employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    department d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--7.List each employee in the Sales and Development departments, 
--including their employee number, last name, firstname, and department name.

SELECT 
	e.emp_no, 
	e.first_name,
	e.last_name,
	d.dept_name
FROM employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    department d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name ='Development';

--8.List the frequency counts, in descending order, 
--of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
