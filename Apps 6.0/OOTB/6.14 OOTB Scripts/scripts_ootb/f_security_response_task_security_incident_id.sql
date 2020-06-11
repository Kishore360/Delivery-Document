SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_security_security_response_task_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_si_task_final WHERE CDCTYPE<>'D')  SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_security_response_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_security_response_task LKP 
 ON ( SRC.sys_id = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.security_response_task_key,'')




