
 
 SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_survey_instance.survey_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
 FROM meritsa_mdsdb.asmt_assessment_instance_final SRC 
 LEFT JOIN meritsa_mdwdb.d_survey_instance TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) and SRC.cdctype<>'D'
  WHERE coalesce(SRC.number,'UNSPECIFIED') <> TRGT.survey_instance_number_c
 )temp;
 

 
 