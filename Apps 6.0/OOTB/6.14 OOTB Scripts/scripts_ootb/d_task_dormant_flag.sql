
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.over_due_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC 
  LEFT JOIN #DWH_TABLE_SCHEMA.d_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident inc 
	ON SRC.sys_id= inc.row_id
	AND SRC.sourceinstance=inc.source_id 
	LEFT JOIN #DWH_TABLE_SCHEMA.d_problem prob 
	ON SRC.sys_id= prob.row_id
	AND SRC.sourceinstance=prob.source_id 
    LEFT JOIN #DWH_TABLE_SCHEMA.d_request req 
	ON SRC.sys_id= req.row_id
	AND SRC.sourceinstance=req.source_id 
	LEFT JOIN #DWH_TABLE_SCHEMA.d_problem_task prob_tas 
	ON SRC.sys_id= prob_tas.row_id
	AND SRC.sourceinstance=prob_tas.source_id 
	LEFT JOIN #DWH_TABLE_SCHEMA.d_change_task chang_tas 
	ON SRC.sys_id= chang_tas.row_id
	AND SRC.sourceinstance=chang_tas.source_id 

WHERE COALESCE( inc.dormant_flag,prob.dormant_flag,prob_tas.dormant_flag,req.dormant_flag,chang_tas.dormant_flag, TRGT.dormant_flag)<> COALESCE(TRGT.dormant_flag ,'')
