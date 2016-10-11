SELECT 
-- src.sys_id,right(trgt.row_id,32) as trgt_row_id,src.u_tier as src_tier, trgt.tier_c as trgt_tier
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.tier_c' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.u_cmdb_ci_business_application_final src 
LEFT JOIN molinahealth_mdwdb.d_application trgt ON src.sys_id = right(trgt.row_id,32) AND src.sourceinstance = trgt.source_id
WHERE COALESCE(src.u_tier,0) <> COALESCE(trgt.tier_c,0);
