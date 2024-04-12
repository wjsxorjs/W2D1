SELECT *
FROM emp
;

-- emp테이블의 사번, 이름, 입사일, 급여순으로 자원들을 출력하는 SQL문
SELECT empno, ename, hiredate, sal
FROM emp
;

-- 문) emp테이블에서 사번, 이름, 직종(job), 부서코드(deptno) 순으로
--     출력하는 SQL문을 완성하시오.

SELECT empno, ename, job, deptno
FROM emp
;

-- 조건부여(WHERE절)
--   일반적으로 테이블에 있는 자원들을 조회할 때가 많다.
--   이때 사용자가 원하는 자원들을 간단한 연산자 등을 이용하여
--   WHERE절에 조건으로 기술하면 원하는 자원들만 추출할 수 있다.

-- 예) emp테이블에서 급여가 2000 이상인 사원들의 정보를
--    사번, 이름, 직종, 급여 순으로 출력해보자.
SELECT empno, ename, job, sal
FROM emp
WHERE sal >= 2000
;

-- 문) emp테이블에서 직종이 영업사원인 사원들의 정보를
--    사번, 이름, 직종, 입사일 순으로 출력하라.

SELECT empno, ename, job, hiredate
FROM emp
WHERE job = 'SALESMAN'
;
-- 주의)
--   1. 같은 값인지 비교하는 비교연산자는 == 이 아닌 = 이다.
--   2. 문자열을 의미할 때는 쌍따옴표(")가 아닌 홑따옴표(')로 표기한다.
--   3. 비교값은 대소문자 구별한다.



-- 문) emp테이블에서 입사일이 1981년 이후에 입사한 사원들의 정보를
--     사번, 이름, 직종, 입사일 순으로 출력하시오.
SELECT empno, ename, job, hiredate
FROM emp
WHERE hiredate >= '1981-01-01'
;

-- 문) emp테이블에서 입사일이 1981년도에 입사한 사원들의 정보를
--     사번, 이름, 직종, 입사일 순으로 출력하시오.

SELECT empno, ename, job, hiredate
FROM emp
WHERE hiredate >= '1981-01-01' and hiredate < '1982-01-01'
;

SELECT empno, ename, job, hiredate
FROM emp
WHERE year(hiredate) = '1981'
;

-- 문) emp테이블에서 직종이 영업사원이고 입사일이 1981년도에 입사한 사원들의 정보를
--     사번, 이름, 직종, 입사일 순으로 출력하시오.

SELECT empno, ename, job, hiredate
FROM emp
WHERE job = 'SALESMAN' and (hiredate >= '1981-01-01' and hiredate < '1982-01-01')
;

-- 정렬(ORDER BY)
--   특정 컬럼을 중심으로 오름차순 또는 내림차순으로 정렬을 시켜 출력하고자 할 때 사용한다.
--   예) emp테이블에서 입사일이 1981년인 사원들의 정보를 사번, 이름, 입사일 순으로 출력하자.
--      이때, 사번이 높은 것부터 내림차순으로 정렬하여 출력한다.

SELECT empno, ename, hiredate
FROM emp
WHERE hiredate >= '1981-01-01' AND hiredate < '1982-01-01'
ORDER BY empno DESC
;


-- 문) emp테이블에서 직종이 영업사원 또는 관리자인 사원들의 정보를
--     사번, 이름, 직종, 입사일 순으로 출력하시오.
--     입사일이 가장 최근인 사원부터 출력

SELECT empno, ename, job, hiredate
FROM emp
WHERE job = 'SALESMAN' OR job = 'MANAGER'
ORDER BY hiredate DESC
;



-- 문) emp테이블에서 직종이 영업사원이면서 급여가 1500 미만인 사원들의 정보를
--     사번, 이름, 직종, 입사일, 급여 순으로 출력하시오.

SELECT empno, ename, job, hiredate, sal
FROM emp
WHERE job = 'SALESMAN' AND sal < 1500
;


-- SQL연산자
--     1. BETWEEN 연산자
--     2. IN 연산자
--     3. LIKE 연산자


--     1. BETWEEN 연산자
--        특정 값 A에서 특정값 B의 사이(범위)의 정보를 얻을 때 사용한다.

-- 		예) emp테이블에서 1981년도에 입사한 사원들의 정보를
-- 			사번, 이름, 직종, 입사일 순으로 출력하자.
SELECT empno, ename, job, hiredate
FROM emp
WHERE hiredate BETWEEN '1981-01-01' AND '1981-12-31' -- = WHERE hiredate >= '1981-01-01' AND hiredate <= '1981-12-31'
;

-- 		문) emp테이블에서 급여가 1500에서 2000 사이인 사원들의 정보를
-- 			사번, 이름, 직종, 급여 순으로 출력하자.

SELECT empno, ename, job, sal
FROM emp
WHERE sal BETWEEN 1500 AND 2000
;

