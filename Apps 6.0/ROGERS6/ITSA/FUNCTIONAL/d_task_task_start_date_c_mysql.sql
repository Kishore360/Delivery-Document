select CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_task.task_start_date_c' ELSE 'SUCCESS' END as Message
from (select sys_id,sourceinstance,sys_class_name,opened_at from rogersdev6_mdsdb.task_final where cdctype<>'D' and
sys_class_name in ('incident','problem','change_request')) t
join rogersdev6_mdwdb.d_task d on t.sys_id=d.row_id and t.sourceinstance=d.source_id
left join rogersdev6_mdsdb.change_request_final c on t.sys_id=c.sys_id and t.sourceinstance=c.sourceinstance
where (case when t.sys_class_name in ('incident','problem') then convert_tz(t.opened_at,'GMT','America/New_York')
when t.sys_class_name='change_request' then convert_tz(coalesce(c.work_start,c.start_date),'GMT','America/New_York') end) <> d.task_start_date_c
;