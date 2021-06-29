--SubQuery: 하나의 질문 속 또다른 질문이 있는 형태

SELECT first_name, salary
FROM employees
WHERE salary >= 11000;
-->11000

SELECT first_name, salary
FROM employees
WHERE first_name = 'Den';
-->Den / 11000
SELECT salary, first_name
FROM employees
WHERE first_name = 'Den';
----------------------------

SELECT first_name, salary
FROM employees
WHERE salary >= (SELECT salary
                 FROM employees
                 WHERE first_name = 'Den');
                 
                 
SELECT first_name
FROM employees
WHERE salary >= (SELECT em.departmente_name
                 FROM employees em, departments de
                 WHERE em.department_id = de.department_id);
                 
-----------------------

--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
--1. 가장 적게 받는 사람의 급여 > 2100 /이름을 구할려면 SubQuery문을 써야한다

SELECT 
        min(salary)
FROM employees;

--2. 2100받는 사람의 이름 급여 사원번호
SELECT employee_id, first_name||last_name, salary
FROM employees
WHERE salary = (SELECT min(salary)
                FROM employees);

--평균 급여보다 적게 받는 사람의 이름, 급여

--1. 평균 급여 구하기

SELECT round(avg(salary),0)
FROM employees;
--6462

--2. 평균 급여보다 작은 사람 구하기 
SELECT first_name||last_name, salary
FROM employees
WHERE salary < (SELECT avg(salary)
                 FROM employees);

----------------------------

--다중행 IN SubQuery
--부서번호 110인 직원의 급여 리스트를 구한다. 12008

SELECT first_name, salary
FROM employees
WHERE department_id = 110;

-- 급여가 12008, 8300 인 직원 리스트를 구한다

SELECT first_name
FROM employees
WHERE salary = 12008
OR SALARY = 8300;


SELECT first_name,
        salary
FROM employees
WHERE salary in (12008, 8300);

SELECT first_name,
       salary
FROM employees
WHERE salary in(SELECT salary
                FROM employees
                WHERE salary in(12008, 8300));
                
SELECT first_name,
       salary
FROM employees
WHERE salary in(SELECT salary
                FROM employees
                WHERE department_id = 110);
                
--각 부서별로 최고급여를 받는 사원을 출력하세요
--마케팅 유재석 10000, 배송 정우성 20000, 관리 이효리 30000

SELECT max(salary)
FROM employees
GROUP by department_id;

SELECT first_name,
       salary,
       department_id
FROM employees;

SELECT department_id, max(salary)
                 FROM employees
                 GROUP BY department_id;

--2 사원테이블에서 그룹번호와 급여가 같은 직원의 정보를 구한다.
SELECT first_name, salary
FROM employees
WHERE (department_id, salary) in (SELECT department_id, max(salary)
                 FROM employees
                 GROUP BY department_id);
                 
SELECT first_name, salary
FROM employees
WHERE (department_id, salary) in ( 
                                    ('Nancy',12008),
                                    ('Den',11000) 
                                    );

--다중행 SubQuery ANY (or)

--예제) 부서번호가 110인 직원의 급여 보다 큰 모든 직원의
-- 사번, 이름, 급여를 출력하세요. (or연산 --> 8300보다 큰)

--1

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE department_id = 110;

--2. 부서번호가 110인 직원 리스트 12008, 8300 보다 급여가 큰 직원리스트 (사번, 이름, 급여) 를 구하시오

SELECT employee_id,
       first_name,
       salary
FROM employees emp
WHERE salary > 12008
OR salary > 8300;

SELECT employee_id,
       first_name,
       salary
FROM employees emp
WHERE salary > any (SELECT salary
                    FROM employees
                    WHERE department_id = 110);
                    
-- 다중행 SubQuery ALL (AND) <--> any 와 비교
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 사번, 이름, 급여

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE department_id = 110;

SELECT employee_id,
       first_name,
       salary
FROM employees emp
WHERE salary > 12008
AND salary > 8300;


SELECT employee_id,
       first_name,
       salary
FROM employees emp
WHERE salary > all (SELECT salary
                    FROM employees
                    WHERE department_id = 110);
                    
--------------
--그룹별 최고 샐러리

--각 부서별로 최고급여를 받는 사원을 출력하세요

--1. 각 부서별 최고 급여 리스트 구하기
SELECT department_id, max(salary)
FROM employees
GROUP BY department_id;

--2. 직원테이블 부서코드, 급여가 동시에 같은 직원 리스트 출력
SELECT first_name,
       department_id,
       salary
FROM employees
WHERE (department_id, salary) in (SELECT department_id,max(salary)
                                  FROM employees
                                  GROUP BY department_id);

                                  
SELECT first_name, salary
FROM employees
WHERE (nvl(department_id,0), salary) in (SELECT nvl(department_id,0), max(salary)
                                      FROM employees
                                      GROUP BY department_id);

                         
                         -------------------
--JOIN 예제
--각 부서별로 최고급여를 받는 사원을 출력하세요
--1. 각 부서별 최고 급여 테이블 sa
    SELECT department_id, MAX(salary)
    FROM employees
    GROUP BY department_id;

--2. 직원 테이블과 조인한다 em
     --em.부서번호 = sa.부서번호 / em.급여 = sa.급여(최고급여)
     SELECT  em.department_id,
             em.employee_id,
             em.first_name,
             sa.mSalary
     FROM employees em, (SELECT department_id, max(salary) mSalary
                        FROM employees
                        GROUP BY department_id) sa
     WHERE em.department_id = sa.department_id
     AND em.salary = sa.mSalary;
     
     ---------------------
        
SELECT em.department_id,
       em.employee_id,
       em.first_name,
       em.salary
FROM employees em, (SELECT department_id, max(salary) salary
                    FROM employees
                    GROUP BY department_id) sa
WHERE em.department_id = sa.department_id
AND em.salary = sa.salary;
                 
                 -------------------------
                 

