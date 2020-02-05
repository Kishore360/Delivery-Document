SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.u_fmr_cio_group_final SRC
LEFT JOIN fidelity_mdwdb.d_internal_contact LKP on concat('INTERNAL_CONTACT~',SRC.u_cio)=row_id
JOIN  fidelity_mdwdb.d_fmr_cio_group_c TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE coalesce(LKP.row_key,case when SRC.u_cio is null then 0 else -1 end)<> TRGT.cio_user_c_key; 

