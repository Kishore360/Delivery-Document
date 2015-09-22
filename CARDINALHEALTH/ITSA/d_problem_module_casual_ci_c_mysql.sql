SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_problem d
JOIN cardinalhealth_mdsdb.problem_final i ON d.row_id=i.sys_id AND d.source_id=i.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.u_module_final c ON c.sys_id=i.u_module_casual_ci AND c.sourceinstance=i.sourceinstance
where d.module_casual_ci_c <> c.u_module_name;