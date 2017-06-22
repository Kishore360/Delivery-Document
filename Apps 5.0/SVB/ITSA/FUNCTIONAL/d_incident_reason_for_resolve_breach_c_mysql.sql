SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_reason_for_resolve_breach_c' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.incident_final SRC 
 LEFT JOIN svb_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 where SRC.u_reason_for_resolve_breach<>TRGT.reason_for_resolve_breach_c
 
 