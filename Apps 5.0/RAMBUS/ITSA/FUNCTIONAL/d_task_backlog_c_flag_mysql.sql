SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task.backlog_c_flag' ELSE 'SUCCESS' END as Message 
FROM (SELECT count(1) as cnt 
from rambus_mdwdb.d_task d
JOIN rambus_mdwdb.f_task_c f
on d.row_key = f.task_key  
JOIN rambus_mdwdb.d_lov_map lov_map ON d.state_src_key = lov_map.src_key   
where d.backlog_c_flag<> case when lov_map.dimension_class  in (
'REQUEST_STATE~SC_REQUEST',
'STATE~CHANGE_REQUEST',
'STATE~TASK',
'STATE~INCIDENT',
'STATE~PROBLEM',
'STATE~SC_REQ_ITEM',
'STATE~SC_TASK'
 )
and lov_map.dimension_wh_code NOT IN ('RESOLVED','CLOSED') THEN 'Y' else 'N'end)a;