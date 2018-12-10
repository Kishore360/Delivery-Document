


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_change_request.pg_downtime_priority_src_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  Count(1) AS CNT 
FROM pandg_mdsdb.change_request_final SRC 
LEFT JOIN pandg_mdwdb.f_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN pandg_mdwdb.d_lov LKP ON (CONCAT('PG_DOWNTIME_PRIORITY_C','~','CHANGE_REQUEST','~',SRC.u_pg_downtime_priority)=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pg_downtime_priority IS NULL THEN 0 ELSE -1 END)<>TRGT.pg_downtime_priority_src_c_key
) temp; 


