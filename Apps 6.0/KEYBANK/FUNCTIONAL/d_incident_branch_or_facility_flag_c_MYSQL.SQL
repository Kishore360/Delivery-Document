SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.branch_or_facility_flag_c' ELSE 'SUCCESS' END as Message 
FROM keybank_mdsdb.incident_final SRC
JOIN keybank_mdwdb.d_incident TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
WHERE case when SRC.u_branch_or_facility =0 then 'Y' else 'N' end <> TRGT.branch_or_facility_flag_c;