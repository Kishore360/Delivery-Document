 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.reopened_flag' ELSE 'SUCCESS' END as Message
 FROM rei_mdsdb.incident_final SRC 
 LEFT JOIN rei_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE CASE WHEN SRC.u_original_resolution_date<>SRC.u_last_resolution_date then 'Y' else 'N' END <> TRGT.reopened_flag 