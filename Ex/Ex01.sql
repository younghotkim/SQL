-------------FROM 절 SELECT 절------------

--원하는 컬럼들 조회하기
select * 
from employees;

SELECT * 
from departments;

--원하는 컬럼만 조회하기
select employee_id, first_name, last_name 
from employees;

--예제

SELECT first_name, 
       phone_number, 
       hire_date, 
       email
from employees;

--출력할 때 컬럼에 별명 사용하기

select employee_id as empNo,
       first_name as "f-name", --특수기호나 대소문자 구분
       salary "급 여" --as 생략가능
from employees;

select first_name "이름",
        phone_number "전화번호",
        hire_date "입사일",
        salary "급여"
from employees;

select last_name "성",
       salary "급여",
       phone_number "전화번호",
       email "이메일",
       hire_date "입사일"
from employees;

-- 연결 연산자(Concatenation)

SELECT first_name || last_name
FROM employees;

select first_name || ' ' || last_name
from employees;

select first_name || ' hire date is ' || hire_date as "입사일"
from employees;

--산술 연산자 사용하기

Select first_name,
       salary
from employees;

select first_name,
        salary "월급",
        salary*12 "연봉",
       (salary+300)*12 "보너스"
from employees;

select job_id*12
from employees;

SELECT first_name || '-' || last_name "성명",
       salary "급여",
       salary*12 "연봉",
       salary*12+5000 "연봉2",
       phone_number "전화번호"
FROM employees;

-------------WHERE 절------------

SELECT first_name "사원이름"
FROM employees
WHERE department_id = 10;

SELECT first_name "사원이름",
       salary "급여"
FROM employees
WHERE salary >= 15000;

SELECT first_name "사원이름",
       hire_date "입사일"
FROM employees
WHERE hire_date >= '07/01/01';

SELECT first_name "사원이름",
       salary "급여"
FROM employees
WHERE first_name = 'Lex';

SELECT first_name "사원 이름",
       salary "연봉"
FROM employees
WHERE salary >= 14000
and salary <= 17000;

SELECT first_name "사원 이름",
       hire_date "입사일"
FROM employees
WHERE hire_date >= '04/01/01'
and hire_date <= '05/12/31';

SELECT first_name "사원 이름",
       salary "연봉"
FROM employees
WHERE salary between 14000
and 17000;

SELECT first_name "사원 이름",
       hire_date "입사일"
FROM employees
WHERE hire_date between '04/01/01'
and '05/12/31';

SELECT first_name || '-' || last_name "이름"
FROM employees
WHERE first_name in ('Neena', 'Lex', 'John');

SELECT first_name || '-' || last_name "이름"
FROM employees
WHERE first_name = 'Neena'
OR first_name = 'Lex'
OR first_name = 'John';

SELECT first_name,
       salary
FROM employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

SELECT first_name "이름",
       salary "연봉"
FROM employees
where salary
in (2100, 3100, 4100, 5100);

SELECT first_name "이름",
        salary "급여"
FROM employees
WHERE first_name like 'L%';

SELECT first_name "이름",
        salary "급여"
FROM employees
WHERE first_name like '_____l';

SELECT first_name "이름",
        salary "급여"
FROM employees
WHERE first_name like '%am%';

SELECT first_name "이름",
        salary "급여"
FROM employees
WHERE first_name like '_a%';

SELECT first_name "이름",
        salary "급여"
FROM employees
WHERE first_name like '___a%';

SELECT first_name "이름",
        salary "급여"
FROM employees
WHERE first_name like '__a_';



