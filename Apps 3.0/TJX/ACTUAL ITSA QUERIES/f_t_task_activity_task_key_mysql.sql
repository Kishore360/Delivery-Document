SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt
from tjx_mdwdb.d_problem  problem_dp


 LEFT OUTER JOIN   tjx_mdwdb.f_t_task_activity ftta    ON  problem_dp.row_id=ftta.task_row_id 
 AND problem_dp.source_id=ftta.source_id 
 
where task_wh_type='problem' and task_key <> CASE 
   WHEN task_wh_type='problem' THEN COALESCE((CASE WHEN ftta.task_row_id  ='UNSPECIFIED' THEN 0 ELSE problem_dp.row_key   END  ),-1)end 
)a ;


