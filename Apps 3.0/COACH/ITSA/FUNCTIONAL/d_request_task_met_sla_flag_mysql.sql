SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from
coach_mdwdb.d_request_task d_reqtask 
 JOIN (
SELECT      f_sla.request_task_key,
group_concat(f_sla.outcome_flag) AS outcome_flag
FROM coach_mdwdb.f_task_sla f_sla
JOIN coach_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
AND stage.dimension_class = 'STAGE~TASK_SLA'
AND stage.dimension_wh_code <> 'CANCELLED'
JOIN coach_mdwdb.d_task_sla d_sla ON d_sla.row_key=f_sla.sla_key 
AND d_sla.soft_deleted_flag='N' 
AND f_sla.task_type='SC_TASK'
JOIN ( 
  SELECT f_sla.request_task_key,
 max(f_sla.due_on) AS due_on  
  FROM coach_mdwdb.f_task_sla f_sla
  JOIN coach_mdwdb.d_lov_map stage ON f_sla.stage_src_key = stage.src_key
AND stage.dimension_class = 'STAGE~TASK_SLA' 
  WHERE f_sla.task_type = 'SC_TASK' AND stage.dimension_wh_code <>'CANCELLED'    
  GROUP BY f_sla.request_task_key) latest ON latest.request_task_key=f_sla.request_task_key 
AND latest.due_on=f_sla.due_on
GROUP BY f_sla.request_task_key) tmp ON d_reqtask.row_key=tmp.request_task_key  
WHERE d_reqtask.met_sla_flag <> CASE WHEN tmp.outcome_flag LIKE '%Y%' THEN 'N' WHEN tmp.outcome_flag LIKE '%N%' THEN 'Y' end