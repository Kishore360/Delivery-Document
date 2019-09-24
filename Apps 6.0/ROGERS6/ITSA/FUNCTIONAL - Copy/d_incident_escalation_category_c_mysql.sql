SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_incident.escalation_category_c' ELSE 'SUCCESS' END as Message
 FROM rogers_mdsdb.incident_final  SRC  
JOIN rogers_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE COALESCE(SRC.u_escalation_category,
                'UNSPECIFIED') <> (TRGT.escalation_category_c) 
and SRC.CDCTYPE='X' 