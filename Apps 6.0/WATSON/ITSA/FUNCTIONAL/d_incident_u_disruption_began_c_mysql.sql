
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.u_outage_start_time_c' 
ELSE 'MDS to DWH data validation passed for d_incident.u_disruption_began_c' END as Message from 
(select count(1) cnt 
FROM ibmwatson_mdsdb.incident_final SRC 
JOIN ibmwatson_mdwdb.d_incident TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id   and TRGT.soft_deleted_flag = 'N'
WHERE convert_tz(SRC.u_disruption_began,'GMT','UTC') <> TRGT.u_disruption_began_c )b





