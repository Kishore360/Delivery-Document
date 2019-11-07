 SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_asset.lkp_region_c_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
  whirlpool_mdsdb.alm_asset_final a
 left join whirlpool_mdwdb.d_asset b
 on a.sys_id=right(b.row_id,32) and a.sourceinstance=b.source_id and SRC.cdctype='X'
 left join whirlpool_mdwdb.d_lov lkp
 on COALESCE(CONCAT('LKP_REGION_C~ASSET','~~~',u_region_ref),'UNSPECIFIED') =lkp.row_id and a.sourveinstance=lkp.source_id
 where coalesce(lkp.row_key,case when b.u_region_ref is null then 0 else -1 end)<>b.lkp_region_c_key  and b.soft_deleted_flag='N')ma;