SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
THEN 'MDS to DWH data validation failed for d_incident.jira_ticket_c' ELSE 'SUCCESS' END as Message FROM rogers6_mdsdb.incident_final  SRC 
JOIN rogers6_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
WHERE coalesce(u_jira_ticket,'UNSPECIFIED') <> (TRGT.jira_ticket_c) 
and SRC.CDCTYPE='X';