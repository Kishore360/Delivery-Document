<<<<<<< HEAD
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from
rogersdev_mdwdb.d_configuration_item a
left join
rogersdev_mdsdb.cmdb_ci_final ci
on a.row_id=ci.sys_id
left join
rogersdev_mdsdb.cmdb_ci_service_final service
ON ci.sys_id = service.sys_id and ci.sourceinstance= service.sourceinstance
LEFT JOIN rogersdev_mdsdb.cmdb_ci_appl_final appl
ON ci.sys_id = appl.sys_id and ci.sourceinstance= appl.sourceinstance
where COALESCE(service.u_service_name,appl.u_application_name,ci.name,'UNSPECIFIED')<> a.name_c)a
=======
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.name_c' ELSE 'SUCCESS' END as Message 
FROM rogersdev_mdsdb.cmdb_ci_final  SRC 
JOIN rogersdev_mdwdb.d_configuration_item TRGT 
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
and SRC.sys_class_name not in (SELECT sys_class_name from rogersdev_mdsdb.cmdb_ci_appl_final
union select sys_class_name from rogersdev_mdsdb.cmdb_ci_service_final)
 WHERE SRC.name <> TRGT.name_c
>>>>>>> 54d361e3db7741fe3d518a6787e7829f3e895dba
