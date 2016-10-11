SELECT 
-- src.sys_id,src.service_offering,lkp.row_id,COALESCE(lkp.row_key,CASE WHEN src.service_offering IS NULL THEN 0 else -1 end) as lkp_service_offering_key,trgt.location_key as trgt_service_offering
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_hr_case_c.service_offering_c_key' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.u_hr_case_final src 
LEFT JOIN molinahealth_mdwdb.f_hr_case_c trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_configuration_item lkp ON src.service_offering = lkp.row_id AND src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.service_offering IS NULL THEN 0 else -1 end) <> (trgt.service_offering_c_key);