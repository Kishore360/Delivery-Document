SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for cmdb_ci_service_final.u_service_id' ELSE 'SUCCESS' END as Message 
FROM rogersdev_mdsdb.cmdb_ci_service_final  SRC 
JOIN rogersdev_mdwdb.d_configuration_item TRGT 
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
 WHERE SRC.u_service_id <> TRGT.id_c