SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM homedepot_mdsdb.incident_final SRC
  JOIN homedepot_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
JOIN homedepot_mdwdb.d_incident d ON d.row_key = TRGT.incident_key
WHERE   
 TIMESTAMPDIFF(second,d.opened_on,d.last_resolved_on)  <> TRGT.open_to_resolve_duration
 and d.last_resolved_on is null;
