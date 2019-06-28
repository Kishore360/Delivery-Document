
SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_task_ci_service_c.business_service_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM png_mdsdb.task_cmdb_ci_service_final SRC 
JOIN png_mdwdb.d_task_ci_service_c TRGT 
ON SRC.sys_id = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
LEFT JOIN png_mdwdb.d_service LKP 
 ON ( COALESCE(CONCAT('BUSINESS_SERVICE','~',SRC.cmdb_ci_service),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci_service IS NULL THEN 0 else -1 end)<> (TRGT.business_service_key)
 and SRC.cdctype<>'D') a;

 
 