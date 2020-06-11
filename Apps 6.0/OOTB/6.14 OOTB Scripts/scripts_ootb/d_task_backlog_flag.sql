SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  
    LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
	ON ( CONCAT('STATE~TASK~',STATE) = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id )

 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident inc 
	ON SRC.sys_id= inc.row_id
	AND SRC.sourceinstance=inc.source_id 
   -- and SRC.sys_class_name= 'incident'
	LEFT JOIN #DWH_TABLE_SCHEMA.d_problem prob 
	ON SRC.sys_id= prob.row_id
	AND SRC.sourceinstance=prob.source_id 
   -- and SRC.sys_class_name= 'problem'
    LEFT JOIN #DWH_TABLE_SCHEMA.d_request_item req_item 
	ON SRC.sys_id= req_item.row_id
	AND SRC.sourceinstance=req_item.source_id 
   -- and SRC.sys_class_name= 'sc_req_item'
	LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request chan_req 
	ON SRC.sys_id= chan_req.row_id
	AND SRC.sourceinstance=chan_req.source_id 
   -- and SRC.sys_class_name= 'change_request'
 	LEFT JOIN #DWH_TABLE_SCHEMA.d_request_task req_tas 
	ON SRC.sys_id= req_tas.row_id
	AND SRC.sourceinstance=req_tas.source_id 
   -- and SRC.sys_class_name= 'sc_task' 
    LEFT JOIN #DWH_TABLE_SCHEMA.d_request req 
	ON SRC.sys_id= req.row_id
	AND SRC.sourceinstance=req.source_id 
   -- and SRC.sys_class_name= 'sc_request' 
	LEFT JOIN #DWH_TABLE_SCHEMA.d_problem_task prob_tas 
	ON SRC.sys_id= prob_tas.row_id
	AND SRC.sourceinstance=prob_tas.source_id 
   -- and SRC.sys_class_name= 'problem_task' 
	
		LEFT JOIN #DWH_TABLE_SCHEMA.d_change_task chan_tas 
	ON SRC.sys_id= chan_tas.row_id
	AND SRC.sourceinstance=chan_tas.source_id 
   -- and SRC.sys_class_name= 'change_task' 
	
	 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else '-1' end)  = LM.src_key 
 and LM.dimension_class = 'STATE~TASK'
 
 
 
WHERE COALESCE( inc.backlog_flag,prob.backlog_flag,prob_tas.backlog_flag,req_item.backlog_flag
,req_tas.backlog_flag,req.backlog_flag,chan_req.backlog_flag,chan_tas.backlog_flag,
-- CASE WHEN LM.dimension_wh_code  IN('OPEN') THEN 'Y' ELSE 'N' END
TRGT.backlog_flag-- ok to have any values fro the other child tasks
)<> COALESCE(TRGT.backlog_flag ,'')

