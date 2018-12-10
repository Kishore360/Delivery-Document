SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message
FROM  fidelity_mdsdb.incident_final SRC
JOIN  fidelity_mdwdb.f_incident TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE CASE WHEN SRC.u_cumulative_impact_duration is null  THEN NULL 
WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_cumulative_impact_duration) < 0 THEN NULL  
ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_cumulative_impact_duration)END <> TRGT.u_cumulative_impact_duration_c
