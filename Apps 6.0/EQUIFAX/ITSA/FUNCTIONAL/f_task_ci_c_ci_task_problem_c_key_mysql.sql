SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_task_ci_c.ci_task_problem_c_key' 
ELSE 'MDS to DWH data validation passed for f_task_ci_c.ci_task_problem_c_key' END as Message from 
(select count(1) cnt 
from
equifax_mdsdb.task_ci_final a
join
equifax_mdwdb.f_task_ci_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
join
equifax_mdwdb.d_problem c
on COALESCE(a.task,'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
where  coalesce(c.row_key,case when a.task is null then 0 else -1 end ) <> b.ci_task_problem_c_key and a.cdctype<>'D')b