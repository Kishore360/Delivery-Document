
 
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.gbl_department_name_c' ELSE 'SUCCESS' END as MESSAGE
FROM 
(
SELECT count(1) as cnt
FROM 
(select * from mcdonalds_mdsdb.sc_req_item_final where cdctype<>'D') b 
LEFT JOIN mcdonalds_mdsdb.sys_user_final c
ON b.opened_by = c.sys_id and b.sourceinstance = c.sourceinstance
LEFT JOIN mcdonalds_mdsdb.u_gbl_final d
on c.u_gbl = d.sys_id and b.sourceinstance = d.sourceinstance
left join mcdonalds_mdwdb.d_gbl_c e on sys_id=row_id and e.source_id=d.sourceinstance
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) 
f1 on (f1.source_id = b.sourceinstance)
left join mcdonalds_mdwdb.d_internal_contact a on c.sys_id=a.row_id and c.source_id=d.sourceinstance
where (b.cdctime<=f1.lastupdated) and  e.row_key <> a.gbl_c_key
)a;


