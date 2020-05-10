
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_answer_iyl_c.answer_position_c' ELSE 'SUCCESS' END as Message 
 
FROM png_mdsdb.us_survey_answer_c_final  SRC 
JOIN png_mdwdb.d_answer_iyl_c TRGT ON 
(SRC.answer_id= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 

WHERE SRC.answer_position   <> (TRGT.answer_position_c) and TRGT.soft_deleted_flag ='N'
and SRC.answer_type <> 'rows' 