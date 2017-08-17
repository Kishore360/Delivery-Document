SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from coach_mdsdb.sc_task_final a
 left  JOIN  coach_mdwdb.d_request_task b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
 where  b.task_sla_c <> COALESCE(a.u_task_sla,'UNSPECIFIED') )b