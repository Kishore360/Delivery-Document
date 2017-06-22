 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_resolve_deadline_c ' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.incident_final SRC 
 LEFT JOIN svb_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 where CONVERT_TZ(SRC.u_resolve_deadline,'GMT','America/Los_Angeles')<>TRGT.resolve_deadline_c
 
 