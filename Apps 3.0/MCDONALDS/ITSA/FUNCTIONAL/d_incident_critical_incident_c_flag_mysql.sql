SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.critical_incident_c_flag' ELSE 'SUCCESS' END as Message 
FROM <<tenant>>_mdsdb.incident_final  SRC 
JOIN <<tenant>>_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE (CASE WHEN SRC.u_critical_incident = 1 then 'Y' else 'N' END) <> (TRGT.critical_incident_c_flag) 
