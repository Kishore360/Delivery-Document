SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.application_tier_src_c_key' ELSE 'SUCCESS' END as Message 
FROM pan_mdsdb.cmdb_ci_business_app_final src
LEFT JOIN pan_mdwdb.d_lov lkp
ON COALESCE(CONCAT('APPLICATION_TIER_C~CONFIGURATION_ITEM~~~',src.u_application_tier),'UNSPECIFIED') =lkp.row_id 
JOIN  pan_mdwdb.d_configuration_item trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.soft_deleted_flag='N' and COALESCE(lkp.row_key,CASE WHEN src.u_application_tier IS NULL THEN 0 else -1 end)<> trgt.application_tier_src_c_key
;

