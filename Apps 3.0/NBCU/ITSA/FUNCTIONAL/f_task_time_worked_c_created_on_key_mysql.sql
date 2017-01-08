SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

nbcu_mdsdb.task_time_worked_final a
left join nbcu_mdwdb.d_calendar_date d on DATE_FORMAT(CONVERT_TZ(a.sys_created_on,'GMT','America/New_York'),'%Y%m%d') =d.row_id 
join nbcu_mdwdb.f_task_time_worked_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where created_on_key<>coalesce(d.row_key,case when a.sys_created_on is null then 0 else -1 end ) 

									
									