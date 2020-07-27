SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.hosting_category_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_rita_application_ext_c TRGT1 ON TRGT.rita_application_ext_c_key=TRGT1.row_key
JOIN png_mdwdb.d_lov LKP ON COALESCE(CONCAT('HOSTING_CATEGORY~RITA_APPLICATION~',SRC.u_pg_hosting),'UNSPECIFIED')=LKP.row_id AND LKP.source_id = 2
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.u_pg_hosting IS NULL THEN 0 ELSE -1 END)<>TRGT1.hosting_category_c_key
AND SRC.cdctype='X'
) temp;


 