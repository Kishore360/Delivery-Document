SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.u_fmr_business_unit_final SRC
JOIN  fidelity_mdwdb.d_fmr_business_unit_c TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE COALESCE(SRC.u_business_unit,'UNSPECIFIED') <> TRGT.business_unit and SRC.cdctype<>'D'
; 