SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_request.model_c_key' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt from aetna_mdsdb.cmdb_ci_final  src 
left join aetna_mdwdb.d_product_model lkp on src.model_id=lkp.row_id and src.sourceinstance=lkp.source_id
join aetna_mdwdb.d_configuration_item trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where coalesce(lkp.row_key, case when src.model_id is null then 0 else -1 end) <> trgt.model_c_key
and src.cdctype<>'D')ma;

