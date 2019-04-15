SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_configuration_item.operational_status_src_c_key' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt  from aetna_mdsdb.cmdb_ci_final  src
left join aetna_mdwdb.d_configuration_item trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join aetna_mdwdb.d_lov lkp on coalesce(concat('OPERATION_STATUS~CMDB_CI~~~', src.operational_status), 'UNSPECIFIED')=lkp.row_id
and src.sourceinstance=lkp.source_id
where 
COALESCE(lkp.row_key, case when src.operational_status is null then 0 else -1 end) <> trgt.operational_status_src_c_key
and src.cdctype<>'D')ma