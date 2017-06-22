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
where case when src.opened_at>src.due_date then 0 else
		coalesce(timestampdiff(second,src.opened_at,src.due_date),0) end<>c.opened_to_fufilled_duration_c)c		
