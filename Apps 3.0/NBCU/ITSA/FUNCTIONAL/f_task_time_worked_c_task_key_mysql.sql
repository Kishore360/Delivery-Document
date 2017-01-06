SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

nbcu_mdsdb.task_time_worked_final a
left join nbcu_mdwdb.d_task d on a.task =d.row_id and a.sourceinstance=d.source_id
join nbcu_mdwdb.f_task_time_worked_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where task_key<>coalesce(d.row_key,case when a.task is null then 0 else -1 end ) 
and DATE_FORMAT(b.pivot_date, '%Y-%m-%d %H:%i:%s') 
									BETWEEN effective_from AND effective_to
									
									