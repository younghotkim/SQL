SELECT e.employee_id,
       e.first_name,
       e.department_id,
       d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

--EQUI JOIN / INNER JOIN null은 제외된다
SELECT em.first_name, dp.department_name, jb.job_title
FROM employees em, departments dp, jobs jb
WHERE em.department_id = dp.department_id
AND em.job_id = jb.job_id;

--LEFT OUTER JOIN null 표기 (왼쪽 절을 기준으로 조합을 한다)
SELECT em.first_name, de.department_name
FROM employees em LEFT OUTER JOIN departments de
   ON em.department_id = de.department_id;

SELECT em.first_name, de.department_name
FROM employees em, departments de
WHERE em.department_id = de.department_id(+);

--RIGHT OUTER JOIN (오른쪽 절을 기준으로 조합을 한다)

SELECT em.first_name, de.department_name
FROM employees em RIGHT OUTER JOIN departments de
   ON em.department_id = de.department_id;

SELECT em.first_name, de.department_name
FROM employees em, departments de
WHERE em.department_id(+) = de.department_id;

--FULL OUTER JOIN

SELECT em.first_name, de.department_name
FROM employees em FULL OUTER JOIN departments de
 ON em.department_id = de.department_id;
 
 /* FULL OUTER JOIN은 약식 표현이 불가능하다
 SELECT em.first_name, de.department_name
FROM employees em, departments de
WHERE em.department_id(+) = de.department_id(+);
*/

--SELF JOIN
SELECT em.employee_id,
       em.first_name,
       em.phone_number,
       em.manager_id,
       
       ma.employee_id,
       ma.first_name,
       ma.phone_number
FROM employees em, employees ma
WHERE em.manager_id = ma.employee_id;






