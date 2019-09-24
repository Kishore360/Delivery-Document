SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.id_c' ELSE 'SUCCESS' END as Message 
FROM rogers_mdsdb.cmdb_ci_appl_final  SRC 
JOIN rogers_mdwdb.d_configuration_item TRGT 
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
 WHERE COALESCE(SRC.u_environment,'UNSPECIFIED') <> TRGT.environment_c
and SRC.CDCTYPE='X'

