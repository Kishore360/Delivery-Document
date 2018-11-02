SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
paloalto_mdsdb.incident_final a
left join paloalto_mdwdb.f_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.u_emailsent<>b.email_sent_c;