select * from employees;

-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, salaries.salary
FROM employees e
INNER JOIN salaries ON e.emp_no = salaries.emp_no
order by e.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

--select first_name, last_name,hire_date, date_part('year', hire_date) 
--from employees
--where date_part('year', hire_date) = 1986;

select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date;

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_manager dm ON e.emp_no = dm.emp_no
INNER JOIN departments d ON d.dept_no = dm.dept_no;

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no;

--List first name, last name, and sex of each employee whose first name 
--is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' and
		e.last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, 
--last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' or
		d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
CREATE VIEW Freq_dist_last_name AS
SELECT e.last_name, COUNT(e.last_name) as frequency_count
FROM employees e
GROUP BY e.last_name
ORDER BY frequency_count

select * from Freq_dist_last_name


