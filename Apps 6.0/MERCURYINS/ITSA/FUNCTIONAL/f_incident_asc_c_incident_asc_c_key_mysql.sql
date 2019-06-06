

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.incident_key' ELSE 'SUCCESS' END as Message
 FROM mercury_mdsdb.u_asc_ticket_final SRC 
 LEFT JOIN mercury_mdwdb.f_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN mercury_mdwdb.d_incident_asc_c LKP 
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id and LKP.soft_deleted_flag='N' )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.incident_asc_c_key)
