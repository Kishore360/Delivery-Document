
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_cmdb_activity_c.created_on' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT Count(1) AS CNT 
FROM bbandt_mdsdb.sys_audit_final SRC 
LEFT JOIN bbandt_mdwdb.f_cmdb_activity_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE CONVERT_TZ(SRC.sys_created_on,'GMT','America/New_York')<>TRGT.created_on and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N'
) temp; 




 
 
 