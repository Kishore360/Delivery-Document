SELECT 
-- src.sys_id,convert_tz(src.expected_start,'UTC','America/Los_Angeles') as src_expected_start,trgt.row_id,trgt.expected_start as trgt_expected_start
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_hr_case_c.expected_start' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.u_hr_case_final src 
LEFT JOIN molinahealth_mdwdb.d_hr_case_c trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE convert_tz(src.expected_start,'UTC','America/Los_Angeles') <> trgt.expected_start;