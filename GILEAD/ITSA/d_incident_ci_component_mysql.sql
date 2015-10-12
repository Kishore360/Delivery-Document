SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

gilead_mdsdb.incident_final a
left join gilead_mdsdb.u_ci_component c on a.u_ci_component=c.sys_id
left join gilead_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where c.u_name<>b.ci_component_c;