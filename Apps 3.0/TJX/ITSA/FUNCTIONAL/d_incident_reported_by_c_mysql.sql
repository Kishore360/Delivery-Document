
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_survey_question.survey_key' ELSE 'SUCCESS' END as Message
 FROM( select count(1) cnt from
  tjx_mdsdb.incident_final SRC 
  LEFT JOIN tjx_mdwdb.d_internal_contact LKP 
 ON CONCAT('INTERNAL_CONTACT~',u_reported_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
  JOIN tjx_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 where TRGT.reported_by_c<>SRC.u_reported_by)b
 
 