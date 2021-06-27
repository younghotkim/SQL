--Q1
SELECT count(manager_id) "haveMngCnt"
FROM employees;

--Q2
SELECT max(salary) "최고임금",
       min(salary) "최저임금",
       max(salary)-min(salary) "최고임금-최저임금"
FROM employees;

--Q3
SELECT max(to_char(hire_date, 'YYYY"년"MM"월"DD"일'))
FROM employees;

--Q4
SELECT department_id,
       avg(salary),
       max(salary),
       min(salary)
FROM EMPLOYEES
GROUP BY department_id
ORDER BY department_id DESC;

--Q5
SELECT job_id,
       round(avg(salary),0),
       max(salary),
       min(salary)
FROM employees
GROUP BY job_id
ORDER BY min(salary) DESC, avg(salary) ASC;

--Q6
SELECT min(to_char(hire_date,'YYYY-MM-DD DAY'))
FROM employees;

--Q7
SELECT department_id,
       avg(salary),
       min(salary),
       avg(salary)-min(salary)
FROM employees
GROUP by department_id
having avg(salary)-min(salary) < 2000
ORDER BY avg(salary)-min(salary) DESC;

--Q8

SELECT     job_id,
           max(salary)-min(salary)
FROM employees
GROUP BY job_id
ORDER BY max(salary)-min(salary) DESC;

--Q9

SELECT 
       round(avg(salary),0),
       min(salary),
       max(salary)
FROM employees
WHERE to_char(hire_date,'yyyy') > 2005 --Where을 먼저 정의
GROUP BY manager_id -- 그 뒤에 그룹지정
HAVING avg(salary)>=5000
ORDER BY avg(salary) DESC;

--Q10
SELECT first_name,
       hire_date,
      CASE
            WHEN hire_date < to_date('20021231','YYYYMMDD') THEN '창설일'
            WHEN to_char(hire_date,'yyyy') in 2003 THEN '03년입사'
            WHEN to_char(hire_date,'yyyy') in 2004 THEN '04년입사'
            ELSE '상장이후입사'
        END optDate
FROM employees
ORDER BY hire_date ASC;

SELECT *
FROM employees;