SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_incident.logged_by_monitoring_c' ELSE 'SUCCESS' END as Message
 FROM rogers6_mdsdb.incident_final  SRC  
JOIN rogers6_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE COALESCE(SRC.u_was_the_incident_ticket_logged_based_on_monitoring_and_al_0133,
                'UNSPECIFIED') <> (TRGT.logged_by_monitoring_c) 
and SRC.CDCTYPE='X' 