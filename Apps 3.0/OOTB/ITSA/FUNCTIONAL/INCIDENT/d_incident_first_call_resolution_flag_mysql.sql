SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM (select count(1)cnt <<tenant>>_mdsdb.incident_final SRC
  JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
JOIN <<tenant>>_mdwdb.d_incident d ON d.row_key = TRGT.incident_key
WHERE   
 TIMESTAMPDIFF(SECOND,d.opened_on,coalesce( d.closed_on,d.changed_on))  <> TRGT.open_to_resolve_duration and
d.last_resolved_on is null)b;