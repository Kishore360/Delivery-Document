SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_hdi_survey_response_c.Incident_id as Row_id' ELSE 'SUCCESS' END as Message
FROM ( 
select Count(1) as CNT
from nypres_mdsdb.us_custom_survey_response_final SRC 
JOIN nypres_mdsdb.incident_final SRC1 ON SRC.row_id=SRC1.number and SRC.sourceinstance=SRC1.sourceinstance
JOIN nypres_mdwdb.d_hdi_survey_response_c TRGT ON SRC1.number=TRGT.row_id AND SRC1.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.incident_id,'UNSPECIFIED')<>TRGT.row_id
)

 