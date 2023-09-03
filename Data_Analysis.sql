-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no AS "Employee Number",
       e.last_name AS "Last Name",
       e.first_name AS "First Name",
       e.sex AS "Sex",
       s.salary AS "Salary"
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name AS "First Name",
       last_name AS "Last Name",
       hire_date AS "Hire Date"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.emp_no AS "Employee Number",
       d.dept_no AS "Department Number",
       d.dept_name AS "Department Name",
       e.last_name AS "Last Name",
       e.first_name AS "First Name"
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.emp_no AS "Employee Number",
       de.dept_no AS "Department Number",
       e.last_name AS "Last Name",
       e.first_name AS "First Name",
       d.dept_name AS "Department Name"
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name AS "First Name",
       last_name AS "Last Name",
       sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no AS "Employee Number",
       e.last_name AS "Last Name",
       e.first_name AS "First Name"
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number",
       e.last_name AS "Last Name",
       e.first_name AS "First Name",
       d.dept_name AS "Department Name"
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY d.dept_name ASC;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name AS "Last Name",
       COUNT(*) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Count" DESC;
