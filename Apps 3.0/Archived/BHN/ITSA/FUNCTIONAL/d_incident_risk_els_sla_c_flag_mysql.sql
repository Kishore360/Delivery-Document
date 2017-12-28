SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM 
bhn_mdwdb.d_incident d_inc 
LEFT JOIN (
			SELECT a.incident_key,
			max(CASE WHEN a.sla_category='CS_Response' THEN a.outcome_flag END) AS cs_response,
			max(CASE WHEN a.sla_category='RISK_ELS' THEN a.outcome_flag END) AS risk_els,
			group_concat(a.outcome_flag) AS response
			FROM 
				(SELECT f_sla.incident_key,
						d_sla.sla_category, 
						group_concat(f_sla.outcome_flag) AS outcome_flag
					FROM bhn_mdwdb.f_task_sla f_sla
					JOIN bhn_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
						AND stage.dimension_class = 'STAGE~TASK_SLA'
						AND stage.dimension_wh_code <> 'CANCELLED'
					JOIN bhn_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key 
						AND d_sla.soft_deleted_flag='N' 
						AND f_sla.task_type='INCIDENT'
					JOIN ( 
						   SELECT f_sla.incident_key,
								  d_sla.sla_name,
								  max(f_sla.sla_end_time_c) AS sla_end_time_c  
						   FROM bhn_mdwdb.f_task_sla f_sla
						   JOIN bhn_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key
						   JOIN bhn_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
									AND stage.dimension_class = 'STAGE~TASK_SLA' 
						   WHERE f_sla.task_type = 'INCIDENT' AND stage.dimension_wh_code <>'CANCELLED'    
						   GROUP BY f_sla.incident_key,d_sla.sla_name) latest ON latest.incident_key=f_sla.incident_key
						AND latest.sla_name=d_sla.sla_name 	
						AND latest.sla_end_time_c=f_sla.sla_end_time_c
					GROUP BY f_sla.incident_key,d_sla.sla_category) a GROUP BY incident_key) tmp ON d_inc.row_key=tmp.incident_key  
					where (d_inc.risk_els_sla_c_flag <> COALESCE(CASE WHEN tmp.risk_els LIKE '%Y%' THEN 'N' WHEN tmp.risk_els LIKE '%N%' THEN 'Y' end,'N/A')
 OR d_inc.risk_els_sla_c_flag IS NULL)
 
 