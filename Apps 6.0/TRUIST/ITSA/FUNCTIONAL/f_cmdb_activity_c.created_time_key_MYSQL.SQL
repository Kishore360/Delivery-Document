SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_cmdb_activity_c.created_time_key' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT Count(1) AS CNT 
FROM truist_mdsdb.sys_audit_final SRC 
LEFT JOIN truist_mdwdb.f_cmdb_activity_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN truist_mdwdb.d_calendar_date LKP ON (COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.sys_created_on,'GMT','America/New_York'),'%H%i'),'UNSPECIFIED')=LKP.row_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_created_on IS NULL THEN  0 ELSE -1 END)<>TRGT.created_time_key
) temp;



