

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.gdpr_relevant_calculated_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN png_mdsdb.pg_mega_pgb_app_keyword_final SRC1 ON SRC.u_pg_source_system_id=SRC1.APP_HEXID AND SRC.sourceinstance=SRC1.sourceinstance 
LEFT JOIN  png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
IF ((SRC.u_pg_volume_records_eu) = '0' OR (SRC.u_pg_volume_records_eu) IS NULL OR ((SRC.u_pg_volume_records_eu) = '' ),'N','Y')<>TRGT.gdpr_relevant_calculated_flag
AND SRC.cdctype<>'D' AND SRC1.cdctype<>'D'
) temp;




