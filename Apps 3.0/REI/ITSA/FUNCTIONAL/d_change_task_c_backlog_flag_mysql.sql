SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
rei_mdwdb.d_change_task_c d
      JOIN rei_mdwdb.f_change_task_c f
          on d.row_key = f.change_task_key  
      JOIN rei_mdwdb.d_lov_map lov_map
          on f.state_src_key = lov_map.src_key  and lov_map.dimension_class = 'STATE~CHANGE_TASK' 
where case when lov_map.dimension_wh_code IN ('OPEN') then  'Y' else 'N'  end<>d.backlog_flag)a  
                  