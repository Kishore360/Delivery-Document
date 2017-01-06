
												SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from nbcu_mdsdb.task_final a 		
left join 	nbcu_mdwdb.d_problem d  on a.sys_id =d.row_id
join nbcu_mdwdb.f_task_c fs
on fs.row_id=a.sys_id and fs.source_id=a.sourceinstance			
where problem_key<>coalesce(d.row_key,case when sys_id is null then 0 else -1 end  )


