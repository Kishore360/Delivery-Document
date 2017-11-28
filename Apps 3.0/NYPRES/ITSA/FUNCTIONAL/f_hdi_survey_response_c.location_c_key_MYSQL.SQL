SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_hdi_survey_response_c.location_c_key' ELSE 'SUCCESS' END as Message
FROM (  
SELECT Count(1) as CNT
FROM nypres_mdsdb.us_custom_survey_response_final SRC 
JOIN nypres_mdsdb.incident_final SRC1 ON SRC.row_id=SRC1.number
JOIN nypres_mdwdb.f_hdi_survey_response_c TRGT ON SRC1.number=TRGT.row_id and SRC1.sourceinstance=TRGT.source_id
JOIN nypres_mdwdb.d_location LKP ON (COALESCE(SRC1.location,'UNSPECIFIED')=LKP.row_id AND SRC1.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key, CASE WHEN SRC1.location IS NULL THEN 0 ELSE -1 END)<>TRGT.location_c_key
)a;

