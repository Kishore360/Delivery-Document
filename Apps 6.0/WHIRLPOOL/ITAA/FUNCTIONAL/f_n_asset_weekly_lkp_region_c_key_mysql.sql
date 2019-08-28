SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,         
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.install_on' ELSE 'SUCCESS' END as Message        
from         
whirlpool_mdwdb.f_n_asset_weekly a         
join         
whirlpool_mdsdb.alm_asset_final b         
on right(a.row_id,32) =  b.sys_id and a.source_id=b.sourceinstance         
join         
whirlpool_mdwdb.d_lov c         
on COALESCE(CONCAT('LKP_REGION_C~ASSET','~~~',b.u_region_ref),'UNSPECIFIED')=c.row_id         
where          
coalesce(c.row_key,case when b.u_region_ref is null then 0 else -1 end)<>a.lkp_region_c_key         

