SELECT 
-- src.sys_id,coalesce(src.u_onboard_employee,'UNSPECIFIED') as src_onboard_employee,trgt.row_id,trgt.onboard_employee as trgt_onboard_employee
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_hr_case_c.onboard_employee' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.u_hr_case_final src 
LEFT JOIN molinahealth_mdwdb.d_hr_case_c trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE coalesce(src.u_onboard_employee,'UNSPECIFIED') <> trgt.onboard_employee;