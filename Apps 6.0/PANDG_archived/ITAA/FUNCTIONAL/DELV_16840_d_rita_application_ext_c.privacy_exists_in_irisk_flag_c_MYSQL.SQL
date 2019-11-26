SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.privacy_exists_in_irisk_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final SRC1 ON SRC.NAME=SRC1.MEGA_HEX_ID AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_rita_application_ext_c x ON TRGT.rita_application_ext_c_key=x.row_key
WHERE (CASE WHEN SRC1.MEGA_HEX_ID IS NOT NULL THEN 'Y' ELSE 'N' END)<>x.privacy_exists_in_irisk_flag_c
AND SRC.cdctype='X'
) temp;



