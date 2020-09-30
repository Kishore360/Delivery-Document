SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.incident_final SRC
-- left join fidelity_mdsdb.u_fmr_business_unit_final LKP on 
JOIN fidelity_mdwdb.d_fmr_business_unit_c LKP on SRC.u_owning_bu =LKP.row_id and SRC.sourceinstance=LKP.source_id
JOIN  fidelity_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE coalesce(LKP.row_key,case when SRC.u_owning_bu  is null then 0 else -1 end)<> TRGT.owning_bu_c_key and SRC.cdctype<>'D'; 



