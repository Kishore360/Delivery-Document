

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.reported_type_src_key' ELSE 'SUCCESS' END as Message
 FROM   svb_mdsdb.incident_final SRC 
 LEFT JOIN  svb_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN svb_mdwdb.d_lov LKP 
 ON ( concat('ESCALATION~INCIDENT~~~',upper(escalation))= LKP.row_id 
 )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.escalation IS NULL THEN 0 else -1 end)<> (TRGT.escalate_c_key);
 
 