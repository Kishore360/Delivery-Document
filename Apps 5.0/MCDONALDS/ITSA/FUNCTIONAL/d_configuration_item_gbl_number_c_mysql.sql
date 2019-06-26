
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.gbl_number_c' ELSE 'SUCCESS' END as MESSAGE
FROM 
(
SELECT count(1) as cnt
FROM mcdonalds_mdwdb.d_configuration_item a
join  (select * from mcdonalds_mdsdb.cmdb_ci_final where cdctype<>'D') b on a.row_id=b.sys_id and a.source_id=b.sourceinstance
LEFT JOIN mcdonalds_mdsdb.u_cmdb_ci_application_component_final c
ON b.sys_id = c.sys_id and b.sourceinstance = c.sourceinstance
LEFT JOIN mcdonalds_mdsdb.u_gbl_final d
on c.u_application_gbl = d.sys_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = b.sourceinstance)
where (b.cdctime<=f1.lastupdated) and  a.gbl_number_c <> d.u_gbl
)a;