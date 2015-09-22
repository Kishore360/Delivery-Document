SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aaa_mdsdb.incident_final a
left join aaa_mdwdb.f_incident b
on a.sys_id=b.row_id and
a.sourceinstance=b.source_id
left join aaa_mdwdb.d_internal_organization c
on concat('SUBSIDIARY~',a.vendor)=c.row_id
where b.vendor_c_key<>c.row_key;