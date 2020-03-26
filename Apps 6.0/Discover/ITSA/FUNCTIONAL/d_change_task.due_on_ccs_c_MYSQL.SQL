SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_task.due_on_ccs_c' ELSE 'SUCCESS' END as Message 
from discover_mdwdb.d_change_task a   
    INNER JOIN
        discover_mdwdb.f_change_task f 
            ON a.row_key=f.change_task_key  
    INNER JOIN
        discover_mdwdb.d_lov_map br 
            ON f.state_src_key = br.src_key  
    LEFT OUTER JOIN
        discover_mdwdb.d_change_request d_change_request 
            ON f.change_request_key=d_change_request.row_key  
   where
        a.due_on_ccs_c <> COALESCE(a.due_on,
        d_change_request.planned_end_on)  ;