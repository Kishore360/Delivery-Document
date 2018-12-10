




SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_survey_ext_c.survey_source_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM pandg_mdsdb.us_survey_response_score_final SRC
LEFT JOIN pandg_mdwdb.d_survey_ext_c TRGT ON (COALESCE(SRC.Question_Type)=TRGT.row_id AND (SRC.sourceinstance)=TRGT.source_id)
WHERE 
CASE WHEN SRC.Question_Type LIKE '%SPMS%' THEN 'SPMS' 
WHEN SRC.Question_Type LIKE '%SOBR%' THEN 'SOBR' ELSE 'AM' END <>TRGT.survey_source_name
) temp;



