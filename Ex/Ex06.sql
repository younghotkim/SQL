--ROWNUM 질의의 결과에 가상으로 부여되는 Oracle의 가상(Pseudo)의 Column

--예제 급여를 가장 많이받는 5명의 직원의 이름을 출력하시오.

SELECT  ROWNUM,
        employee_id,
        first_name,
        salary  
FROM employees
ORDER BY salary DESC;

SELECT  ROWNUM,
        employee_id,
        first_name,
        salary  
FROM employees
WHERE ROWNUM >= 1
AND ROWNUM <= 5
ORDER BY salary DESC;

--정렬을 하면 ROWNUM이 섞인다. (X) --> 정렬을 하고 ROWNUM 한다.
----------------------------------------------

SELECT employee_id,
       first_name,
       salary
FROM employees --정렬되어 있는 테이블이면?
ORDER BY salary DESC;

--정렬을 하고 ROWNUM 한다.

SELECT employee_id,
       first_name,
       salary
FROM employees --정렬되어 있는 테이블이면?
ORDER BY salary DESC;

SELECT *
FROM employees
ORDER BY salary DESC;


SELECT ROWNUM,
       ot.employee_id,
       ot.fName,
       ot.salary,
       ot.hire_date
FROM (SELECT employee_id,
             first_name as fName,
             salary,
             hire_date
     FROM employees
     ORDER BY salary DESC) ot --정렬되어 있는 테이블이면?
WHERE ROWNUM >=1
AND ROWNUM <=5;
-------------------------위 방식은 1번부터 구해야 값이 나옴---------

--정렬이 돼있고 ROWNUM까지 배정된 테이블을 사용하기

--1. 정렬하기

(SELECT employee_id,
       first_name,
       salary
FROM employees
ORDER BY salary DESC)ot;

--2. ROWNUM 배정하기

(SELECT ROWNUM rn,
       ot.employee_id,
       ot.first_name,
       ot.salary
FROM (SELECT employee_id,
       first_name,
       salary
      FROM employees
      ORDER BY salary DESC)ot )rt;
      
--3. 테이블 사용해서 값 구하기

SELECT rn,
       rt.employee_id,
       rt.first_name,
       rt.salary
FROM (SELECT ROWNUM rn,
        ot.employee_id,
        ot.first_name,
        ot.salary
            FROM (SELECT employee_id,
                          first_name,
                           salary
                  FROM employees
                  ORDER BY salary DESC)ot 
        )rt
WHERE rn >= 2
AND rn <= 5;

---------------------------------------------
SELECT rn,
       rt.employee_id,
       rt.first_name,
       rt.salary,
       rt.hire_date
FROM (SELECT ROWNUM rn,
               ot.employee_id,
               ot.first_name,
               ot.salary,
               ot.hire_date
        FROM (SELECT employee_id,
                     first_name,
                     salary,
                     hire_date
                FROM employees
                ORDER BY salary DESC) ot
         )rt
WHERE rn<=5
AND rn>=1;

------------------------------------------------------

--예제 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?

SELECT rn,
       rt.first_name,
       rt.salary,
       rt.hire_date
FROM  (SELECT 
        ROWNUM rn,
        ot.first_name,
        ot.salary,
        ot.hire_date
            FROM    (SELECT first_name,
                            salary,
                            hire_date
                          
                      FROM employees
                       WHERE to_char(hire_date,'YYYY') = '2007' 
                     ORDER BY salary DESC)ot
         )rt
WHERE rn >= 3
AND rn <= 7;









(SELECT  ROWNUM rn
        ot.first_name,
        ot.salary,
        ot.hire_date
FROM    (SELECT first_name,
         salary,
         hire_date
        FROM employees
        ORDER BY salary DESC)ot
        )rt
