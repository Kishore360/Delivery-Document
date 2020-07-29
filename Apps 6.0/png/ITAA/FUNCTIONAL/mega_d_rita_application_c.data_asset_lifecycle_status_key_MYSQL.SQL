SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.data_asset_lifecycle_status_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id AND SRC.cdctype='X'
JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('OT_LIFE_CYCLE_STATUS_C','~','PROCESSING_ACTIVITIES','~',upper(SRC.install_status)),'UNSPECIFIED')=LKP.row_id 
AND AND LKP.source_id='2'
WHERE COALESCE(LKP.row_key,CASE WHEN upper(SRC.install_status) IS NULL THEN 0 ELSE -1 END)<>TRGT.data_asset_lifecycle_status_key
) temp;


