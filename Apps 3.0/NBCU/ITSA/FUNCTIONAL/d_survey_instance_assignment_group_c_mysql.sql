SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_instance.assignment_group_c' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdsdb.survey_instance_final SRC
 LEFT JOIN nbcu_mdwdb.d_survey_instance TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE SRC.u_assignment_group<>TRGT.assignment_group_c;


