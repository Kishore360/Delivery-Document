
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
 select count(1) as cnt  
from tjx_mdsdb.sys_audit_final a
   JOIN  tjx_mdwdb.f_t_task_activity b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
 where  a.DOCUMENTKEY <> b.TASK_ROW_ID or a.tablename<>b.task_wh_type )b
 
 