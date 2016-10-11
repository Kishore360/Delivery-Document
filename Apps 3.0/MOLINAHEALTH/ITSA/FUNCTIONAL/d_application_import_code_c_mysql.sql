SELECT 
-- src.sys_id,right(trgt.row_id,32) as trgt_row_id,COALESCE(src.u_import_code,'UNSPECIFIED') as src_import_code, trgt.import_code_c as trgt_import_code
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.import_code_c' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.u_cmdb_ci_business_application_final src 
LEFT JOIN molinahealth_mdwdb.d_application trgt ON src.sys_id = right(trgt.row_id,32) AND src.sourceinstance = trgt.source_id
WHERE COALESCE(src.u_import_code,'UNSPECIFIED') <> COALESCE(trgt.import_code_c,'UNSPECIFIED');
