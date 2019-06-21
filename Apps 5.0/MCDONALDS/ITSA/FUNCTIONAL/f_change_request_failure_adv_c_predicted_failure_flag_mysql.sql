

SELECT 
CASE WHEN CNT >0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0  THEN 'MDS to DWH data validation failed for d_change_failure_c.predicted_failure_flag' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT  Count(1) as CNT 
FROM mcdonalds_mdsdb.change_request_final SRC
LEFT JOIN mcdonalds_mdwdb.f_change_request_failure_adv_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance =TRGT.source_id
WHERE CASE WHEN SRC.sys_id is NOT NULL THEN 'N' ELSE 'N' END <>TRGT.predicted_failure_flag
AND SRC.cdctype<>'D' 
) temp;




