SELECT *
FROM employees;

SELECT first_name,
       commission_pct,
        salary*commission_pct
FROM employees
WHERE salary between  13000 and 15000;

SELECT first_name,
       commission_pct,
        salary*commission_pct
FROM employees
WHERE commission_pct is not null;

SELECT first_name,
       commission_pct,
        salary*commission_pct
FROM employees
WHERE commission_pct is not null;

SELECT first_name,
       commission_pct,
        salary*commission_pct
FROM employees
WHERE commission_pct is null
AND manager_id is null;

--order by--

SELECT first_name,
       salary
FROM employees
ORDER BY salary DESC; --내림차순

SELECT first_name,
       salary
FROM employees
ORDER BY salary ASC, first_name ASC; --오름차순

SELECT DEPARTMENT_id,
       salary,
       first_name || '-' || last_name
FROM employees
ORDER BY department_id asc;


SELECT DEPARTMENT_id,
       salary,
       first_name || '-' || last_name
FROM employees
WHERE salary >= 10000
order by salary desc;

SELECT DEPARTMENT_id,
       salary,
       first_name || '-' || last_name
FROM employees
WHERE salary >= 10000
order by department_id asc, salary desc;

----단일행 함수----
SELECT email, 
       initcap(email), 
       department_id
from employees
where department_id = 100;

-----TESTER-----
select INITCAP('the soap')
from dual;

--lower(), upper()
SELECT first_name,
       lower(first_name),
       upper(first_name)
FROM employees
where department_id = 100;

--substr()
SELECT SUBSTR('922222-122',8,1)
from dual;


SELECT first_name, 
       substr(first_name, 1, 3),
       substr(first_name, -3, 3)
FROM employees
WHERE department_id = 100;

--lpad() rpad()
SELECT first_name,
       lpad(first_name, 10, '*'),
       rpad(first_name, 10, '*')
from employees;
     
--replace()
SELECT first_name,
       replace(first_name, 'a', '*'),
       replace(first_name, substrc(first_name,2,3), '***')
from employees;

SELECT first_name,
       first_name, 
       substrc(first_name,2,3)
from employees;

----------숫자함수----------
--ROUND() 반올림
SELECT round(123.456, 2) "R2",
       round(123.456, 0) "R0",
       round(123.456, -1) "R-1"   
from dual;

--TRUNC() 버림
SELECT trunc(123.456, 2) "R2",
       trunc(123.456, 0) "R0",
       trunc(123.456, -1) "R-1"
FROM dual;

--날짜함수 SYSDATE()

SELECT sysdate
FROM dual;

-- 단일함수>날짜함수 MONTH _ BETWEEN(d1,d2)

SELECT first_name,
       trunc (months_between(sysdate, hire_date),0) "근무달"
       --현재에서 입사일을 뺀 것을 달로 계산
FROM   employees
ORDER BY months_between(sysdate, hire_date) desc;

--변환함수
--to_char()

SELECT first_name, 
       salary*12,
       to_char(salary*12, '$999,999,99')
FROM employees;

SELECT to_char(9876, '99999'),
       to_char(9876, '099999'),
       to_char(9876, '$9999'),
       to_char(9876, '9999.99'),
       to_char(987654321, '999,999,999')
FROM dual;

--to char() 날짜-->문자열

SELECT sysdate,
       to_char(sysdate, 'yyyy'),
       to_char(sysdate, 'yy'),
       to_char(sysdate, 'mm'),
       to_char(sysdate, 'MON'),
       to_char(sysdate, 'DD'),
       to_char(sysdate, 'MONTH'),
       to_char(sysdate, 'mmyy'),
       to_char(sysdate, 'ddmmyy'),
       to_char(sysdate, 'DAY'),
       to_char(sysdate, 'HH'),
       to_char(sysdate, 'HH24'),
       to_char(sysdate, 'MI'),
       to_char(sysdate, 'SS'),
       to_char(sysdate, 'YY/MM/DD')
FROM dual;

--일반함수 > nvl() nvl2()

SELECT first_name,
       commission_pct,
       nvl(commission_pct, 0) -- null을 0으로!
FROM employees;


SELECT first_name,
       commission_pct,
       nvl2(commission_pct, 100, 0) -- 0이 아닐때
FROM employees;



