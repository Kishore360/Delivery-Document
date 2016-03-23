

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.parent_incident_key' ELSE 'SUCCESS' END as Message
 FROM mercuryinsurance_mdsdb.u_asc_ticket_final SRC 
 LEFT JOIN mercuryinsurance_mdwdb.f_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN mercuryinsurance_mdwdb.d_incident_asc_c LKP 
 ON ( SRC.parent_incident= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.parent_incident IS NULL THEN 0 else -1 end)<> (TRGT.parent_incident_key)
