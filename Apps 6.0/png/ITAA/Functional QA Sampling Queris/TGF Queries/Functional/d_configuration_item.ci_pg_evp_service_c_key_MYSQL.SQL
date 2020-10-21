SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.ci_pg_evp_service_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.cmdb_ci_final SRC
JOIN png_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN png_mdwdb.d_lov LKP ON LKP.dimension_class='PG_EVP_SERVICE_C~CMDB_CI' AND SRC.u_pg_evp_service=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.u_pg_evp_service IS NULL THEN 0 ELSE -1 END))<>TRGT.ci_pg_evp_service_c_key

) temp;


 