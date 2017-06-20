 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdsdb.task_sla_final src
join 
svb_mdwdb.f_task_sla c
on src.sys_id=c.row_id and src.sourceinstance=c.source_id
where TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.business_duration)<>c.business_duration_c
)c		
