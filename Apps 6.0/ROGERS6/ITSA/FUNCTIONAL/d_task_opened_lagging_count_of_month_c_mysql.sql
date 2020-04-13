select CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_task.opened_lagging_count_of_month_c' ELSE 'SUCCESS' END as Message from
(select distinct date_format((case when t.sys_class_name in ('incident','problem') then convert_tz(t.opened_at,'GMT','America/New_York')
when t.sys_class_name='change_request' then convert_tz(coalesce(c.work_start,c.start_date),'GMT','America/New_York') end),'%Y%m%d') as date_key
,t.sys_id,t.sourceinstance
from (select sys_id,sourceinstance,sys_class_name,opened_at from rogersdev6_mdsdb.task_final where cdctype<>'D' and
sys_class_name in ('incident','problem','change_request')) t
left join rogersdev6_mdsdb.change_request_final c on t.sys_id=c.sys_id and t.sourceinstance=c.sourceinstance) a
join rogersdev6_mdwdb.d_task d on a.sys_id=d.row_id and a.sourceinstance=d.source_id
join rogersdev6_mdwdb.d_calendar_date dc on a.date_key=dc.row_key where dc.lagging_count_of_month<>d.opened_lagging_count_of_month_c;