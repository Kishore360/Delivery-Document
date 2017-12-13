


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.changed_on' ELSE 'SUCCESS' END as Message
  FROM gogo_mdsdb.incident_final SRC 
 LEFT JOIN gogo_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE tail_number_c<>u_tail_number or agent_c <> u_agent
 or identifier_c <> u_identifier 
or  alertgroup_c <> u_alertgroup 
or  summary_c <> u_summary 
or firstoccurrence_c <> u_firstoccurrence 
or automated_ticket_c_flag <> case when coalesce(u_automated_ticket,0) =0 then 'N' else 'Y' end 

