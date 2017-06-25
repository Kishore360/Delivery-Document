SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from nypres_mdsdb.problem_final a
join nypres_mdwdb.f_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join nypres_mdwdb.d_change_request c
on a.u_caused_by_change=c.row_id and a.sourceinstance=c.source_id
where coalesce(c.row_key,case when u_caused_by_change is null then 0 else -1 end) <>b.caused_by_change_c_key;

