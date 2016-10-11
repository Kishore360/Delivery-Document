SELECT 
-- src.sys_id,trgt.row_id as trgt_row_id,COALESCE(src.name,'UNSPECIFIED') as src_name, trgt.name as trgt_name
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_business_unit_c.name' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.u_business_unit_final src 
LEFT JOIN molinahealth_mdwdb.d_business_unit_c trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE COALESCE(src.name,'UNSPECIFIED') <> COALESCE(trgt.name,'UNSPECIFIED');
