SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_security_response_task.impact_src_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_si_task_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_security_response_task TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
	ON COALESCE( CONCAT('IMPACT','~','SECURITY_RESPONSE_TASK','~',UPPER(IMPACT)),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id  AND dimension_class ='IMPACT~SECURITY_RESPONSE_TASK'
WHERE TRGT.row_key not in (0,-1) and 
COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.impact_src_key ,'')

