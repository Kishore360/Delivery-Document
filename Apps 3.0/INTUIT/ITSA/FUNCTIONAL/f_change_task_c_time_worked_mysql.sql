SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where TIMESTAMPDIFF(SECOND,'1970/01/01 00:00:00',a.time_worked)<>c.time_worked) g