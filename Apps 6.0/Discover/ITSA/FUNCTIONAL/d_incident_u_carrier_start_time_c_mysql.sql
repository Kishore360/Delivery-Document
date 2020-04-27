SELECT CASE WHEN count(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  >0 THEN 'MDS to DWH data validation failed for d_incident.u_carrier_start_time_c' ELSE 'SUCCESS' END as Message FROM discover_mdsdb.incident_final  SRC 
 JOIN discover_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE convert_tz(SRC.u_carrier_start_time,'GMT','America/New_York') <> (TRGT.u_carrier_start_time_c) 