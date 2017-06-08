 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_task_fss_c' ELSE 'SUCCESS' END as Message from (
 select count(1) as cnt 
  FROM 
gilead_mdwdb.d_task_fss_c di
  JOIN gilead_mdwdb.f_task_fss_c fi ON di.row_key = fi.task_fss_c_key
  JOIN gilead_mdwdb.d_lov_map dlm ON di.state_c_key = dlm.src_key  	
  where (CASE WHEN (dlm.dimension_class = 'STATE_C~TASK_FSS_C'
  AND dlm.dimension_wh_code = 'CLOSED'
  AND  first_call_resolution_flag= 'Y'  
AND fi.mod_count=1) THEN 'Y'ELSE 'N' END) <> first_call_resolution_flag)a; 