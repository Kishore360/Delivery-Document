SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.application_volume_of_records_eu_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id AND SRC.cdctype<>'D'
JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('OT_EU_DATA_STAKEHOLDERS','~','PROCESSING_ACTIVITIES','~',upper(SRC.u_pg_volume_records_eu)),'UNSPECIFIED')=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN upper(SRC.u_pg_volume_records_eu) IS NULL THEN 0 ELSE -1 END)
<>TRGT.application_volume_of_records_eu_c_key
) temp;



   