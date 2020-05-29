
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_hr_case_activity.task_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_hr_case_activity TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_hr_case LKP 
	ON (SRC.documentkey = LKP.row_id
	AND SRC.sourceinstance = LKP.source_id)
WHERE  SRC.tablename = 'hr_case' AND COALESCE(LKP.row_key,CASE WHEN SRC.documentkey IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.task_key,'')
