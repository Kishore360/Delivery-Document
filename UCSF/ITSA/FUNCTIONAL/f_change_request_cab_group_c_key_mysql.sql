SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

ucsf_mdsdb.change_request_final a
join ucsf_mdwdb.f_change_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join ucsf_mdwdb.d_internal_organization c
on c.row_id= case when coalesce(a.u_cab_group,'UNSPECIFIED')='UNSPECIFIED' then 'UNSPECIFIED' else concat('GROUP~',a.u_cab_group) end and a.sourceinstance=c.source_id
where c.row_key<>b.cab_group_c_key;