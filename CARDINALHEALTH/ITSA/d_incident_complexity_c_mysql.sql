SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.u_complexity_final a
left join cardinalhealth_mdwdb.d_incident b
on a.sys_id=b.row_id and b.source_id=a.sourceinstance
where b.complexity_c<>a.u_value;
