SELECT 
-- src.sys_id,trgt.row_id as trgt_row_id,src.cmdb_ci,lkp.row_id as lkp_row_id,COALESCE(lkp.name,'UNSPECIFIED') as src_application, trgt.application_c as trgt_application
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.application_c' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.change_request_final src 
LEFT JOIN molinahealth_mdwdb.d_change_request trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_configuration_item lkp on src.cmdb_ci = lkp.row_id and src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.name,'UNSPECIFIED') <> COALESCE(trgt.application_c,'UNSPECIFIED');
