 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_question.survey_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.survey_question_new_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_survey_question TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_survey LKP 
 ON ( SRC.master= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.master IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.survey_key,'')
