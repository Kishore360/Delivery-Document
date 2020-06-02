SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_survey.asmt_user_c_key' ELSE 'SUCCESS' END as Message
FROM gilead_mdsdb.asmt_assessment_instance_final SRC 
 LEFT JOIN gilead_mdwdb.f_task_survey TRGT 
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN gilead_mdwdb.d_internal_contact LKP  
ON ( coalesce(concat('INTERNAL_CONTACT~',related_id_2),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.related_id_2 IS NULL THEN 0 else -1 end)<> (TRGT.asmt_user_c_key);


