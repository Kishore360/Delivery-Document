SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task.opened_by_department_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC_P
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_final WHERE CDCTYPE<>'D') SRC
ON (SRC.sys_id=SRC_P.opened_by) 
LEFT JOIN #DWH_TABLE_SCHEMA.f_task TRGT 
	ON (SRC_P.sys_id =TRGT.row_id 
	AND SRC_P.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization LKP 
	ON (CONCAT('DEPARTMENT~',SRC.department) = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.department IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.opened_by_department_key ,'')
;