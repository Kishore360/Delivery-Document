



SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_survey_company_ext_c.company_name' ELSE 'SUCCESS' END as Message
FROM 
(

SELECT Count(1) as CNT 
FROM png_mdsdb.us_survey_response_score_final SRC
LEFT JOIN png_mdwdb.d_survey_company_ext_c TRGT ON (COALESCE(SRC.Holding_Company,'UNSPECIFIED')=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE (COALESCE(SRC.Holding_Company,'UNSPECIFIED'))
<> TRGT.company_name
) temp;



