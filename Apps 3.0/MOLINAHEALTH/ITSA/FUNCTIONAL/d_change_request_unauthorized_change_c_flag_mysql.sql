SELECT 
-- src.sys_id,IF(src.u_unauthorized_change = true,'Y','N') as src_unauthorized_change_flag,trgt.row_id,trgt.unauthorized_change_c_flag
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.unauthorized_change_c_flag' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.change_request_final src 
LEFT JOIN molinahealth_mdwdb.d_change_request trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE IF(src.u_unauthorized_change = true,'Y','N') <> trgt.unauthorized_change_c_flag;