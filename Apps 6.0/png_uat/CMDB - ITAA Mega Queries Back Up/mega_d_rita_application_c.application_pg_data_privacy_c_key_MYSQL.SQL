SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.application_pg_data_privacy_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('APPLICATION_PG_DATA_PRIVACY_C~RITA_APPLICATION~',upper(COALESCE(SRC.PG_DATA_PRIVACY,'No PII Data'))),'UNSPECIFIED')=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN upper(SRC.PG_DATA_PRIVACY) IS NULL THEN 0 ELSE -1 END)<>TRGT.application_pg_data_privacy_c_key
AND SRC.cdctype='X'
) temp;




 
  