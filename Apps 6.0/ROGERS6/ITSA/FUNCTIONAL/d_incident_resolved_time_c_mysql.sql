SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_incident.resolved_time_c' ELSE 'SUCCESS' END as Message
 FROM rogers6_mdsdb.incident_final  SRC  
JOIN rogers6_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE   CASE WHEN length(SRC.u_resolved_time)=19 THEN CAST(SRC.u_resolved_time AS datetime) 
                    ELSE NULL 
                END  <> (TRGT.resolved_time_c) 
and SRC.CDCTYPE='X' 