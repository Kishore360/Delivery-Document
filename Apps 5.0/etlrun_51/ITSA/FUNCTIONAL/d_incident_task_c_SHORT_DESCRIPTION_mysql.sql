


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.incident_number' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.u_incident_task_final SRC 
 LEFT JOIN wow_mdwdb.d_incident_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE
SRC.short_description <> TRGT.SHORT_DESCRIPTION

