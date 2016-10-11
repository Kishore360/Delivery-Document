SELECT 
-- src.sys_id,trgt.row_id as trgt_row_id,IF(src.u_peer_review = true,'Y','N') as src_peer_review_flag, trgt.peer_review_c_flag as trgt_peer_review_flag
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.peer_review_c_flag' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.change_request_final src 
LEFT JOIN molinahealth_mdwdb.d_change_request trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE IF(src.u_peer_review = true,'Y','N') <> COALESCE(trgt.peer_review_c_flag,'N');
