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

-- 1.6 WHERE 절에서 별칭이 지정된 열 참조하기
-- FROM 절은 WHERE 보다 먼저 평가된다.
SELECT *
FROM (
    SELECT SAL AS SALARY,
    COMM AS COMMISSION
    FROM `EMP`
) X
WHERE SALARY < 5000;

-- 1.7 열 값 이어 붙이기
SELECT CONCAT(`ENAME`, ' WORKS AS A ', `JOB`) AS MSG
FROM `EMP`
WHERE `DEPTNO`=10;

-- 1.8 SELECT 문에서 조건식 사용하기
SELECT `ENAME`, `SAL`
, CASE 
    WHEN `SAL` <= 2000 THEN 'UNDERPAID'
    WHEN `SAL` >= 4000 THEN 'OVERPAID'  
    ELSE 'OK'  
END AS STATUS
FROM `EMP`;

-- 1.9 반환되는 행 수 제한하기
SELECT *
FROM `EMP`
LIMIT 5;

-- 1.10 테이블에서 n개의 무작위 레코드 반환하기
SELECT `ENAME`, `JOB`
FROM `EMP`
ORDER BY RAND()
LIMIT 5;

-- 1.11 null 값 찾기
-- = 또는 != 사용할 수 없음 (is null, is not null 사용)
SELECT *
FROM `EMP`
WHERE `COMM` IS NULL;

-- 1.12 null을 실제값으로 변환하기
-- COALESCE() 하나 이상의 값을 인수로 사용, 목록에서 첫번째 null이 아닌 값을 반환, null이 아닐 때마다 반환 그렇지 않으면 0이 반환되도록 작성
SELECT COALESCE(`COMM`, 0)
FROM `EMP`;

SELECT CASE
    WHEN `COMM` IS NOT NULL THEN `COMM`
    ELSE 0
    END
FROM `EMP`;

