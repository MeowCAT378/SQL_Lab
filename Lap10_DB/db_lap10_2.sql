SELECT
    MAX(CASE WHEN e.emp_gender = 'F' THEN s.sal_salary END) AS gen_f_max_salary,
    MAX(CASE WHEN e.emp_gender = 'M' THEN s.sal_salary END) AS gen_m_max_salary,
    MIN(CASE WHEN e.emp_gender = 'F' THEN s.sal_salary END) AS gen_f_min_salary,
    MIN(CASE WHEN e.emp_gender = 'M' THEN s.sal_salary END) AS gen_m_min_salary,
    AVG(CASE WHEN e.emp_gender = 'F' THEN s.sal_salary END) AS gen_f_avg_salary,
    AVG(CASE WHEN e.emp_gender = 'M' THEN s.sal_salary END) AS gen_m_avg_salary
FROM employees e
JOIN salaries s ON e.emp_id = s.sal_emp_id;
