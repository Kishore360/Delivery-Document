SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.country_c' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT 
FROM equifax_mdsdb.cmdb_ci_final SRC 
LEFT JOIN equifax_mdwdb.d_configuration_item TRGT
  ON (SRC.sys_id= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where coalesce(SRC.u_efx_country,'UNSPECIFIED')<>TRGT.country_c and SRC.cdctype<>'D'
)temp;