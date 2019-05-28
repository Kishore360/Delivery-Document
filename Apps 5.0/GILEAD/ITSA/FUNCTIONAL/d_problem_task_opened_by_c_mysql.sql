select case when count(1) then 'FAILURE' else 'SUCCESS' end as RESULT,
case when count(1) then 'Data Mismatch' else 'SUCCESS' end as Message
from ( select a.sys_id,b.row_id,a.sourceinstance,b.source_id,a.opened_by,b.opened_by_c 
from gilead_mdsdb.problem_task_final a
join gilead_mdwdb.d_problem_task b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where coalesce(a.opened_by,'UNSPECIFIED')<>b.opened_by_c
and b.soft_deleted_flag='N')a;