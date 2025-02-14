-- Schema for lab7
CREATE DATABASE IF NOT EXISTS Lap7;
USE lap7;

-- ปิด Safe Update Mode เพื่อให้สามารถลบข้อมูลได้
SET SQL_SAFE_UPDATES = 0;

-- ลบตารางที่มีอยู่แล้วก่อนสร้างใหม่
DROP TABLE IF EXISTS salaries, department_employee, employee_job, jobs, roles, departments, employees;

--  สร้างตาราง employees
CREATE TABLE employees (
    emp_id INT(11) PRIMARY KEY,
    emp_birth_date DATE,
    emp_fname VARCHAR(45),
    emp_lname VARCHAR(45),
    emp_gender ENUM('M', 'F'),
    emp_hire_date DATE
);

--  สร้างตาราง jobs
CREATE TABLE jobs (
    job_id INT(11) PRIMARY KEY,
    job_name VARCHAR(50),
    job_is_active TINYINT
);

--  สร้างตาราง roles
CREATE TABLE roles (
    ro_id INT PRIMARY KEY,
    ro_name VARCHAR(100)
);

-- สร้างตาราง departments
CREATE TABLE departments (
    dept_id INT(11) PRIMARY KEY,
    dept_name VARCHAR(250)
);

-- สร้างตาราง salaries
CREATE TABLE salaries (
    sal_emp_id INT(11),
    sal_salary DOUBLE(11,2),
    sal_from_date DATE,
    sal_to_date DATE,
    PRIMARY KEY (sal_emp_id, sal_from_date),
    FOREIGN KEY (sal_emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE
);

--  สร้างตาราง department_employee
CREATE TABLE department_employee (
    deem_emp_id INT(11),
    deem_dept_id INT(11),
    deem_from_date DATE,
    deem_to_date DATE,
    deem_ro_id INT(11),
    PRIMARY KEY (deem_emp_id, deem_dept_id, deem_from_date),
    FOREIGN KEY (deem_emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (deem_dept_id) REFERENCES departments(dept_id) ON DELETE CASCADE,
    FOREIGN KEY (deem_ro_id) REFERENCES roles(ro_id) ON DELETE CASCADE
);

--  สร้างตาราง employee_job
CREATE TABLE employee_job (
    emti_emp_id INT(11),
    emti_from_date DATE,
    emti_to_date DATE,
    emti_job_id INT(11),
    PRIMARY KEY (emti_emp_id, emti_from_date),
    FOREIGN KEY (emti_emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (emti_job_id) REFERENCES jobs(job_id) ON DELETE CASCADE
);

-- INSERT ข้อมูลของตาราง employees
INSERT INTO employees (emp_id, emp_birth_date, emp_fname, emp_lname, emp_gender, emp_hire_date)
VALUES (1, '1990-01-01', 'John', 'Doe', 'M', '2020-01-01');

-- INSERT ข้อมูลของตาราง jobs
INSERT INTO jobs (job_id, job_name, job_is_active)
VALUES (1, 'Software Engineer', 1);

-- INSERT ข้อมูลของตาราง departments
INSERT INTO departments (dept_id, dept_name)
VALUES (1, 'Software Department');

-- INSERT ข้อมูลของตาราง roles
INSERT INTO roles (ro_id, ro_name)
VALUES (1, 'Manager');

-- UPDATE ข้อมูลของตาราง employees
UPDATE employees
SET emp_fname = 'Jane', emp_lname = 'Smith'
WHERE emp_id = 1;

-- UPDATE ข้อมูลของตาราง jobs
UPDATE jobs
SET job_name = 'Senior Software Engineer'
WHERE job_id = 1;

-- INSERT ของตาราง employee_job
INSERT INTO employee_job (emti_emp_id, emti_from_date, emti_to_date, emti_job_id)
VALUES (1, '2020-01-01', '2023-01-01', 1);

-- INSERT ของตาราง department_employee
INSERT INTO department_employee (deem_emp_id, deem_dept_id, deem_from_date, deem_to_date, deem_ro_id)
VALUES (1, 1, '2020-01-01', '2023-01-01', 1);

-- ลบข้อมูลทั้งหมดในตาราง employees
DELETE FROM employees;

-- ลบข้อมูลทั้งหมดในตาราง jobs
DELETE FROM jobs;

-- เพิ่มข้อมูลกลับเข้าไปใหม่ (ทดสอบว่าตารางยังใช้งานได้)
INSERT INTO employees (emp_id, emp_birth_date, emp_fname, emp_lname, emp_gender, emp_hire_date)
VALUES (2, '2005-02-01', 'Yothin', 'Sisaitham', 'M', '2021-06-15');

-- SELECT ของตาราง employees มีข้อมูล emp_fname, emp_lname, emp_gender, emp_birth_date
SELECT emp_fname, emp_lname, emp_gender, emp_birth_date
FROM employees;
