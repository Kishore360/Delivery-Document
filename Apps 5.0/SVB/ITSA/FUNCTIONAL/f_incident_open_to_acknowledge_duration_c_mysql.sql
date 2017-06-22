SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.open_to_resolve_duration' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM svb_mdsdb.incident_final SRC
  JOIN svb_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE TIMESTAMPDIFF(SECOND,SRC.opened_at,coalesce(SRC.u_acknowledged_at,SRC.u_assignment_group_changed))  <> TRGT.open_to_acknowledge_duration_c)b


