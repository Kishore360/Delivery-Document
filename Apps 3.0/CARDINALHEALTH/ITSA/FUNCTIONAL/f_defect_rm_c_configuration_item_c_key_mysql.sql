SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task.configuration_item_c_key' ELSE 'SUCCESS' END as Message  
FROM (SELECT count(1) as CNT 
FROM   cardinalhealth_mdwdb.f_defect_rm_c TRGT
JOIN cardinalhealth_mdsdb.rm_defect_final SRC 
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  
JOIN cardinalhealth_mdwdb.d_configuration_item LKP 
ON LKP.row_id = SRC.cmdb_ci AND LKP.source_id = SRC.sourceinstance
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 ELSE -1 END)<>TRGT.configuration_item_c_key)temp;
