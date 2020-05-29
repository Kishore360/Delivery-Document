

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.total_actual_doc_cost' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_task_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 left join #DWH_TABLE_SCHEMA.d_project DIM
 on TRGT.project_key = DIM.row_key
 WHERE CASE WHEN DIM.is_leaf_flag = 'Y' THEN total_actual_doc_cost 
ELSE COALESCE( CAST(coalesce(SRC.work_cost ,0) as decimal(20,10)),'') end<> COALESCE(TRGT.total_actual_doc_cost ,'')
