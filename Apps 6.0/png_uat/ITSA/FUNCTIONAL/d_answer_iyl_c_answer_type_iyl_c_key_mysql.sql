
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_answer_iyl_c.answer_type_iyl_c_key' ELSE 'SUCCESS' END as Message 
 
FROM png_mdsdb.us_survey_answer_c_final  SRC 
JOIN png_mdwdb.d_answer_iyl_c TRGT ON 
(SRC.answer_id= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
LEFT JOIN png_mdwdb.d_lov LKP 
ON CONCAT('ANSWER_TYPE_IYL~SURVEY_ANSWER~',SRC.answer_type) =LKP.row_id and SRC.sourceinstance = LKP.source_id
 

WHERE CASE WHEN SRC.answer_type is NULL THEN 0 ELSE COALESCE(LKP.row_key,-1) END   <> (TRGT.answer_type_iyl_c_key) and TRGT.soft_deleted_flag ='N'
and SRC.answer_type <> 'rows' 