SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.model_c_key' ELSE 'SUCCESS' END as Message 
FROM
(select sys_id, sourceinstance, model_id from aetna_mdsdb.cmdb_ci_final  where CDCTYPE<>'D') cmd
left join aetna_mdwdb.d_product_model lkp on cmd.model_id=lkp.row_id and cmd.sourceinstance=lkp.source_id
join aetna_mdwdb.d_configuration_item trgt on cmd.sys_id=trgt.row_id and cmd.sourceinstance=trgt.source_id
where coalesce(lkp.row_key, case when cmd.model_id is null then 0 else -1 end) <> trgt.model_c_key;

