SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.contact_type_c_key' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.sc_req_item_final src 
LEFT JOIN molinahealth_mdwdb.d_request_item trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_lov lkp ON concat('CONTACT_TYPE_C~SC_REQ_ITEM~~~',upper(src.contact_type)) = lkp.row_id AND src.sourceinstance = lkp.source_id and  lkp.dimension_class =  'CONTACT_TYPE_C~SC_REQ_ITEM'
WHERE COALESCE(lkp.row_key,CASE WHEN src.contact_type IS NULL THEN 0 else -1 end) <>  (trgt.contact_type_c_key) ;