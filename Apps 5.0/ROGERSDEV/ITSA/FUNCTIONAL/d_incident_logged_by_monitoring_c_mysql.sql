SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_incident.groups_for_rca_c' ELSE 'SUCCESS' END as Message
 FROM rogersdev_mdsdb.incident_final  SRC left JOIN rogersdev_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE coalesce(SRC.u_was_the_incident_ticket_logged_based_on_monitoring_and_al_0114,'UNSPECIFIED') <> (TRGT.logged_by_monitoring_c) 
