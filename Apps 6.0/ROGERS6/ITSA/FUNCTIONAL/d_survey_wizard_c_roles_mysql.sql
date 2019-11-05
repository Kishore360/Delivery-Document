SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_survey_wizard_c.roles' ELSE 'SUCCESS' END as Message
-- select distinct COALESCE(SRC.roles,'UNSPECIFIED'),TRGT.roles,SRC.cdctype
 FROM rogers6_mdsdb.expert_survey_final  SRC  
JOIN rogers6_mdwdb.d_survey_wizard_c TRGT 
ON SRC.sys_id= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
 WHERE  COALESCE(SRC.roles,'UNSPECIFIED')<>TRGT.roles
and SRC.CDCTYPE='X';