-- Data Analysis

-- 1.) List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees 
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;


-- 2.) List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';


-- 3.) List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name   
FROM departments d
INNER JOIN dept_manager dm ON d.dept_no = dm.dept_no
INNER JOIN employees e ON e.emp_no = dm.emp_no;


-- 4.) List the department number for each employee along with that employee's employee number,
-- last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name, de.dept_no 
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no 
INNER JOIN departments d ON de.dept_no = d.dept_no;


-- 5.) List the first name, last name, and sex of each employee whose first name is Hercules
--  and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees e 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- 6.) List each employee in the Sales department, including their employee number,
-- last name, and first name.

SELECT e.emp_no, e.first_name, e.last_name 
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no 
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


-- 7.) List each employee in the Sales and Development departments, including their employee 
-- number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name  
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no 
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8.) List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).

SELECT e.last_name, COUNT(last_name) AS "Last Name Frequency"
FROM employees e
GROUP BY e.last_name
ORDER BY "Last Name Frequency" DESC;







