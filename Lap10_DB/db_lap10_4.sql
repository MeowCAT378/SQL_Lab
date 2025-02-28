SELECT e.emp_fname, e.emp_lname, r.ro_name, j.job_name
FROM employees e
JOIN department_employee de ON e.emp_id = de.deem_emp_id
JOIN roles r ON de.deem_role_id = r.ro_id  -- แก้ไขจาก deem_ro_id เป็น deem_role_id
JOIN employee_job ej ON e.emp_id = ej.emti_emp_id
JOIN jobs j ON ej.emti_job_id = j.job_id
WHERE r.ro_name = 'Employee'
AND j.job_name = 'Engineer';
