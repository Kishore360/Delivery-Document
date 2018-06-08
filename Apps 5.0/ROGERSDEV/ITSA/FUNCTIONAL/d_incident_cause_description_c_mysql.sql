SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_incident.groups_for_rca_c' ELSE 'SUCCESS' END as Message
 FROM rogersdev_mdsdb.incident_final  SRC left JOIN rogersdev_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE coalesce(SRC.u_what_was_the_cause_of_the_incident_indicate_the_change_ti_0117,'UNSPECIFIED') <> (TRGT.incident_cause_description_c) 
