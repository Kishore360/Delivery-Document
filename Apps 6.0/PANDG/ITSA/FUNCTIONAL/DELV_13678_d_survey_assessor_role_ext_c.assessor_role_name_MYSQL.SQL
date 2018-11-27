



SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_survey_assessor_role_ext_c.assessor_role_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM pandg_mdsdb.us_survey_response_score_final SRC
LEFT JOIN pandg_mdwdb.d_survey_assessor_role_ext_c TRGT ON (COALESCE(SRC.Assessor_Role,'UNSPECIFIED')=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.Assessor_Role,'UNSPECIFIED')<>TRGT.assessor_role_name

) temp;
