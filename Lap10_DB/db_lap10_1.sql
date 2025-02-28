CREATE VIEW latest_jobs AS
SELECT
    e.emp_id,
    e.emp_fname,
    e.emp_lname,
    e.emp_gender,
    e.emp_birth_date,
    e.emp_hire_date,
    j.job_name,
    ej.emti_from_date,
    ej.emti_to_date
FROM employees e
JOIN employee_job ej ON e.emp_id = ej.emti_emp_id
JOIN jobs j ON ej.emti_job_id = j.job_id
WHERE ej.emti_to_date = '9999-01-01';

-- ดึงข้อมูลตำแหน่งปัจจุบันของพนักงาน
