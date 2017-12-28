SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_hdi_survey_response_c.LangHint' ELSE 'SUCCESS' END as Message
FROM (  
SELECT Count(1) as CNT 
FROM nypres_mdsdb.us_custom_survey_response_final SRC 
-- The Join will be on src.row_id = trgt.row_id , this is correct join. 
JOIN nypres_mdwdb.d_hdi_survey_response_c TRGT 
ON (SRC.row_id = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.LangHint,'UNSPECIFIED')<>TRGT.LangHint
 )a;
 
 