SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
cardinalhealth_mdsdb.problem_final a
join cardinalhealth_mdwdb.d_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.justified_c_flag <> CASE WHEN a.u_justified = 1 THEN  'Y' ELSE 'N' END)a;
