SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from coach_mdsdb.contract_sla_final a
 left  JOIN  coach_mdwdb.d_task_sla b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
 where  a.stop_condition <> b.sla_condition_stop_c )b
 
 