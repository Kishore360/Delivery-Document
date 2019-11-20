SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.data_retention_status_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
join png_mdsdb.pg_mega_pgb_application_rita_final pgb_application_rita
on SRC.u_pg_source_system_id=pgb_application_rita.name and SRC.sourceinstance=pgb_application_rita.sourceinstance
JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('OT_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',IF(pgb_application_rita.DATA_RETENTION_STATUS IS NOT NULL AND pgb_application_rita.DATA_RETENTION_STATUS <> '',pgb_application_rita.DATA_RETENTION_STATUS,NULL)),'UNSPECIFIED')=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN upper(pgb_application_rita.DATA_RETENTION_STATUS) IS NULL THEN 0 ELSE -1 END)<>TRGT.data_retention_status_c_key
AND SRC.cdctype='X' and pgb_application_rita.cdctype='X'
) temp;


