SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from cardinalhealth_mdwdb.d_problem d
JOIN cardinalhealth_mdsdb.problem_final i
on d.row_id=i.sys_id and d.source_id=i.sourceinstance
join
cardinalhealth_mdsdb.u_module_final c 
ON c.sys_id=i.u_module AND c.sourceinstance=i.sourceinstance
where c.u_module_name <> d.module_c
;

