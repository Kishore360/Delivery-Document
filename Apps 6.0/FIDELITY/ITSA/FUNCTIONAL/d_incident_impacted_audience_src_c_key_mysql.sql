SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message
FROM  fidelity_mdsdb.incident_final SRC
JOIN  fidelity_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
join fidelity_mdwdb.d_lov LKP
on COALESCE( CONCAT('U_IMPACTED_AUDIENCE','~','INCIDENT','~',upper(SRC.u_impacted_audience)),'UNSPECIFIED')=LKP.row_id
WHERE COALESCE(LKP.row_key,case when SRC.u_impacted_audience is null then 0 else -1 end ) <> TRGT.impacted_audience_src_c_key
; 