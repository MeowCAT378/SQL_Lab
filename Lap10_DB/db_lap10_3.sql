WITH RankedEmployees AS (
    SELECT
        e.emp_fname,
        e.emp_lname,
        j.job_name,
        d.dept_name,
        ROW_NUMBER() OVER (PARTITION BY d.dept_id ORDER BY e.emp_id) AS emp_rank
    FROM employees e
    JOIN employee_job ej ON e.emp_id = ej.emti_emp_id
    JOIN jobs j ON ej.emti_job_id = j.job_id
    JOIN department_employee de ON e.emp_id = de.deem_emp_id
    JOIN departments d ON de.deem_dept_id = d.dept_id
    WHERE j.job_name = 'Technique Leader'
)
SELECT emp_fname, emp_lname, job_name, dept_name
FROM RankedEmployees
WHERE emp_rank <= 3;
