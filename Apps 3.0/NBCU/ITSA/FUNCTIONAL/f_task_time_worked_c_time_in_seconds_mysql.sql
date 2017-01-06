
							
							SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

nbcu_mdsdb.task_time_worked_final a
join nbcu_mdwdb.f_task_time_worked_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.time_in_seconds  <> b.time_in_seconds;


						
									
									
									
									
									
										