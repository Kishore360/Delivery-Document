

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_response_ext_c.response_score' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.us_survey_response_score_final SRC 
LEFT JOIN png_mdwdb.f_response_ext_c TRGT ON 
(SHA2(CONCAT(COALESCE(SRC.period,'UNSPECIFIED'),COALESCE(SRC.Score,'UNSPECIFIED'),COALESCE(SRC.Account,'UNSPECIFIED'),
COALESCE(SRC.Assessor_Role,'UNSPECIFIED'),COALESCE(SRC.Holding_Company,'UNSPECIFIED'),COALESCE(SRC.Short_Name,'UNSPECIFIED'),
COALESCE(SRC.Question_Type,'UNSPECIFIED'),COALESCE(SRC.Category,'UNSPECIFIED'),COALESCE(SRC.Question,'UNSPECIFIED')
),256 )=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.Score,'0')<>TRGT.response_score
) temp; 



