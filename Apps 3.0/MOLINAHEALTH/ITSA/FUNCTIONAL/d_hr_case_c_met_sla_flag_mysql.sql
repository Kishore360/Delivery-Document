SELECT 
-- src.sys_id,IF(src.made_sla = true,'Y','N') as src_made_sla,trgt.row_id,trgt.met_sla_flag as trgt_made_sla
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_hr_case_c.met_sla_flag' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.u_hr_case_final src 
LEFT JOIN molinahealth_mdwdb.d_hr_case_c trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE IF(src.made_sla = true,'Y','N') <> trgt.met_sla_flag;