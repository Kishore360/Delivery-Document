SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

nbcu_mdsdb.task_final a
join nbcu_mdwdb.d_task d
on a.sys_id=d.row_id and a.sourceinstance=d.source_id
  JOIN nbcu_mdwdb.f_task_c f
          on d.row_key = f.task_key  
      JOIN nbcu_mdwdb.d_lov_map lov_map
          on f.state_src_key = lov_map.src_key 
where case when  lov_map.dimension_class  in (
'REQUEST_STATE~SC_REQUEST',
'STATE~CHANGE_REQUEST',
'STATE~CHANGE_TASK',
'STATE~INCIDENT',
'STATE~PROBLEM',
'STATE~PROBLEM_TASK',
'STATE~SC_REQ_ITEM',
'STATE~SC_TASK',
'STATE~RM_ENHANCEMENT',
'STATE~RM_DEFECT'
 )

 and lov_map.dimension_wh_code NOT IN ('RESOLVED','CLOSED') then 'Y' else 'N' end 
 <> backlog_flag_c
 
 