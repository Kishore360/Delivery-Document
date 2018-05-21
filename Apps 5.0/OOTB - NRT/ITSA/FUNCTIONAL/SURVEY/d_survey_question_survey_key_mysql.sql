 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_survey_question.survey_key' ELSE 'SUCCESS' END as Message
 FROM(SELECT count(1) as CNT 
 FROM  (select * from <<tenant>>_mdsdb.survey_question_new_final where cdctype<>'D') SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_survey_question TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_survey LKP 
 ON ( SRC.master= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (src.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key,CASE WHEN SRC.master IS NULL THEN 0 else -1 end)<> (TRGT.survey_key)) temp;
 
