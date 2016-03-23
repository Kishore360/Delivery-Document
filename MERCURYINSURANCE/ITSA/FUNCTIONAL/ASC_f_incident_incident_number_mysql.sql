

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.incident_number' ELSE 'SUCCESS' END as Message
 FROM mercuryinsurance_mdsdb.u_asc_ticket_final SRC 
 LEFT JOIN mercuryinsurance_mdwdb.f_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.number,'')<> COALESCE(TRGT.incident_number ,'')
