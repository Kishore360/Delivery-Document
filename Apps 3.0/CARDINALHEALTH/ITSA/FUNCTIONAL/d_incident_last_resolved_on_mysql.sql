SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from cardinalhealth_mdsdb.incident_final a
join cardinalhealth_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where  CONVERT_TZ(a.u_resolved_at,'GMT','America/New_York')<>b.last_resolved_on;