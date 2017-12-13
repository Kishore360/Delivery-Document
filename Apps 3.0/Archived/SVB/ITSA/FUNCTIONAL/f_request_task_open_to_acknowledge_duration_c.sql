 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdsdb.sc_task_final src
join 
svb_mdwdb.f_request_task c
on src.sys_id=c.row_id and src.sourceinstance=c.source_id
where TIMESTAMPDIFF(SECOND,src.opened_at,COALESCE(src.u_acknowledged_at,src.u_assignment_group_changed))<>c.open_to_acknowledge_duration_c
)c		
