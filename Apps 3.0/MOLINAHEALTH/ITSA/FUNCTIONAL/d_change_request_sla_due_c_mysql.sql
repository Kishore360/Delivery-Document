SELECT 
-- src.sys_id,convert_tz(src.sla_due,'UTC','America/Los_Angeles'),trgt.row_id,trgt.sla_due_c
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.sla_due_c' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.change_request_final src 
LEFT JOIN molinahealth_mdwdb.d_change_request trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE convert_tz(src.sla_due,'UTC','America/Los_Angeles') <> trgt.sla_due_c;