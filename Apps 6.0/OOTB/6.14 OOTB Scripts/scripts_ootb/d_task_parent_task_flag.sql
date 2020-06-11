SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.parent_task_flag' ELSE 'SUCCESS' END as Message
  
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC 

LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC1 
	ON (SRC.sys_id =SRC1.parent 
	AND SRC.sourceinstance =SRC1.sourceinstance )
    
LEFT JOIN #DWH_TABLE_SCHEMA.d_task LKP 
	ON (SRC.sys_id = LKP.row_id
	AND SRC.sourceinstance = LKP.source_id )
    
  LEFT JOIN   #DWH_TABLE_SCHEMA.d_task LKP1
	ON (SRC1.sys_id = LKP1.row_id
	AND SRC1.sourceinstance =LKP1.source_id )  
WHERE CASE WHEN LKP1.row_key IS  NULL THEN 'N' else 'Y' end<> COALESCE(LKP.parent_task_flag,'')
