SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.planned_end_on' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM whirlpool_mdsdb.change_request_final SRC 
LEFT JOIN whirlpool_mdwdb.d_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE CONVERT_TZ(SRC.end_date,'GMT','America/New_York')<>TRGT.planned_end_on
AND SRC.cdctype='X' )temp; 

