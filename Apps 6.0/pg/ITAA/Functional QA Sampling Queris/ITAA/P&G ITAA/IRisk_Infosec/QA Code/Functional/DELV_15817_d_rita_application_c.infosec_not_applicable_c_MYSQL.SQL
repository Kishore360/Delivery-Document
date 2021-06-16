

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.infosec_not_applicable_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC  
LEFT JOIN png_mdsdb.pg_mega_excluded_apps_final SRC1  ON SRC.NAME=SRC1.megaid AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype<>'D'
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.infosec_not_applicable,'UNSPECIFIED')<>TRGT.infosec_not_applicable_c
AND SRC1.megaid IS NOT NULL
AND SRC.cdctype<>'D' 
)temp;




