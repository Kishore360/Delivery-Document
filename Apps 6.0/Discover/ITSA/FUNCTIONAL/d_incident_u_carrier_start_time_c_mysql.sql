SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN
 'MDS to DWH data validation failed for d_incident.u_carrier_start_time_c' ELSE 'SUCCESS' END as Message FROM discover_mdsdb.incident_final  SRC 
 JOIN discover_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE (SRC.u_carrier_start_time) <> (TRGT.u_carrier_start_time_c) 