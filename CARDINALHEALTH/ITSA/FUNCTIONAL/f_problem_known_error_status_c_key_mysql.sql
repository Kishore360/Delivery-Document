SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.problem_final a
join cardinalhealth_mdwdb.f_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdwdb.d_lov c
on c.row_id=COALESCE( CONCAT('KNOWN_ERROR_C','~','PROBLEM','~','~','~',UPPER(a.u_known_error_status)),'UNSPECIFIED')
and a.sourceinstance=c.source_id
where c.row_key<>b.known_error_status_c_key;