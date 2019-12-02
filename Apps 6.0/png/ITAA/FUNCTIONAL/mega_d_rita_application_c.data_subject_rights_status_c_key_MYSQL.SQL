SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.data_subject_rights_status_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
join png_mdsdb.pg_mega_pgb_application_rita_final pg_mega_pgb_application_rita
on SRC.u_pg_source_system_id=pg_mega_pgb_application_rita.name and SRC.sourceinstance=pg_mega_pgb_application_rita.sourceinstance
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('OT_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',IF(pg_mega_pgb_application_rita.DATA_SUBJ_RIGHTS_STATUS IS NOT NULL AND pg_mega_pgb_application_rita.DATA_SUBJ_RIGHTS_STATUS<> '',pg_mega_pgb_application_rita.DATA_SUBJ_RIGHTS_STATUS,NULL)),'UNSPECIFIED')=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN upper(pg_mega_pgb_application_rita.DATA_SUBJ_RIGHTS_STATUS) IS NULL THEN 0 ELSE -1 END)<>TRGT.data_subject_rights_status_c_key
AND SRC.cdctype='X' and pg_mega_pgb_application_rita.cdctype='X'
) temp;


