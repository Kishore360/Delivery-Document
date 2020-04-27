SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.class' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT
FROM ge_mdsdb.cmdb_ci_final SRC 
JOIN ge_mdsdb.sys_db_object_final LKP 
ON SRC.sys_class_name = LKP.name
LEFT JOIN ge_mdwdb.d_configuration_item TRGT
  ON (SRC.sys_id= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where coalesce(LKP.label,'UNSPECIFIED')<>TRGT.class)temp