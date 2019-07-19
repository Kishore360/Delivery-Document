




SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_response_ext_c.survey_question_ext_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.us_survey_response_score_final SRC 
LEFT JOIN png_mdwdb.f_response_ext_c TRGT ON 
(SHA2(CONCAT(COALESCE(SRC.period,'UNSPECIFIED'),COALESCE(SRC.Score,'UNSPECIFIED'),COALESCE(SRC.Account,'UNSPECIFIED'),
COALESCE(SRC.Assessor_Role,'UNSPECIFIED'),COALESCE(SRC.Holding_Company,'UNSPECIFIED'),COALESCE(SRC.Short_Name,'UNSPECIFIED'),
COALESCE(SRC.Question_Type,'UNSPECIFIED'),COALESCE(SRC.Category,'UNSPECIFIED'),COALESCE(SRC.Question,'UNSPECIFIED')
),256 )=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN png_mdwdb.d_survey_question_ext_c LKP ON 
(SHA2(CONCAT(
COALESCE(SRC.Category,'UNSPECIIFED'),
COALESCE(SRC.Question,'UNSPECIFIED')),256))=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE 
COALESCE(LKP.row_key,CASE WHEN COALESCE(SRC.Category,SRC.Question) IS NULL THEN 0 ELSE -1 END)<>TRGT.survey_question_ext_c_key

) temp;


