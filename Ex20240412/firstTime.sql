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



