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



