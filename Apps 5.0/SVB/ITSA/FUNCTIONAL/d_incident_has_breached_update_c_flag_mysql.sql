SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_duration_c' ELSE 'SUCCESS' END as Message
from svb_mdwdb.d_incident d_inc 
LEFT JOIN (
			SELECT f_sla.incident_key,group_concat(f_sla.outcome_flag) as outcome_flag
			FROM svb_mdwdb.f_task_sla f_sla
			JOIN svb_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
			AND stage.dimension_class = 'STAGE~TASK_SLA'
			AND stage.dimension_wh_code <> 'CANCELLED'
			JOIN svb_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key 
				AND d_sla.soft_deleted_flag='N' 
				AND d_sla.sla_category='TimeToUpdate'
				AND d_sla.type_c='OLA'
				AND f_sla.task_type='INCIDENT'
			JOIN (SELECT f_sla.incident_key,
						  max(f_sla.due_on_c) AS due_on_c  
				   FROM svb_mdwdb.f_task_sla f_sla
				   JOIN svb_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key 
						AND d_sla.soft_deleted_flag='N' 
						AND d_sla.sla_category='TimeToUpdate'
						AND d_sla.type_c='OLA'
					JOIN svb_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
						AND stage.dimension_class = 'STAGE~TASK_SLA'
				   WHERE f_sla.task_type = 'INCIDENT' AND stage.dimension_wh_code <> 'CANCELLED'   
				   GROUP BY f_sla.incident_key) latest ON latest.incident_key=f_sla.incident_key
				AND latest.due_on_c=f_sla.due_on_c
			GROUP BY f_sla.incident_key )tmp ON d_inc.row_key = tmp.incident_key  
WHERE d_inc.has_breached_update_c_flag <> CASE WHEN tmp.outcome_flag LIKE '%Y%' THEN 'Y' ELSE 'N' end;

