SELECT CASE WHEN a.cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN a.cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM (select count(1) from aon_mdsdb.cmdb_ci_final src 
left join aon_mdwdb.d_configuration_item trgt ON trgt.row_id = src.sys_id AND trgt.source_id = src.sourceinstance
join aon_mdsdb.cmdb_ci_service_final u_cmdb_ci_application_service 
ON src.sys_id=u_cmdb_ci_application_service.sys_id and u_cmdb_ci_application_service.sourceinstance = src.sourceinstance
LEFT OUTER JOIN
aon_mdsdb.u_business_unit_lookup_final u_business_unit_lookup 
ON u_cmdb_ci_application_service.u_business_unit = u_business_unit_lookup.sys_id 
AND u_cmdb_ci_application_service.sourceinstance = u_business_unit_lookup.sourceinstance 
where trgt.business_unit_c <> COALESCE(u_business_unit_lookup.u_bu,'UNSPECIFIED'))a