SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
pgi_mdsdb.incident_final a
join pgi_mdwdb.f_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join pgi_mdwdb.d_internal_contact c
on a.sourceinstance=c.source_id
and c.row_id=case when a.closed_by is null then 'UNSPECIFIED' else concat('INTERNAL_CONTACT~',a.closed_by) end
where c.row_key<>b.last_resolved_by_key;