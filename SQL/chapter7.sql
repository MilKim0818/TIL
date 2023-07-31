-- chapter7.숫자 작업
-- 7.1 평균 계산하기
-- 모든 사원 급여의 평균 계산 
SELECT AVG(`SAL`) AS avg_sal
FROM `EMP`;

-- 각 부서의 평균 급여 계산
SELECT `DEPTNO`, AVG(`SAL`) as avg_sal
FROM `EMP`
GROUP BY `DEPTNO`
ORDER BY `DEPTNO`;

-- ROLLUP 전체, 소계 평균 
SELECT `DEPTNO`, AVG(`SAL`) as avg_sal
FROM `EMP`
GROUP BY `DEPTNO` WITH ROLLUP;

