-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM "Employees" AS e
JOIN "Salaries" AS s
ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM "Employees" 
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01'
ORDER BY hire_date DESC;

--3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no AS manager_emp_no, e.first_name AS manager_first_name, e.last_name AS manager_last_name
FROM "Departments" AS d
JOIN "Dept_Manager" AS dm
ON d.dept_no = dm.dept_no
JOIN "Employees" AS e
ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Dept_Emp" AS de
JOIN "Employees" AS e
ON de.emp_no = e.emp_no
JOIN "Departments" AS d
ON de.dept_no = d.dept_no
ORDER BY emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Dept_Emp" AS de
JOIN "Employees" AS e
ON de.emp_no = e.emp_no
JOIN "Departments" AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY emp_no;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Dept_Emp" AS de
JOIN "Employees" AS e
ON de.emp_no = e.emp_no
JOIN "Departments" AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM "Employees"
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;