SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.closed_by_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_task TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
	ON ( coalesce(concat('INTERNAL_CONTACT~',SRC.closed_by),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
	
	LEFT JOIN #DWH_TABLE_SCHEMA.f_incident inc 
	ON SRC.sys_id= inc.row_id
	AND SRC.sourceinstance=inc.source_id 
   -- and SRC.sys_class_name= 'incident'
	LEFT JOIN #DWH_TABLE_SCHEMA.f_problem prob 
	ON SRC.sys_id= prob.row_id
	AND SRC.sourceinstance=prob.source_id 
   -- and SRC.sys_class_name= 'problem'
    LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item req_item 
	ON SRC.sys_id= req_item.row_id
	AND SRC.sourceinstance=req_item.source_id 
   -- and SRC.sys_class_name= 'sc_req_item'
	LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request chan_req 
	ON SRC.sys_id= chan_req.row_id
	AND SRC.sourceinstance=chan_req.source_id 
   -- and SRC.sys_class_name= 'change_request'
 	LEFT JOIN #DWH_TABLE_SCHEMA.f_request_task req_tas 
	ON SRC.sys_id= req_tas.row_id
	AND SRC.sourceinstance=req_tas.source_id 
   -- and SRC.sys_class_name= 'sc_task' 
    LEFT JOIN #DWH_TABLE_SCHEMA.f_request req 
	ON SRC.sys_id= req.row_id
	AND SRC.sourceinstance=req.source_id 
   -- and SRC.sys_class_name= 'sc_request' 
	LEFT JOIN #DWH_TABLE_SCHEMA.f_problem_task prob_tas 
	ON SRC.sys_id= prob_tas.row_id
	AND SRC.sourceinstance=prob_tas.source_id 
   -- and SRC.sys_class_name= 'problem_task'
	LEFT JOIN #DWH_TABLE_SCHEMA.f_change_task chan_tas 
	ON SRC.sys_id= chan_tas.row_id
	AND SRC.sourceinstance=chan_tas.source_id 
   -- and SRC.sys_class_name= 'change_task' 
		
   
WHERE COALESCE(inc.closed_by_key,prob.closed_by_key,prob_tas.closed_by_key,req_item.closed_by_key
,req_tas.closed_by_key,req.closed_by_key,chan_req.closed_by_key,chan_tas.closed_by_key,LKP.row_key
,CASE WHEN SRC.closed_by IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.closed_by_key ,'')
	
	
 --  WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.closed_by_key ,'')
