
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'Business day flag has not updated' ELSE 'data matched' END as Message
FROM (SELECT count(1) as CNT
FROM  rambus_mdwdb.d_call
WHERE 
(CASE WHEN (DAYOFWEEK(opened_on)=6 AND TIME(opened_on)>='16:30') THEN 'N'
WHEN (DAYOFWEEK(opened_on) = 7 ) THEN 'N' 
WHEN (DAYOFWEEK(opened_on) = 1 AND TIME(opened_on) <= '15:30' ) THEN 'N'
ELSE 'Y' END) <> business_day_flag_c)temp;
