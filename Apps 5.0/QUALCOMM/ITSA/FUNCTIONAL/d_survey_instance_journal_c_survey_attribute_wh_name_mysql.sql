SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_instance_journal_c.survey_attribute_wh_name' ELSE 'SUCCESS' END as Message
FROM 	qualcomm_mdsdb.sys_journal_field_final SRC
JOIN	qualcomm_mdwdb.d_survey_instance_journal_c TRGT 
	 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE SRC.element<> TRGT.survey_attribute_wh_name
AND SRC.element = 'u_comments' 
 AND SRC.name = 'asmt_assessment_instance'; 