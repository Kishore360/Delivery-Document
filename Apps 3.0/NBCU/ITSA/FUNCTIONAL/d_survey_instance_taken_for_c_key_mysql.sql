SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_instance.taken_for_c_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdsdb.survey_instance_final SRC
 LEFT JOIN nbcu_mdwdb.d_survey_instance TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN nbcu_mdwdb.d_internal_contact LKP 
 ON ( COALESCE(concat('INTERNAL_CONTACT~',SRC.u_taken_for),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_taken_for IS NULL THEN 0 else -1 end)<>TRGT.taken_for_c_key





