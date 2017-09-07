SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_ksr_c.template_name' else 'SUCCESS' end as message
FROM STM_BMC_mdsdb.KS_SRV_CustomerSurvey_base_final SRC
JOIN STM_BMC_mdwdb.d_ksr_c TRGT ON SRC.CustomerSurveyID  =  TRGT.row_id and  SRC.sourceinstance = TRGT.source_id  
WHERE coalesce(SRC.survey_template_name,'UNSPECIFIED') <> (TRGT.template_name)
