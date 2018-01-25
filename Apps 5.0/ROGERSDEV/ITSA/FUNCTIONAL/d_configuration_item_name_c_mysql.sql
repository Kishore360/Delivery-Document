SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.name_c' ELSE 'SUCCESS' END as Message 
FROM rogersdev_mdsdb.cmdb_ci_final  SRC 
JOIN rogersdev_mdwdb.d_configuration_item TRGT 
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
and SRC.sys_class_name not in (SELECT sys_class_name from rogersdev_mdsdb.cmdb_ci_appl_final
union select sys_class_name from rogersdev_mdsdb.cmdb_ci_service_final)
 WHERE SRC.name <> TRGT.name_c