 SELECT 
CASE WHEN  CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_survey_question.survey_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM tjx_mdsdb.incident_final SRC
join tjx_mdwdb.d_incident TRGT
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where SRC.u_office_location<>TRGT.office_location_c limit 100)temp;