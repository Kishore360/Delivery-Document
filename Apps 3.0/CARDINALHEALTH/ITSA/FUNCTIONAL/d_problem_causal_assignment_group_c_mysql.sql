SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from cardinalhealth_mdwdb.d_problem d
JOIN cardinalhealth_mdsdb.problem_final i
on d.row_id=i.sys_id and d.source_id=i.sourceinstance
where i.u_causal_assignment_group <> d.causal_assignment_group_c
;

