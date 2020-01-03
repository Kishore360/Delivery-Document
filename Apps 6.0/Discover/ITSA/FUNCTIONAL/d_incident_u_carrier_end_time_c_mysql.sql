SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN
 'MDS to DWH data validation failed for d_incident.u_carrier_end_time_c' ELSE 'SUCCESS' END as Message FROM discover_mdsdb.incident_final  SRC 
 JOIN discover_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE CONVERT_TZ (SRC.u_carrier_end_time, 'GMT','America/Los_Angeles') <> (TRGT.u_carrier_end_time_c) 