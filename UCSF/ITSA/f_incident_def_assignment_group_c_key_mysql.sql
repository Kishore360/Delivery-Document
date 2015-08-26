SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
ucsf_mdsdb.incident_final a
join ucsf_mdsdb.sys_user_final b
on b.sys_id=a.opened_by and a.sourceinstance=b.sourceinstance
left join ucsf_mdwdb.f_incident c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
left join ucsf_mdwdb.d_internal_organization d
on d.row_id=case when coalesce(b.u_default_group,'UNSPECIFIED')='UNSPECIFIED' then 'UNSPECIFIED' else concat('GROUP~',b.u_default_group)end
and d.source_id=b.sourceinstance where d.row_key<>c.def_assignment_group_c_key;