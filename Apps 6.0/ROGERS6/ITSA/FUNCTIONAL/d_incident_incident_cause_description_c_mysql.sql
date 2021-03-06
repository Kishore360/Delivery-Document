SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_incident.incident_cause_description_c' ELSE 'SUCCESS' END as Message
 FROM rogers6_mdsdb.incident_final  SRC  
JOIN rogers6_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE COALESCE(SRC.u_what_was_the_cause_of_the_incident_indicate_the_change_ti_0136,
                'UNSPECIFIED') <> (TRGT.incident_cause_description_c) 
and SRC.CDCTYPE='X' 