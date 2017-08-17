
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'Business day flag has not updated' ELSE 'data matched' END as Message
FROM (SELECT count(1) as CNT
FROM  rambus_mdwdb.d_call trgt
RIGHT JOIN rambus_mdsdb.new_call_final src ON trgt.row_id = src.sys_id AND trgt.source_id =src.sourceinstance
WHERE 
(CASE WHEN (DAYOFWEEK(CONVERT_TZ(opened_at,'GMT','America/Los_Angeles'))=6 AND TIME(CONVERT_TZ(opened_at,'GMT','America/Los_Angeles'))>='16:30') THEN 'N'
WHEN (DAYOFWEEK(CONVERT_TZ(opened_at,'GMT','America/Los_Angeles')) = 7 ) THEN 'N' 
WHEN (DAYOFWEEK(CONVERT_TZ(opened_at,'GMT','America/Los_Angeles')) = 1 AND TIME(CONVERT_TZ(opened_at,'GMT','America/Los_Angeles')) <= '15:30' ) THEN 'N'
ELSE 'Y' END) <> business_day_flag_c)temp;