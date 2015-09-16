SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.problem_final a
join cardinalhealth_mdwdb.d_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.u_causal_code<>b.causal_code_c;