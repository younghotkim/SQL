--Q1
SELECT first_name || last_name "이름",
       salary "월급",
       phone_number "전화번호",
       hire_date "입사일"
FROM employees
ORDER BY hire_date ASC;

--Q2
SELECT job_id,
       salary+salary*nvl(commission_pct,1) "MAX SALARY"
FROM employees
ORDER BY salary+salary*nvl(commission_pct,1) DESC;

SELECT job_id,
       salary
FROM employees
ORDER BY salary DESC;

--Q3
SELECT first_name,
       manager_id,
       commission_pct,
       salary
FROM EMPLOYEES
WHERE manager_id is not null
AND commission_pct is null
AND salary > 3000;

--Q4
SELECT job_id,
       salary+salary*nvl(commission_pct,1) "max_salary"
FROM EMPLOYEES
WHERE salary+salary*nvl(commission_pct,1) > 10000
ORDER BY salary+salary*nvl(commission_pct,1) DESC;

--Q5
SELECT first_name,
       salary,
       NVL(commission_pct, 0)
FROM employees
ORDER BY salary DESC;

--Q6
SELECT first_name||last_name,
        salary,
        to_char(hire_date, 'YYYY-MM'),
        department_id
FROM employees
WHERE department_id in (10,90,100);

--Q7
SELECT first_name,
       salary
FROM employees
WHERE first_name LIKE 'S%'
OR first_name LIKE 's%';

--Q8
SELECT department_name
FROM departments
ORDER BY LENGTH(department_name) DESC;

--Q9
SELECT Upper(country_id)
FROM locations
ORDER BY country_id ASC;

--Q10
SELECT first_name||last_name,
       salary,
       replace(phone_number,'.', '-'),
       to_char(hire_date, 'YY/MM/DD')
FROM employees;
WHERE hire_date < '03/12/31';
