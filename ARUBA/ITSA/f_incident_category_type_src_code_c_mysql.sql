SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aruba_mdsdb.incident_final a
left join aruba_mdwdb.f_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join aruba_mdsdb.u_category_sla_final c 
ON a.u_category  = c.sys_id
where b.category_type_src_code_c<>c.u_category_type;