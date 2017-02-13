 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.task_sla_final a
JOIN  cardinalhealth_mdwdb.f_task_sla b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
Where timestampdiff(DAY,'1970-01-01 00:00:00',a.time_left) <> b.actual_time_left_c)c


