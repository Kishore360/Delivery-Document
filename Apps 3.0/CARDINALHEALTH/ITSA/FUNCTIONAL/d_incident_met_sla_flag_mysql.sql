SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for d_enhancement_rm_c' ELSE 'SUCCESS' END as Message
FROM
cardinalhealth_mdwdb.d_incident d_inc 
LEFT JOIN (
SELECT f_sla.incident_key,
  group_concat(f_sla.outcome_flag) as outcome_flag
FROM cardinalhealth_mdwdb.f_task_sla f_sla
JOIN cardinalhealth_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key 
AND d_sla.soft_deleted_flag='N' 
AND d_sla.type_c = 'SLA'
AND f_sla.task_type='INCIDENT'
JOIN cardinalhealth_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
AND stage.dimension_class = 'STAGE~TASK_SLA'
AND stage.dimension_wh_code <> 'CANCELLED'
JOIN (SELECT f_sla.incident_key,
d_sla.sla_category,
 max(f_sla.due_on_c) AS due_on_c  
  FROM cardinalhealth_mdwdb.f_task_sla f_sla
  JOIN cardinalhealth_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key 
AND d_sla.soft_deleted_flag='N' 
AND d_sla.type_c = 'SLA'
JOIN cardinalhealth_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
AND stage.dimension_class = 'STAGE~TASK_SLA'
AND stage.dimension_wh_code <> 'CANCELLED'
  WHERE f_sla.task_type = 'INCIDENT'    
  GROUP BY f_sla.incident_key,
           d_sla.sla_category) latest ON latest.incident_key=f_sla.incident_key
AND latest.due_on_c=f_sla.due_on_c
GROUP BY f_sla.incident_key )tmp ON d_inc.row_key = tmp.incident_key  
WHERE d_inc.met_sla_flag <> CASE WHEN tmp.outcome_flag LIKE '%Y%' THEN 'N' ELSE 'Y' end




