SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_request_item.resolution_code_src_c_key' ELSE 'SUCCESS' END as Message from
(select count(1) cnt
FROM mcd_mdsdb.sc_req_item_final  src
JOIN  mcd_mdwdb.f_request_item trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id and trgt.soft_deleted_flag='N'
LEFT JOIN mcd_mdwdb.d_service lkp
ON CONCAT('BUSINESS_SERVICE~',src.u_business_service) =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.u_business_service IS NULL THEN 0 else -1 end)<> trgt.business_service_c_key
)a;