SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_asset.managed_by_c_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt 
 from 
  wpl_mdsdb.alm_asset_final a
 left join wpl_mdwdb.d_asset b
 on a.sys_id=right(b.row_id,32) and a.sourceinstance=b.source_id 
 left join wpl_mdwdb.d_internal_contact lkp
 on COALESCE(CONCAT('INTERNAL_CONTACT~',b.managed_by),'UNSPECIFIED') =lkp.row_id and a.sourceinstance=lkp.source_id
 where coalesce(lkp.row_key,case when b.managed_by is null then 0 else -1 end)<>b.managed_by_c_key  and a.CDCTYPE='X')ma;
 
 
 
   
