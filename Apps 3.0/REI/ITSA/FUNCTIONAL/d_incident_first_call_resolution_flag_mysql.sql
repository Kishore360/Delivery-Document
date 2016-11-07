  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM rei_mdsdb.incident_final SRC 
  JOIN rei_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  
 and  SRC.opened_by=SRC.u_original_resolver AND SRC.u_original_resolver =SRC.u_last_resolver AND
 DATE(SRC.opened_at) = DATE(u_last_resolution_date) AND DATE(SRC.opened_at) = DATE(SRC.u_original_resolution_date)) 
  join rei_mdsdb.sys_user_final s
 on SRC.opened_by=s.sys_id
 and SRC.sourceinstance= s.sourceinstance
 and s.manager= '0e039e450a0a3c1f00ab757f305c61bf'
JOIN  rei_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
 WHERE  COALESCE(TRGT.first_call_resolution_flag ,'')<>'Y';