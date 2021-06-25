--그룹함수

--단일행 함수
SELECT first_name, round(salary, -4)
FROM employees;

--그룹함수 --> 오류발생(반드시 이유를 확인해 볼 것)
SELECT first_name, avg(salary)
FROM employees;

--그룹함수 count()
SELECT count(*), --null 포함한 count
       count(first_name), -- 컬럼명 사용시 null을 제왜한 count
       count(commission_pct) -- 컬럼명 사용시 null을 제왜한 count
FROM employees;

--조건절 추가
SELECT count(*)
FROM employees
WHERE salary > 16000;

--그룹함수 sum()
SELECT sum(salary), count(*) --그룹함수끼리는 표현 할 수 있따. 둘다 row 1개
from employees;

--그룹함수 avg() null 일때 0으로 변환해서 사용
SELECT count(*), --전체 107개
       count(commission_pct), --35명 commission_pct 값이 있는 직원
       sum(commission_pct), --전체 합계
       avg(commission_pct), --null 제외하고 평균을 구한다.
       sum(commission_pct)/count(*), --null 포함
       sum(commission_pct)/count(commission_pct) --null 제외
FROM employees;

SELECT count(*), --전체 107개
       count(commission_pct), --35명 commission_pct 값이 있는 직원
       sum(commission_pct), --전체 합계
       avg(nvl(commission_pct,0)), --null을 0으로 변환하여 평균을 구한다
       sum(commission_pct)/count(*), --null 포함
       sum(commission_pct)/count(commission_pct) --null 제외
       
FROM employees;

SELECT count(*),      
       sum(salary),
       avg(salary),
       sum(salary)/count(*)
FROM employees;

--그룹함수 max() min()
SELECT max(salary), min(commission_pct)
FROM employees;

SELECT first_name, min(commission_pct) --row 갯수 달라서 오류발생
FROM employees;

SELECT first_name, salary
FROM employees
ORDER BY salary desc;

--Group by 절
--전체 부서, 급여출력
SELECT department_id, 
       salary
FROM employees
ORDER BY department_id ASC;

SELECT avg(salary)
FROM employees
GROUP BY department_id;

--부서번호, 급여평균
SELECT department_id, avg(salary)
FROM employees
GROUP BY department_id;

--GROUP BY 주의사항
--SELECT 절에는 GROUP BY에 참여한 컬럼이나 그룹함수만 올 수 있다.
--되는 경우

SELECT department_id, count(*), sum(salary)
FROM employees
GROUP BY department_id

--안되는 경우
SELECT department_id, job_id, count(*), sum(salary) -- 그룹별 job_id가 여려개 있을 수 있음
FROM employees
GROUP BY department_id;

--그룹 세분화
SELECT avg(salary),
        department_id,
        job_id
FROM employees
GROUP BY department_id,job_id;

--예제
SELECT department_id, 
        count(*), 
        sum(salary)
FROM employees
GROUP BY department_id
WHERE sum(salary) > 20000; --WHERE절에는 그룹 함수를 쓸 수 없다!!

SELECT department_id, 
        count(*), 
        sum(salary)
FROM employees
GROUP BY department_id
HAVING sum(salary) >= 20000; -- 그룹 함수 전용 문법

SELECT department_id, 
        count(*), 
        sum(salary)
FROM employees
WHERE department_id = 100
GROUP BY department_id
HAVING sum(salary) >= 20000;

--위와 같은 예제
SELECT department_id, 
        count(*), 
        sum(salary)
FROM employees
GROUP BY department_id
HAVING sum(salary) >= 20000
AND department_id = 100;
    ------------
    --오라클 작동 포로토콜
    /*
SELECT 문
    SELECT 절
    FROM 절
    WHERE 절
    GROUP BY 절
    HAVING 절
    ORDER BY 절*/
    -------------
    
--case ~end 문

SELECT employee_id, 
       job_id
       salary,
       salary+salary*0.1 "10%보너스",
       salary+salary*0.2 "20%보너스",
       salary+salary*0.3 "30%보너스" 
FROM employees;

SELECT employee_id, 
       job_id,
       salary,
       CASE
            WHEN job_id='AC_ACCOUNT' THEN salary+salary*0.1
            WHEN job_id='SA_REP' THEN salary+salary*0.2
            WHEN job_id='ST_CLERK' THEN salary+salary*0.3
            ELSE salary
       END rSalary
FROM employees;

--DECODE() 문

SELECT employee_id, 
       job_id,
       salary,
       DECODE ( job_id, 'AC_ACCOUNT', salary+salary*0.1,
                        'SA_REP', salary+salary*0.2,
                        'ST_CLERK', salary+salary*0.3,
            salary ) as rSalary
FROM employees;


