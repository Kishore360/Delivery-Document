SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.over_due_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance
 -- AND FRESH.etl_run_number = TRGT.etl_run_number
 )
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
	LEFT JOIN #DWH_TABLE_SCHEMA.d_change_task chang_tas 
	ON SRC.sys_id= chang_tas.row_id
	AND SRC.sourceinstance=chang_tas.source_id 
   -- and SRC.sys_class_name= 'change_task' 
	 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else '-1' end)  = LM.src_key 
 and LM.dimension_class = 'STATE~TASK'
 
 
 
WHERE COALESCE( inc.over_due_flag,prob.over_due_flag,prob_tas.over_due_flag,req_item.over_due_flag
,req_tas.over_due_flag,req.over_due_flag,chan_req.overdue_flag,chang_tas.overdue_flag,
/*CASE WHEN (LM.dimension_wh_code  IN('CLOSED') and coalesce( SRC.closed_at,SRC.sys_updated_on)>coalesce( SRC.due_Date,0) and SRC.due_date is not null)
or (LM.dimension_wh_code  IN ('OPEN') and coalesce( SRC.due_date,0) < convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>' , '<<TENANT_SSI_TIME_ZONE>>')
and SRC.due_date is not null and SRC.active=1)
 THEN 'Y' ELSE 'N' END*/
 TRGT.over_due_flag -- ok to have random values for the otehr child tasks
 )<> COALESCE(TRGT.over_due_flag ,'')

