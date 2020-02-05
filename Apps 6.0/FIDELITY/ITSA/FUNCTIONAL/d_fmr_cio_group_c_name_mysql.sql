SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.u_fmr_cio_group_final SRC
JOIN  fidelity_mdwdb.d_fmr_cio_group_c TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE coalesce(SRC.u_cio_group_name ,'unspecified') <> TRGT.name and SRC.cdctype<>'D'; 