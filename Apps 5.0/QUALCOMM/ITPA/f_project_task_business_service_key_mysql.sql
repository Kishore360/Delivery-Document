

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.business_service_key' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.pm_project_final SRC  
 LEFT JOIN qualcomm_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN qualcomm_mdwdb.d_service LKP 
 ON ( NULL = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE 0<> COALESCE(TRGT.business_service_key,'')