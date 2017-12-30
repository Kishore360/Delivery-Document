SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_instance_journal_c.survey_instance_key' ELSE 'SUCCESS' END as Message
FROM 	qualcomm_mdsdb.sys_journal_field_final SRC
JOIN	qualcomm_mdwdb.d_survey_instance_journal_c TRGT 
	 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
JOIN	qualcomm_mdwdb.d_survey_instance LKP
ON LKP.row_id =  COALESCE(SRC.element_id,'UNSPECIFIED')  AND LKP.source_id =  SRC.sourceinstance
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.name IS NULL THEN 0 else -1 end)<> TRGT.survey_instance_key
AND SRC.element = 'u_comments' 
 AND SRC.name = 'asmt_assessment_instance'; 