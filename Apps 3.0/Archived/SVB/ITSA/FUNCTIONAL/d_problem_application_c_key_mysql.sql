SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.configuration_item_application_c_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM svb_mdsdb.problem_final SRC 
 LEFT JOIN svb_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN svb_mdwdb.d_application LKP 
 ON ( COALESCE(CONCAT('APPLICATION~',SRC.u_application),'UNSPECIFIED')= LKP.row_id  
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_application IS NULL THEN 0 else -1 end)<> (TRGT.application_c_key))temp;

