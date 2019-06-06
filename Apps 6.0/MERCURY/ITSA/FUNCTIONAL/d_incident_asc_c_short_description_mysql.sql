

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_asc_c.short_description' ELSE 'SUCCESS' END as Message
 FROM mercury_mdsdb.u_asc_ticket_final SRC 
 LEFT JOIN mercury_mdwdb.d_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( char_length(replace(SRC.short_description,' ','')),'')<> COALESCE(char_length(replace(TRGT.short_description,' ','')),'')

 
 