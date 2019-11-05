SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_efx_application_c.prod_data_used_in_non_prod_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM equifax_mdsdb.u_efx_application_final SRC 
LEFT JOIN equifax_mdwdb.d_efx_application_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE case when SRC.u_is_production_data_will_be_used_in_a_non_production_envir_0141= 1 then 'Y' 
else 'N' end <> prod_data_used_in_non_prod_flag
AND SRC.cdctype='X' ) temp; 