

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.downtime_end_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT
FROM pandg_mdsdb.change_request_final SRC 
LEFT JOIN pandg_mdwdb.d_change_request TRGT 
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)

WHERE CONVERT_TZ(SRC.u_pg_dwontime_end,'GMT','America/New_York')<>TRGT.downtime_end_c
) temp; 



 