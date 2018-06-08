
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from
rogersdev_mdsdb.cmdb_ci_final ci
left join
rogersdev_mdsdb.cmdb_ci_service_final service
ON ci.sys_id = service.sys_id and ci.sourceinstance= service.sourceinstance
LEFT JOIN rogersdev_mdsdb.cmdb_ci_appl_final appl
ON ci.sys_id = appl.sys_id and ci.sourceinstance= appl.sourceinstance
left join
rogersdev_mdwdb.d_configuration_item a
on a.row_id=ci.sys_id
where COALESCE(service.u_service_name,appl.u_application_name,ci.name,'UNSPECIFIED')<> a.name_c)a
