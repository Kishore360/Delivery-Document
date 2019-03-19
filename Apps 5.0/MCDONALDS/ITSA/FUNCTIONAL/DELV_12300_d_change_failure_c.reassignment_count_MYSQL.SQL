

SELECT 
CASE WHEN CNT >0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0  THEN 'MDS to DWH data validation failed for d_change_failure_c.reassignment_count' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM mcdonalds_mdsdb.change_request_final SRC
LEFT JOIN mcdonalds_mdwdb.d_change_failure_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance =TRGT.source_id
WHERE COALESCE(SRC.reassignment_count,0)<>TRGT.reassignment_count
AND SRC.cdctype<>'D'
) temp;


