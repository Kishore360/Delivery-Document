SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_incident.business_technical_description_c' ELSE 'SUCCESS' END as Message
 FROM rogers_mdsdb.incident_final  SRC  
JOIN rogers_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE COALESCE(SRC.u_what_is_the_incident_description_in_both_business_and_tec_0115,
                'UNSPECIFIED') <> (TRGT.business_technical_description_c)
and SRC.CDCTYPE='X' 