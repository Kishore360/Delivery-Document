SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message 
from  svb_mdwdb.f_incident f_inc 
LEFT JOIN (
			SELECT f_sla.incident_key,max(f_sla.business_duration_c) as business_duration,
			max(f_sla.actual_duration) as actual_duration
			FROM svb_mdwdb.f_task_sla f_sla
			JOIN svb_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
			AND stage.dimension_class = 'STAGE~TASK_SLA'
			AND stage.dimension_wh_code <> 'CANCELLED'
			JOIN svb_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key 
				AND d_sla.soft_deleted_flag='N' 
			   AND d_sla.sla_category='Resolution'
				AND d_sla.type_c='SLA'
				AND f_sla.task_type='INCIDENT'
			JOIN (SELECT f_sla.incident_key,
						  max(f_sla.due_on_c) AS due_on_c  
				   FROM svb_mdwdb.f_task_sla f_sla
				   JOIN svb_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key 
						AND d_sla.soft_deleted_flag='N' 
						AND d_sla.sla_category='Resolution'
						AND d_sla.type_c='SLA'
					JOIN svb_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
						AND stage.dimension_class = 'STAGE~TASK_SLA'
				   WHERE f_sla.task_type = 'INCIDENT' AND stage.dimension_wh_code <> 'CANCELLED'   
				   GROUP BY f_sla.incident_key) latest ON latest.incident_key=f_sla.incident_key
				AND latest.due_on_c=f_sla.due_on_c
			GROUP BY f_sla.incident_key )tmp ON f_inc.incident_key  = tmp.incident_key  
where  f_inc.business_duration_resolution_c<>tmp.business_duration

