 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aaa_mdsdb.incident_final a
left join aaa_mdwdb.f_incident b
on a.sys_id=b.row_id
and a.sourceinstance=b.source_id
where a.u_substate<>b.substate_src_code_c;