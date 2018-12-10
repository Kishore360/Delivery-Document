SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_survey_question_ext_c.question_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM pandg_mdsdb.us_survey_response_score_final SRC
LEFT JOIN pandg_mdwdb.d_survey_question_ext_c TRGT ON 
SHA2(COALESCE(SRC.Category,'UNSPECIFIED'),256)=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.Category,'UNSPECIFIED')<>TRGT.question_name
) temp;



