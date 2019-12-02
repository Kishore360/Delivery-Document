SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.exists_in_irisk_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdsdb.pg_mega_irisk_assessment_issues_final SRC1 ON SRC.NAME=SRC1.MEGA_HEX_ID AND SRC.sourceinstance=SRC1.sourceinstance and SRC1.cdctype<>'D'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE (CASE WHEN SRC1.MEGA_HEX_ID IS NOT NULL THEN 'Y' ELSE 'N' END)<>TRGT.exists_in_irisk_flag_c
AND SRC.cdctype<>'D' 
) temp;



