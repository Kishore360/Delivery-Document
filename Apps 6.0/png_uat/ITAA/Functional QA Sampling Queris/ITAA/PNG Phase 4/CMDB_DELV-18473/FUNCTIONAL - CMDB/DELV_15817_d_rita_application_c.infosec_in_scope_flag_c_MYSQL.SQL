

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.infosec_in_scope_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC  
LEFT JOIN png_mdsdb.pg_mega_excluded_apps_final SRC1  ON SRC.NAME=SRC1.megaid AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype<>'D'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(CASE WHEN (SRC.INSTALL_STATUS IN (15,7)) OR (SRC1.megaid IS NOT NULL) THEN 'N' ELSE 'Y' END)<>TRGT.infosec_in_scope_flag_c
AND SRC.cdctype<>'D'
)temp;


