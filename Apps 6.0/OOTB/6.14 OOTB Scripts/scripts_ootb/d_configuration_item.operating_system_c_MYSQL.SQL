SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.operating_system_c' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT 
FROM  equifax_mdsdb.cmdb_ci_final SRC
LEFT JOIN equifax_mdsdb.cmdb_ci_computer_final SRC1
ON (SRC.sys_id=SRC1.sys_id)
LEFT JOIN equifax_mdwdb.d_configuration_item TRGT
  ON (SRC.sys_id= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where coalesce(SRC1.os,'UNSPECIFIED')<>TRGT.operating_system_c
)temp;