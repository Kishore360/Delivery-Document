SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_hdi_survey_response_c.alertsent_flag' ELSE 'SUCCESS' END as Message
FROM (  
SELECT Count(1) as CNT 
FROM nypres_mdsdb.us_custom_survey_response_final SRC 
JOIN nypres_mdwdb.d_hdi_survey_response_c TRGT 
-- The Join will be on src.row_id = trgt.row_id , this is correct join. 
ON (SRC.row_id = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE  (CASE WHEN SRC.alert=1 THEN 'Y' ELSE 'N' END )<>TRGT.alertsent_flag
 )a;
 
 