-- chapter1. 레코드 검색
-- 1.1 테이블 모든 행과 열 검색
SELECT *
FROM `EMP`;

SELECT `EMPNO`,`ENAME`,`JOB`,`SAL`,`MGR`,`HIREDATE`,`COMM`,`DEPTNO`
FROM `EMP`;

-- 1.2 테이블에서 행의 하위 집합 검색 (where)
SELECT *
FROM `EMP`
WHERE `DEPTNO` = 10;

-- 1.3 여러 조건을 충족하는 행 찾기
-- 부서 번호 10의 모든 사원, 커미션을 받는 사원, 최대 2000달러를 받는 부서 번호 20의 사원
SELECT *
FROM `EMP`
WHERE `DEPTNO` = 10
OR `COMM` IS NOT NULL
OR `SAL` <= 2000 AND `DEPTNO` = 20;

-- 1.4 테이블에서 열의 하위 집합 검색
SELECT `ENAME`,`DEPTNO`,`SAL`
FROM `EMP`;

-- 1.5 열에 의미 있는 이름 지정하기
SELECT `SAL` AS SALARY, `COMM` AS COMMISSION
FROM `EMP`;