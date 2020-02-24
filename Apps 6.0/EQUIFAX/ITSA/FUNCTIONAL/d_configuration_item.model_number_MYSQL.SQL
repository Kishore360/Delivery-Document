SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END
 as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.model_number' 
ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT 
FROM equifax_mdsdb.cmdb_ci_final SRC
 
LEFT JOIN equifax_mdwdb.d_configuration_item TRGT
  ON (SRC.sys_id= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 

where 
coalesce(SRC.model_number,'UNSPECIFIED')<>TRGT.model_number and SRC.cdctype<>'D'
)temp;
