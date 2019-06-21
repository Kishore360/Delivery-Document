
 
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_configuration_item_gbl_department_code_c' ELSE 'SUCCESS' END as MESSAGE
FROM 
(
SELECT count(1) as cnt
FROM mcdonalds_mdwdb.d_configuration_item a
join mcdonalds_mdsdb.cmdb_ci_final b on a.row_id=b.sys_id and a.source_id=b.sourceinstance
LEFT JOIN mcdonalds_mdsdb.u_cmdb_ci_application_component_final c
ON b.sys_id = c.sys_id and b.sourceinstance = c.sourceinstance
LEFT JOIN mcdonalds_mdsdb.u_gbl_final d
on c.u_application_gbl = d.sys_id
WHERE  d.u_department <> a.gbl_department_code_c
)a;
