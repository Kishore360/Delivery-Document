

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.urgency_src_code' ELSE 'SUCCESS' END as Message
 FROM mercury_mdsdb.u_asc_ticket_final SRC 
 LEFT JOIN mercury_mdwdb.f_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.urgency,'')<> COALESCE(TRGT.asc_incident_urgency_src_code_c ,'')
