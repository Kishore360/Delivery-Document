SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_request_item.resolution_code_src_c_key' ELSE 'SUCCESS' END as Message from
(select count(1) cnt
FROM mcd_mdsdb.sc_req_item_final  src
JOIN  mcd_mdwdb.d_request_item trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id and trgt.soft_deleted_flag='N'
LEFT JOIN mcd_mdwdb.d_lov lkp
ON CONCAT('SERVICE_CATEGORY_C~REQUEST_ITEM~~~',src.u_service_category) =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.u_service_category IS NULL THEN 0 else -1 end)<> trgt.service_category_src_c_key
and src.cdctime='X')a;