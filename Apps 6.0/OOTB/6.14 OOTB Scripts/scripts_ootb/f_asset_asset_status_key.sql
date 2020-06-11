SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_status_key' ELSE 'SUCCESS' END as Message
 FROM (select * from #MDS_TABLE_SCHEMA.alm_asset_final where CDCTYPE<> 'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_asset TRGT 
 ON ( SRC.sys_id   =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON COALESCE(CONCAT('ASSET~STATUS~',SRC.install_status) ,'UNSPECIFIED')  = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
/*AND LKP.dimension_class ='ASSET'
AND LKP.dimension_type = 'STATUS'*/
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.install_status IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.asset_status_key,'')
