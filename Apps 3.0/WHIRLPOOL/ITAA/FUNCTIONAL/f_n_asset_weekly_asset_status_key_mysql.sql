SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_status_key' ELSE 'SUCCESS' END as Message
FROM   whirlpool_mdsdb.alm_asset_final SRC 
  JOIN whirlpool_mdwdb.f_n_asset_weekly TRGT 
 ON ( SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id) 
 LEFT JOIN whirlpool_mdwdb.d_lov LKP 
 ON COALESCE(CONCAT('ASSET~STATUS~~',SRC.install_status),'UNSPECIFIED') =LKP.row_id 
AND (SRC.sourceinstance )= LKP.source_id 
 WHERE --  n_date='2017-09-04 00:00:00' and 
 TRGT.soft_deleted_flag='N' and  COALESCE(LKP.row_key,CASE WHEN SRC.install_status IS NULL THEN 0 else '-1' end)=
 COALESCE(TRGT.asset_status_key,'')
 
 
 