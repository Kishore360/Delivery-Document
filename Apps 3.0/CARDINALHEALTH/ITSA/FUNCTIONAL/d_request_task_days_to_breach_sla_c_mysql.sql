
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message from
cardinalhealth_mdwdb.d_request_task d_request_task 
JOIN (
			SELECT f_sla.request_task_key,
				   max(f_sla.actual_time_left_c) AS actual_time_left_c
			FROM cardinalhealth_mdwdb.f_task_sla f_sla
			JOIN cardinalhealth_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key 
				AND d_sla.soft_deleted_flag='N' 
				AND f_sla.task_type='SC_TASK'
			JOIN cardinalhealth_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
						AND stage.dimension_class = 'STAGE~TASK_SLA'
						AND stage.dimension_wh_code IN ('IN_PROGRESS','PAUSED')
			JOIN (SELECT f_sla.request_task_key,
						  max(f_sla.due_on_c) AS due_on_c  
				   FROM cardinalhealth_mdwdb.f_task_sla f_sla
				   JOIN cardinalhealth_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key 
						AND d_sla.soft_deleted_flag='N'
				   JOIN cardinalhealth_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
						AND stage.dimension_class = 'STAGE~TASK_SLA'
						AND stage.dimension_wh_code IN ('IN_PROGRESS','PAUSED')
				   WHERE f_sla.task_type = 'SC_TASK'    
				   GROUP BY f_sla.request_task_key) latest ON latest.request_task_key=f_sla.request_task_key
				AND latest.due_on_c=f_sla.due_on_c
			GROUP BY f_sla.request_task_key )tmp ON d_request_task.row_key = tmp.request_task_key  
WHERE d_request_task.days_to_breach_sla_c <> tmp.actual_time_left_c 

