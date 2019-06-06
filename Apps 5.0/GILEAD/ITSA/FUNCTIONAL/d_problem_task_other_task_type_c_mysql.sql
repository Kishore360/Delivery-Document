select case when count(1) then 'FAILURE' else 'SUCCESS' end as RESULT,
case when count(1) then 'Data Mismatch' else 'SUCCESS' end as Message
from ( select a.sys_id,b.row_id,a.sourceinstance,b.source_id,a.u_other_task_type,b.other_task_type_c 
from gilead_mdsdb.problem_task_final a
join gilead_mdwdb.d_problem_task b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where coalesce(a.u_other_task_type,'UNSPECIFIED')<>b.other_task_type_c
and b.soft_deleted_flag='N')a;