SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.resolved_by_change_c_flag' ELSE 'SUCCESS' END as Message
 FROM homedepot_mdsdb.incident_final SRC 
 LEFT JOIN homedepot_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.rfc is not null then 'Y' else 'N' END)<> (TRGT.change_flag )
