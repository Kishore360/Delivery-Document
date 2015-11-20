SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

ucsf_mdsdb.incident_final a
join ucsf_mdwdb.f_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join ucsf_mdwdb.d_configuration_item c
on c.row_id=coalesce(a.cmdb_ci,'UNSPECIFIED') and a.sourceinstance=c.source_id
where c.row_key<>business_service_c_key;
