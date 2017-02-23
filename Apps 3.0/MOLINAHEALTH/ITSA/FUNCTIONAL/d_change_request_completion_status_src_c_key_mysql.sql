SELECT 
-- src.sys_id,trgt.row_id,COALESCE(CONCAT('COMPLETION_STATUS_C','~','CHANGE_REQUEST','~~~',UPPER(src.u_completion_status)),'UNSPECIFIED') as src_completion_status, lkp.row_id as lkp_completion_status, COALESCE(lkp.row_key,CASE WHEN src.u_completion_status IS NULL THEN 0 else -1 end) as src_completion_Result_src_c_key,completion_status_src_c_key as trgt_completion_status_src_c_key
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.completion_Result_src_c_key' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.change_request_final src 
LEFT JOIN molinahealth_mdwdb.d_change_request trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_lov lkp ON CONCAT('COMPLETION_STATUS_C~CHANGE_REQUEST','~~~',UPPER(src.u_completion_status)) = lkp.row_id AND src.sourceinstance = lkp.source_id and  lkp.dimension_class =  'COMPLETION_STATUS_C~CHANGE_REQUEST'
WHERE soft_deleted_flag='N' and COALESCE(lkp.row_key,CASE WHEN src.u_completion_status IS NULL THEN 0 else -1 end) <> (trgt.completion_status_src_c_key);