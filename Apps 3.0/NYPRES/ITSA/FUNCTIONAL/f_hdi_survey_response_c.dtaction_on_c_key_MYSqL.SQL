SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_hdi_survey_response_c.dtaction_on_c_key' ELSE 'SUCCESS' END as Message
FROM (  
SELECT Count(1) as CNT 
FROM nypres_mdsdb.us_custom_survey_response_final SRC
-- The Join will be on src.row_id = trgt.row_id , this is correct join. 
JOIN nypres_mdwdb.f_hdi_survey_response_c TRGT ON (SRC.row_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
JOIN nypres_mdwdb.d_calendar_date LKP ON 
COALESCE(DATE_FORMAT(CONVERT_TZ(STR_TO_DATE(SRC.completed,'%c/%e/%Y %r'),'US/Central','America/New_York'),'%Y%m%d'),'UNSPECIFIED')=LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.completed is NULL THEN 0 ELSE -1 END)<>TRGT.dtaction_on_c_key
 )a;
 
 