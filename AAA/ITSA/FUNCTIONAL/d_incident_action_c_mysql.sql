SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aaa_mdsdb.incident_final a
left join aaa_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join aaa_mdsdb.u_ci_action_final c
on c.sys_id=a.u_action and c.sourceinstance=a.sourceinstance
where b.action_c<>coalesce(c.u_name,'No name found');
