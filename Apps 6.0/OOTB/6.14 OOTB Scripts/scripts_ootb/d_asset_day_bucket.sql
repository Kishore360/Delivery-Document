SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.day_bucket' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.alm_asset_final WHERE CDCTYPE<>'D') SRC 
  
 LEFT JOIN #DWH_TABLE_SCHEMA.d_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 

LEFT join 
(select source_id,max(lastupdated) as lastupdated from
#DWH_TABLE_SCHEMA.d_o_data_freshness TRGT
group by source_id) FRSH
on FRSH.source_id=SRC.sourceinstance

 WHERE case when  FRSH.lastupdated> convert_tz(SRC.asset_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')  then 
 DATEDIFF(FRSH.lastupdated,convert_tz(SRC.asset_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'))
 else 0 end 
 <> TRGT.day_bucket 
