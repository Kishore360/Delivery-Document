SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message
FROM  fidelity_mdsdb.incident_final SRC
JOIN  fidelity_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
join fidelity_mdwdb.d_internal_organization LKP
on case 
when SRC.u_originating_group is null then 'UNSPECIFIED'
else concat('GROUP~',SRC.u_originating_group) end=LKP.row_id
WHERE COALESCE(LKP.row_key,case when SRC.u_originating_group is null then 0 else -1 end ) <> TRGT.originating_group_c_key
; 