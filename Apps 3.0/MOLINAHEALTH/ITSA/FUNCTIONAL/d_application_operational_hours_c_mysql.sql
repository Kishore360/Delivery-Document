SELECT 
-- src.sys_id,right(trgt.row_id,32) as trgt_row_id,COALESCE(src.u_production_hours,'UNSPECIFIED') as src_production_hours, trgt.operational_hours_c as trgt_production_hours
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.operational_hours_c' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.u_cmdb_ci_business_application_final src 
LEFT JOIN molinahealth_mdwdb.d_application trgt ON src.sys_id = right(trgt.row_id,32) AND src.sourceinstance = trgt.source_id
WHERE COALESCE(src.u_production_hours,'UNSPECIFIED') <> COALESCE(trgt.operational_hours_c,'UNSPECIFIED');
