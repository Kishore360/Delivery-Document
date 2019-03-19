SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.ci_change_control_c_key' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT
FROM  nbcu_mdsdb.cmdb_ci_final SRC
LEFT JOIN nbcu_mdwdb.d_internal_organization  SRC1 
ON (coalesce(concat('GROUP','~',SRC.change_control),'UNSPECIFIED')=SRC1.row_id AND SRC.sourceinstance=SRC1.source_id)
JOIN nbcu_mdwdb.d_configuration_item TRGT
  ON (SRC.sys_id= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)and TRGT.soft_deleted_flag <>'Y'
 WHERE COALESCE(SRC1.row_key, CASE WHEN SRC.change_control IS NULL THEN 0 ELSE -1 END)
  <>TRGT.ci_change_control_c_key
)temp;

