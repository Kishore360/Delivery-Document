SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.u_users_impacted_c' ELSE 'SUCCESS' END as Message FROM discover_mdsdb.incident_final  SRC JOIN discover_mdwdb.f_incident TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE COALESCE(SRC.u_user_impact,0) <> (TRGT.u_users_impacted_c) 

