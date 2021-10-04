SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident_task_c.incident_type' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM mcd_mdsdb.incident_task_final SRC 
 LEFT JOIN mcd_mdwdb.d_incident_task_c TRGT 
 ON ( SRC.sys_id= TRGT.row_id 
AND SRC.sourceinstance= TRGT.source_id )
 WHERE coalesce(u_incident_type,'UNSPECIFIED')<> (TRGT.incident_type))b
 

 
 