SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_asset.support_group_c_key' ELSE 'SUCCESS' END as Message from(
  SELECT count(1) as cnt 
  from
  wpl_mdsdb.alm_asset_final b
 join wpl_mdwdb.f_asset a
 on right(a.row_id,32)=b.sys_id
  and a.source_id=b.sourceinstance
  JOIN wpl_mdwdb.d_internal_organization LKP 
  ON (COALESCE(CONCAT('GROUP~',b.support_group),'UNSPECIFIED'))= LKP.row_id 
 AND b.sourceinstance= LKP.source_id 
  WHERE COALESCE(LKP.row_key,CASE WHEN b.support_group is null THEN 0 else -1 end) <> (a.support_group_c_key)
  and b.CDCTYPE<>'D'
  )x
  
  
  
 