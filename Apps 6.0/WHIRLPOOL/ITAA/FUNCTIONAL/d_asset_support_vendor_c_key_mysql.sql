SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_asset.support_vendor_c_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
  whirlpool_mdsdb.alm_asset_final a
 left join whirlpool_mdwdb.d_asset b
 on a.sys_id=right(b.row_id,32) and a.sourceinstance=b.source_id and SRC.cdctype='X'
 left join whirlpool_mdwdb.d_internal_organization lkp
 on COALESCE(CONCAT('SUBSIDIARY~',a.u_support_vendor),'UNSPECIFIED') =lkp.row_id and a.sourveinstance=lkp.source_id
 where coalesce(lkp.row_key,case when b.u_support_vendor is null then 0 else -1 end)<>b.support_vendor_c_key  and b.soft_deleted_flag='N')ma;
 
 