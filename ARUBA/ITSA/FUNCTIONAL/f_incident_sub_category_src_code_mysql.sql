SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.short_description' ELSE 'SUCCESS' END as Message
from aruba_mdwdb.f_incident a
join aruba_mdsdb.incident_final b
on a.row_id=b.sys_id and
a.source_id=b.sourceinstance
left join aruba_mdsdb.u_subcategory_sla_final c
on b.u_subcategory=c.sys_id
where a.sub_category_src_code<>c.u_name;