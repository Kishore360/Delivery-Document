SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_asset.support_vendor_c_key' ELSE 'SUCCESS' END as Message from(
  SELECT count(1) as cnt 
  from
  whirlpool_mdsdb.alm_asset_final b
 join whirlpool_mdwdb.d_asset a
 on right(a.row_id,32)=b.sys_id
  and a.source_id=b.sourceinstance
  JOIN whirlpool_mdwdb.d_internal_organization LKP 
  ON (COALESCE(CONCAT('SUBSIDIARY~',b.u_support_vendor),'UNSPECIFIED'))= LKP.row_id 
 AND b.sourceinstance= LKP.source_id 
  WHERE COALESCE(LKP.row_key,CASE WHEN b.u_support_vendor is null THEN 0 else -1 end) <> (a.support_vendor_c_key)
  and b.CDCTYPE<>'D'
  )x
  
  
 