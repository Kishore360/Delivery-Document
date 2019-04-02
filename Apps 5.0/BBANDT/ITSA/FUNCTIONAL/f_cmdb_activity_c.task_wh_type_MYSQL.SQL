
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_cmdb_activity_c.task_wh_type' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT Count(1) AS CNT 
FROM bbandt_mdsdb.sys_audit_final SRC 
LEFT JOIN bbandt_mdwdb.f_cmdb_activity_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE (SRC.tablename)<>TRGT.task_wh_type and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N'
) temp;







