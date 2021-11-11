CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	CONSTRAINT pk_departments PRIMARY KEY  (
	dept_no
	)
);

CREATE TABLE dept_emp (
	emp_no VARCHAR NOT NULL,
	dept_no VARCHAR NOT NULL
);


CREATE TABLE dept_manager (
	emp_no VARCHAR NOT NULL,
	dept_no VARCHAR NOT NULL
);


CREATE TABLE employees (
	emp_no VARCHAR NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR NOT NULL,	
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	CONSTRAINT pk_employees PRIMARY KEY (
	emp_no
	)
);


CREATE TABLE salaries (
	emp_no VARCHAR NOT NULL,
	salary INT NOT NULL,
	CONSTRAINT pk_salaries PRIMARY KEY (
	emp_no
	)
);


CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	CONSTRAINT pk_titles PRIMARY KEY (
	title_id
	)
);


ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no);


--THIS WAS NEEDED TO SWAP COLUMN NAMES AT dept-names:

--ALTER TABLE dept_manager
--RENAME COLUMN emp_no TO transit;

--ALTER TABLE dept_manager
--RENAME COLUMN dept_no TO emp_no;

--ALTER TABLE dept_manager
--RENAME COLUMN transit TO dept_no;

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);
ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT COMP_KEY PRIMARY KEY (emp_no, dept_no);