--     2. IN 연산자
--        특정 목록의 결과값에서 비교값이 속하는지를 가려내는 데 사용한다.
--        [구성]
--        WHERE [컬럼명] IN (값1, 값2, ... , 값n)

-- 		예) emp테이블에서 급여가 800, 1000, 1200, 1500인 사원들의 정보를
-- 			사번, 이름, 직종, 급여 순으로 출력하자.
SELECT empno, ename, job, sal
FROM emp
WHERE sal IN (800,1000,1200,1500) -- = WHERE sal = 800 OR sal = 1000 OR sal = 1200 OR sal = 1500
;

-- 		문) emp테이블에서 직종이 사무직 또는 분석가들의 정보를
-- 			사번, 이름, 직종, 급여 순으로 출력하자. 단, IN연산자 사용

SELECT empno, ename, job, sal
FROM emp
WHERE job IN ('CLERK','ANALYST')
;

-- 		문) emp테이블에서 직종이 사무직 또는 분석가가 아닌 사원들의 정보를
-- 			사번, 이름, 직종, 급여 순으로 출력하자. 단, IN연산자 사용

SELECT empno, ename, job, sal
FROM emp
WHERE job NOT IN ('CLERK','ANALYST')
;

-- 		emp테이블에서 보너스(comm)가 null이 아닌 사원들 출력
SELECT *
FROM emp
WHERE comm IS NOT NULL
;

--     3. LIKE 연산자
--        지정한 문자형태와 일치한 자원들을 검색할 때 사용한다.
--        [형식]
--        - % : 모든 값
--        - _ : 하나의 값
--        
--        1) 'M%' : M으로 시작하는 모든 값(Michael, Mike, Mk14,...)
--        2) '%n' : n으로 끝나는 모든 값(13028mnnn, person, 100n)
--        3) '%a%' : a가 포함된 모든 값(1apart100, apple, Na,...)

--        4) 'M______' : M으로 시작하는 값들 중 전체 문자의 수가 총 7자인 값(Michael)
 

-- 		예) emp테이블에서 입사일이 1981년인 사원들의 정보를
-- 			사번, 이름, 직종, 입사일 순으로 출력하자.

SELECT empno, ename, job, hiredate
FROM emp
WHERE hiredate LIKE '1981-%'
;



-- SQL 함수
--   기본적으로 쿼리(질의)문을 더욱 강력하게 하고, 데이터 값을 조작하는 데 있어 도움이 되는 것이 바로 SQL함수다. 

--  SQL함수의 특징과 이점
--  : 자원에 대한 연산을 수행할 수 있다.
--  : 개별적인 데이터 항목을 수행할 수 있다.
--  : 그룹화 작업에도 용이하다.

--  SQL함수의 종류
--    - 문자함수(변환함수, 조작함수)
--    - 숫자함수
--    - 날짜함수

--  문자함수
--   1) 변환함수
-- 		- LOWER(컬럼명 또는 값) : 알파벳 값을 소문자로 바꾸어준다.
-- 		- UPPER(컬럼명 또는 값) : 알파벳 값을 대문자로 바꾸어준다.
-- 		- INITCAP(컬럼명 또는 값) : 알파벳 첫 문자를 대문자로 바꾸어준다. (오라클 지원)

SELECT empno, ename, LOWER(ename) AS l_name, job
FROM emp
;

SELECT empno, job, LOWER(job) AS "직종 별칭", sal
FROM emp
;

--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  -- 
SELECT empno, ename, sal, job
FROM emp
WHERE LOWER(ename) = LOWER('FoRd')
;

--  2) 조작함수
--  	- CONCAT : 두 문자열 연결
--  	- SUBSTRING : 특정 문자나 문자열을 추출(자바의 substring())
--  	- SUBSTR : SUBSTRING
--  	- LEFT : 왼쪽부터 지정한 길이만큼을 추출할 때 사용
--  	- RIGHT : 오른쪽부터 지정한 길이만큼을 추출할 때 사용
--  	- LENGTH : 문자열의 길이
--  	- INSTR : 명시된 문자열의 위치값(자바의 indexOf())
--  	- LTRIM : 문자열의 왼쪽에 있는 공백제거 : "    TEST  " > "TEST  "
--  	- RTRIM : 문자열의 오른쪽에 있는 공백제거 : "    TEST  " > "    TEST"
--  	- REVERSE : 문자열의 순서를 역순으로 만든다.

-- 	예문) emp테이블에서 각 사원들의 정보를
-- 			사번, 이름, 직종, 직종의 3번째 값 순으로 출력하자.

SELECT empno, ename, job, SUBSTR(job,3,1) as 'substr(job)', SUBSTRING(job,3,1) as 'substring(job)', LENGTH(job) as 'length(job)'
FROM emp
;

--  
--  
--  
--  
--  
--  
--  
--  
--  
--  
--  
--  
--  
--  
--  
--  







