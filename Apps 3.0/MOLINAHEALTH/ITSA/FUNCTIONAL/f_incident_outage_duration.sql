SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_end_on_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.incident_final SRC
 LEFT JOIN molinahealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE (u_outage_duration  )<>(TRGT.outage_duration)
