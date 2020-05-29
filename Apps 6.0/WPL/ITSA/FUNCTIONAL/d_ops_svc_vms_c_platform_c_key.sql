SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_ops_svc_vms_c.platform_c_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
wpl_mdsdb.us_osvw_patching_dashboardnumerify_final src
left join wpl_mdwdb.d_ops_svc_vms_c trgt
on  src.row_id=trgt.row_id and src.sourceinstance=trgt.source_id
join wpl_mdwdb.d_lov lkp on COALESCE( CONCAT('PLATFORM~OSVM_PATCHING~',src.platform),'UNSPECIFIED') =lkp.row_id and src.sourceinstance=lkp.source_id
where src.cdctype<>'D' and coalesce(lkp.row_key,case when src.platform is null then 0 else -1 end)<>trgt.platform_c_key)ma
;