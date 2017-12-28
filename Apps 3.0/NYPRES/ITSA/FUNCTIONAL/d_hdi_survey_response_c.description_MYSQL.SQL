
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_hdi_survey_response_c.description' ELSE 'SUCCESS' END as Message
FROM (  
SELECT Count(1) as CNT 
FROM nypres_mdsdb.us_custom_survey_response_final SRC 
JOIN nypres_mdsdb.incident_final SRC1 ON SRC.row_id=SRC1.number
JOIN nypres_mdwdb.d_hdi_survey_response_c TRGT ON SRC1.number=TRGT.row_id and SRC1.sourceinstance=TRGT.source_id
Where (SRC.description)<>TRGT.description
)a;


