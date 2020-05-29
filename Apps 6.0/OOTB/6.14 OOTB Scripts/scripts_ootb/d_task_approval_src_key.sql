
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.approval_src_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_task TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
	ON ( CONCAT('APPROVAL~TASK~',APPROVAL) = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id )
	
where
COALESCE(LKP.row_key
,CASE WHEN SRC.approval IS NULL THEN 0 else '-1' end)

<> COALESCE(TRGT.approval_src_key ,'')

