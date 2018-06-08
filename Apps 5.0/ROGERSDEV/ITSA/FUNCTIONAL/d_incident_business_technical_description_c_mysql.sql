SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_incident.groups_for_rca_c' ELSE 'SUCCESS' END as Message
 FROM rogersdev_mdsdb.incident_final  SRC left JOIN rogersdev_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE coalesce(SRC.u_what_is_the_incident_description_in_both_business_and_tec_0115,'UNSPECIFIED') <> (TRGT.business_technical_description_c) 
