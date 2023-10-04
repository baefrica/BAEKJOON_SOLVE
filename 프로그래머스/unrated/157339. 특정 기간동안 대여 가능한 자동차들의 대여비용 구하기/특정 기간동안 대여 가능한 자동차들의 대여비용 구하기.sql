-- 코드를 입력하세요
SELECT CAR_ID, C.CAR_TYPE, ROUND((DAILY_FEE - (DAILY_FEE * (DISCOUNT_RATE / 100))) * 30) AS FEE
FROM CAR_RENTAL_COMPANY_CAR C
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN P
ON C.CAR_TYPE = P.CAR_TYPE
WHERE C.CAR_TYPE IN ('세단', 'SUV')
AND CAR_ID NOT IN (SELECT DISTINCT CAR_ID
                   FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                   WHERE START_DATE <= '2022-11-30'
                   AND END_DATE >= '2022-11-01')
AND DURATION_TYPE = '30일 이상'
AND ROUND((DAILY_FEE - (DAILY_FEE * (DISCOUNT_RATE / 100))) * 30) BETWEEN 500000 AND 2000000
ORDER BY FEE DESC, CAR_TYPE, CAR_ID DESC;

# -- 대여 불가능한 자동차 목록
# SELECT DISTINCT CAR_ID
# FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
# WHERE START_DATE <= '2022-11-30'
# AND END_DATE >= '2022-11-01'