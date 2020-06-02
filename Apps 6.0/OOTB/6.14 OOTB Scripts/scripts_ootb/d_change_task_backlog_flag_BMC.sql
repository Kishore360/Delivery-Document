SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.backlog_flag' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_task TRGT 
 ON (SRC.task_id=TRGT.row_id 
 AND TRGT.soft_deleted_flag='N'
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( CONCAT('STATE','~','CHANGE_TASK','~',UPPER(SRC.status)) = LKP.row_id 
 and LKP.dimension_class='STATE~CHANGE_TASK' 
 AND SRC.sourceinstance = LKP.source_id )
WHERE coalesce(CASE WHEN LKP.dimension_wh_code IN('OPEN') THEN 'Y' ELSE 'N' END,'') <> coalesce(TRGT.backlog_flag,'') 
