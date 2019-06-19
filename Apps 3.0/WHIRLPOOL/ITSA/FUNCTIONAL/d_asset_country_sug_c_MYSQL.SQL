SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_asset.country_sug_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
  whirlpool_mdsdb.alm_asset_final a
 left join whirlpool_mdwdb.d_asset b
 on a.sys_id=right(b.row_id,32) and a.sourceinstance=b.source_id
 where coalesce(a.u_country_sug,'UNSPECIFIED')<>b.country_sug_c  and b.soft_deleted_flag='N')ma;
 
 
 