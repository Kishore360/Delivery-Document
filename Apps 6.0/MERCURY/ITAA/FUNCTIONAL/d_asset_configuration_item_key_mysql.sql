SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_asset.configuration_item_key' ELSE 'SUCCESS' END as Message from(
  SELECT count(1) as cnt 
  from
  mercury_mdsdb.alm_asset_final b
 join mercury_mdwdb.d_asset a
 on right(a.row_id,32)=b.sys_id
  and a.source_id=b.sourceinstance
  JOIN mercury_mdwdb.d_configuration_item LKP 
  ON COALESCE(b.ci,'UNSPECIFIED')= LKP.row_id 
 AND b.sourceinstance= LKP.source_id 
  WHERE COALESCE(LKP.row_key,CASE WHEN b.ci is null THEN 0 else -1 end) <> (a.configuration_item_key)
  and b.CDCTYPE<>'D'
  )x
  
  
 