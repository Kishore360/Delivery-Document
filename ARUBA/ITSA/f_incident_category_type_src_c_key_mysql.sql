SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aruba_mdsdb.incident_final a
join aruba_mdwdb.f_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join aruba_mdsdb.u_category_sla_final d ON a.u_category  = d.sys_id
left join aruba_mdwdb.d_lov c
on c.src_rowid=case when b.category_type_src_code_c is null then 'UNSPECIFIED' else upper(CONCAT('U_CATEGORY_TYPE~U_CATEGORY_SLA','~','','~','','~',COALESCE(b.category_type_src_code_c,''))) end
where coalesce(c.row_key,-1)<>b.category_type_src_c_key;