SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_owned_by_key' ELSE 'SUCCESS' END as Message
  
  
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.alm_asset_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )


LEFT JOIN  #DWH_TABLE_SCHEMA.d_internal_contact LKP
ON (concat('INTERNAL_CONTACT~',SRC.owned_by)=LKP.row_id 
 AND SRC.sourceinstance=LKP.source_id )
 WHERE coalesce(LKP.row_key,case when SRC.owned_by is null then 0 else -1 end ) <> coalesce(TRGT.asset_owned_by_key,'') ;
 