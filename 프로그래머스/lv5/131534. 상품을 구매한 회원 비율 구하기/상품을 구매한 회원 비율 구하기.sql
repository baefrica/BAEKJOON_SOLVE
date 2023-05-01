-- 코드를 입력하세요
SELECT YEAR(SALES_DATE) AS YEAR,
       MONTH(SALES_DATE) AS MONTH,
       COUNT(DISTINCT O.USER_ID) AS PURCHASED_USERS,
       ROUND(COUNT(DISTINCT O.USER_ID) / (SELECT COUNT(*)
                                          FROM USER_INFO
                                          WHERE YEAR(JOINED) = 2021), 1) AS PUCHASED_RATIO

FROM ONLINE_SALE O JOIN (SELECT USER_ID
                         FROM USER_INFO
                         WHERE YEAR(JOINED) = 2021) T
ON O.USER_ID = T.USER_ID

GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH

# SELECT USER_ID
# FROM USER_INFO
# WHERE JOINED LIKE "2021%"

# SELECT YEAR(SALES_DATE) AS YEAR, MONTH(SALES_DATE) AS MONTH
# FROM ONLINE_SALE
# GROUP BY YEAR, MONTH


-- 코드를 입력하세요
# SELECT YEAR(SALES_DATE) AS 'YEAR', 
#        MONTH(SALES_DATE) AS 'MONTH', 
#        COUNT(DISTINCT I.USER_ID) AS 'PUCHASED_USERS', 
#        ROUND(COUNT(DISTINCT I.USER_ID) / (SELECT COUNT(*) FROM USER_INFO WHERE YEAR(JOINED) = 2021), 1) AS 'PUCHASED_RATIO'
#   FROM ONLINE_SALE S
#     INNER JOIN USER_INFO I ON S.USER_ID = I.USER_ID
#  WHERE YEAR(I.JOINED) = 2021
#  GROUP BY YEAR(SALES_DATE), MONTH(SALES_DATE)
#  ORDER BY YEAR(SALES_DATE), MONTH(SALES_DATE)