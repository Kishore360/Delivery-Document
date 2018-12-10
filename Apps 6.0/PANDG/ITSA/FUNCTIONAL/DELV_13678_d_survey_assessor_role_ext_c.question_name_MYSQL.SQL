

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_survey_question_ext_c.question_description' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM 
(SELECT a.Category as Category,a.sourceinstance as Soureinstance,max(Question) as Question 
FROM pandg_mdsdb.us_survey_response_score_final a Where Question is NOT NULL 
group by Category,Soureinstance) SRC 
LEFT JOIN pandg_mdwdb.d_survey_question_ext_c TRGT ON SHA2(COALESCE(SRC.Category,'UNSPECIFIED'),256)=TRGT.row_id AND SRC.Soureinstance=TRGT.source_id
WHERE COALESCE(SRC.Question,'UNSPECIFIED')<>TRGT.question_description

) temp;



