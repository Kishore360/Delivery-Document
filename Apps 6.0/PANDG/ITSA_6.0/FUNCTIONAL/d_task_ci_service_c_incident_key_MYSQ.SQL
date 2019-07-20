

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task_ci_service_c.incident_key' ELSE 'SUCCESS' END as Message
 FROM (
 SELECT count(1) as cnt
 FROM png_mdsdb.task_cmdb_ci_service_final SRC 
 LEFT JOIN png_mdwdb.d_task_ci_service_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN png_mdwdb.d_incident LKP 
 ON  COALESCE(SRC.task,'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.task IS NULL THEN 0 else -1 end)<>(TRGT.incident_key)
 and SRC.cdctype<>'D')temp;
