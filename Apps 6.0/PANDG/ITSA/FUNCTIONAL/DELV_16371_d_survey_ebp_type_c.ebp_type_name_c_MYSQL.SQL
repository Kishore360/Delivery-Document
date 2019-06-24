


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_survey_ebp_type_c.ebp_type_name_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM png_mdsdb.us_survey_response_score_final SRC 
LEFT JOIN png_mdwdb.d_survey_ebp_type_c TRGT ON COALESCE(SRC.EBP_Type,'UNSPECIFIED')=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE SRC.EBP_Type<>TRGT.ebp_type_name_c
AND SRC.cdctype<>'D'
) temp;




 