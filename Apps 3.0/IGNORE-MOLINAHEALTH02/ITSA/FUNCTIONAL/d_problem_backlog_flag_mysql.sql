SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

molinahealth_mdsdb.problem_final a
join molinahealth02_mdwdb.d_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.backlog_flag<> case when a.problem_state='1' then 'Y' else 'N' end;






