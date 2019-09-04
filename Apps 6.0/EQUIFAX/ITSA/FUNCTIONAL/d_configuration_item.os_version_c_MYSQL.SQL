SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.os_version_c' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT 
FROM equifax_mdsdb.cmdb_ci_final SRC 
LEFT JOIN equifax_mdsdb.cmdb_ci_server_final SRC1
ON (SRC.sys_id=SRC1.sys_id and SRC.sourceinstance = SRC1.sourceinstance)
LEFT JOIN equifax_mdsdb.cmdb_ci_computer_final SRC2
ON SRC.sys_id=SRC2.sys_id and SRC.sourceinstance = SRC2.sourceinstance
LEFT JOIN equifax_mdwdb.d_configuration_item TRGT
  ON (SRC1.sys_id= TRGT.row_id AND SRC1.sourceinstance=TRGT.source_id)
where coalesce(SRC2.os_version,SRC1.os_version,'UNSPECIFIED')<>TRGT.os_version_c
)temp;