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
AND latest.sla_category=f_sla.sla_category
AND latest.due_on_c=f_sla.due_on_c
GROUP BY f_sla.incident_key )tmp ON d_inc.row_key = tmp.incident_key  
WHERE d_inc.met_sla_flag <> CASE WHEN tmp.outcome_flag LIKE '%Y%' THEN 'N' ELSE 'Y' end






- START
UPDATE cardinalhealth_mdwdb.d_incident d_inc
SET d_inc.days_to_breach_sla_c = NULL,
d_inc.met_sla_flag = 'N'
WHERE d_inc.etl_run_number = 1;
-- END

-- START
UPDATE cardinalhealth_mdwdb.d_incident d_inc 
LEFT JOIN (
SELECT f_sla.incident_key,
  max(f_sla.actual_time_left_c) AS actual_time_left_c
FROM cardinalhealth_mdwdb.f_task_sla f_sla
JOIN cardinalhealth_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key 
AND d_sla.soft_deleted_flag='N' 
AND d_sla.sla_category='resolution'
AND f_sla.task_type='INCIDENT'
JOIN cardinalhealth_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
AND stage.dimension_class = 'STAGE~TASK_SLA'
AND stage.dimension_wh_code IN ('IN_PROGRESS','PAUSED')
JOIN (SELECT f_sla.incident_key,
 max(f_sla.due_on_c) AS due_on_c  
  FROM cardinalhealth_mdwdb.f_task_sla f_sla
  JOIN cardinalhealth_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key 
AND d_sla.soft_deleted_flag='N' 
AND d_sla.sla_category='resolution'
JOIN cardinalhealth_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
AND stage.dimension_class = 'STAGE~TASK_SLA'
AND stage.dimension_wh_code IN ('IN_PROGRESS','PAUSED')
  WHERE f_sla.task_type = 'INCIDENT'    
  GROUP BY f_sla.incident_key) latest ON latest.incident_key=f_sla.incident_key
AND latest.due_on_c=f_sla.due_on_c
GROUP BY f_sla.incident_key )tmp ON d_inc.row_key = tmp.incident_key  
SET d_inc.days_to_breach_sla_c = tmp.actual_time_left_c,
d_inc.etl_run_number = 1
WHERE d_inc.days_to_breach_sla_c <> tmp.actual_time_left_c 
OR (d_inc.days_to_breach_sla_c IS NULL AND tmp.actual_time_left_c IS NOT NULL);
-- END













-- START
UPDATE cardinalhealth_mdwdb.d_incident d_inc 
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
AND latest.sla_category=f_sla.sla_category
AND latest.due_on_c=f_sla.due_on_c
GROUP BY f_sla.incident_key )tmp ON d_inc.row_key = tmp.incident_key  
SET d_inc.met_sla_flag = CASE WHEN tmp.outcome_flag LIKE '%Y%' THEN 'N' ELSE 'Y' end,
d_inc.etl_run_number = 1
WHERE d_inc.met_sla_flag <> CASE WHEN tmp.outcome_flag LIKE '%Y%' THEN 'N' ELSE 'Y' end;
-- END



-- START
UPDATE cardinalhealth_workdb.d_incident ds 
 JOIN cardinalhealth_mdwdb.d_incident d ON ds.row_key=d.row_key
SET ds.days_to_breach_sla_c=d.days_to_breach_sla_c,
ds.met_sla_flag = d.met_sla_flag,
WHERE d.etl_run_number = 1;
-- END
