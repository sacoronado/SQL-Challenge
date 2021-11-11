--PROBLEM 1
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
    LEFT JOIN salaries
    ON employees.emp_no = salaries.emp_no
;

--PROBLEM 2
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986%'
;

--PROBLEM 3
SELECT departments.dept_no, dept_name, dept_manager.emp_no, last_name, first_name
FROM departments
    LEFT JOIN dept_manager
    ON departments.dept_no = dept_manager.dept_no
        LEFT JOIN employees 
        ON employees.emp_no = dept_manager.emp_no
;

--PROBLEM 4
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM departments
    LEFT JOIN dept_emp
    ON departments.dept_no = dept_emp.dept_no
        LEFT JOIN     employees
        ON employees.emp_no = dept_emp.emp_no;


--PROBLEM 5

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--PROBLEM 6
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM departments
    LEFT JOIN dept_emp 
    ON departments.dept_no = dept_emp.dept_no
        LEFT JOIN employees
        ON employees.emp_no = dept_emp.emp_no
        WHERE departments.dept_name = 'Sales'
;


--PROBLEM 7
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM departments
    LEFT JOIN dept_emp
    ON departments.dept_no = dept_emp.dept_no
        LEFT JOIN employees
        ON employees.emp_no = dept_emp.emp_no
        WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
;



--PROBLEM 8
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY count DESC;

