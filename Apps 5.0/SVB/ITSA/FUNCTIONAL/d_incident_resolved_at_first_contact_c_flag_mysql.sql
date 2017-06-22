 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_resolved_at_first_contact_c_flag' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.incident_final SRC 
 LEFT JOIN svb_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 where case when SRC.u_resolved_at_first_contact=1 then 'Y' else 'N' end<> TRGT.resolved_at_first_contact_c_flag
 
 