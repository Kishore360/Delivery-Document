
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.exclusion_date_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT 
Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC  
LEFT JOIN png_mdsdb.pg_mega_excluded_apps_final SRC1  ON SRC.NAME=SRC1.megaid AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype<>'D'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.exclusion_date,'')<>TRGT.exclusion_date_c
AND SRC.cdctype<>'D'
) temp;







