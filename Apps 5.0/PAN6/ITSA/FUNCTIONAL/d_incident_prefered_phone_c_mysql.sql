SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
pan6_mdsdb.incident_final a
left join pan6_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.u_prefered_phone<>b.prefered_phone_c;