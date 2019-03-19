SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.ip_address_c' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT 
FROM equifax_mdsdb.cmdb_ci SRC 
LEFT JOIN equifax_mdwdb.configuration_item TRGT
  ON (SRC.sys_id= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where coalesce(SRC.ip_address,'UNSPECIFIED')<>TRGT.ip_address_c
)temp;