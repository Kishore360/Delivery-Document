SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.u_batch_onetime_datacenter_final SRC
JOIN  fidelity_mdwdb.d_batch_onetime_datacenter_c TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE CONVERT_TZ (SRC.sys_updated_on,'GMT','America/New_York') <> TRGT.changed_on; 