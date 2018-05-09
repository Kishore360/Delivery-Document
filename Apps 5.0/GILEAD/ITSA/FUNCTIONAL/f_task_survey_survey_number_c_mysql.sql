SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_survey.survey_number_c' ELSE 'SUCCESS' END as Message
FROM gilead_mdsdb.asmt_assessment_instance_final SRC 
 LEFT JOIN gilead_mdwdb.f_task_survey TRGT 
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
WHERE SRC.number <> TRGT.survey_number_c;


