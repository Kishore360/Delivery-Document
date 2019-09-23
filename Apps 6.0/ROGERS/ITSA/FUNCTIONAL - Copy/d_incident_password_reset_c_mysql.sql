SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_incident.groups_for_rca_c' ELSE 'SUCCESS' END as Message
 FROM rogers_mdsdb.incident_final  SRC left JOIN rogers_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE case when u_password_reset=true then 'Y' else 'N' end  <> (TRGT.password_reset_c) 
and SRC.CDCTYPE='X' 


