

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.assigned_to_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM (select * from truist_mdsdb.incident_final where cdctype<>'D') SRC 
  JOIN truist_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN truist_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',assigned_to)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) and TRGT.pivot_date between effective_from and effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end)<> (TRGT.assigned_to_key))b
