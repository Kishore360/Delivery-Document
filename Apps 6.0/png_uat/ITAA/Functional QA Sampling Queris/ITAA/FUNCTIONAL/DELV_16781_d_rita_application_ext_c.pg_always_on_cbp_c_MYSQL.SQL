SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.pg_always_on_cbp_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN  png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT1 ON TRGT.rita_application_ext_c_key=TRGT1.row_key
WHERE 
SRC.u_pg_business_criticality <>TRGT1.pg_always_on_cbp_c
AND SRC.cdctype='X'
) temp;




  
