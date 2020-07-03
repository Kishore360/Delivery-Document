SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_cmdb_activity_c.updated_by' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT Count(1) AS CNT 
FROM truist_mdsdb.sys_audit_final SRC 
LEFT JOIN truist_mdwdb.f_cmdb_activity_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.user,'UNSPECIFIED')<>TRGT.updated_by
) temp;


