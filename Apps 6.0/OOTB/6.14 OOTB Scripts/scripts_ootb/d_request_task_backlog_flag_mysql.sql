 SELECT 
 CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.backlog_flag' ELSE 'SUCCESS' END as Message from(
 select ( CASE WHEN LM.dimension_wh_code IN('OPEN') THEN 'Y' ELSE 'N' END)abc, (TRGT.backlog_flag)def
 FROM #MDS_TABLE_SCHEMA.sc_task_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN  #DWH_TABLE_SCHEMA.f_request_task TRGTF 
 ON (TRGTF.request_task_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key  AND LM.dimension_class='STATE~SC_TASK' )a
WHERE abc<>def

