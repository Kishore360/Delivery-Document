SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.problem_final a
join cardinalhealth_mdwdb.f_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdwdb.d_internal_contact c
on  COALESCE(CONCAT('INTERNAL_CONTACT','~',a.u_problem_manager),'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
where COALESCE(c.row_key,CASE WHEN a.u_problem_manager IS NULL THEN 0 else -1 end)<>b.problem_manager_c_key;