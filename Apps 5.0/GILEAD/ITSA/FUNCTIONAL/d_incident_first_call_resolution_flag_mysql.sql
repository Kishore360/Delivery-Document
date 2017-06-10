SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

gilead_mdsdb.incident_final a
join gilead_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.first_call_resolution_flag<> case when a.u_first_call_resolution=1 then 'Y' else 'N' end;