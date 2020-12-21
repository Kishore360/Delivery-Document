SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.application_volume_of_records_all_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM pandg_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN pandg_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN pandg_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('OT_VOLUME_OF_RECORDS_C','~','PROCESSING_ACTIVITIES','~',upper(SRC.VOLUME_OF_RECORDS_ALL)),'UNSPECIFIED')=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN upper(SRC.VOLUME_OF_RECORDS_ALL) IS NULL THEN 0 ELSE -1 END)
<>TRGT.application_volume_of_records_all_c_key
) temp;



 
  