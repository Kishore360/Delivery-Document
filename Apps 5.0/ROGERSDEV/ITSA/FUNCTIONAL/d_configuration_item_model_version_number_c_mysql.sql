SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.id_c' ELSE 'SUCCESS' END as Message 
FROM rogersdev_mdsdb.cmdb_ci_final  SRC 
JOIN rogersdev_mdwdb.d_configuration_item TRGT 
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
 WHERE COALESCE(SRC.u_model_version_number,'UNSPECIFIED') <> TRGT.model_version_number_c


