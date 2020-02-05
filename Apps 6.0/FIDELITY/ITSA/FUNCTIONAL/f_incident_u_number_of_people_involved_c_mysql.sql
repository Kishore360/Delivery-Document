SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message
FROM  fidelity_mdsdb.incident_final SRC
JOIN  fidelity_mdwdb.f_incident TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE coalesce(SRC.u_number_of_people_involved,'Unspecified') <> TRGT.u_number_of_people_involved_c and SRC.cdctype<>'D'
