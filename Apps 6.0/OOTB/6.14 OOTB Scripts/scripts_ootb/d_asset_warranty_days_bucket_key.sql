SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.warranty_days_bucket' ELSE 'SUCCESS' END as Message
  FROM (select * from #MDS_TABLE_SCHEMA.alm_asset_final where CDCTYPE <> 'D') SRC 
  
 LEFT JOIN #DWH_TABLE_SCHEMA.d_asset TRGT 
 ON ( concat('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 

LEFT join 
(select source_id,max(lastupdated) as lastupdated from
#DWH_TABLE_SCHEMA.d_o_data_freshness TRGT
group by source_id) FRSH
on FRSH.source_id=SRC.sourceinstance

 
 LEFT join #DWH_TABLE_SCHEMA.d_lov lo
on  lo.dimension_class='WH_WARRANTY~DAY_BUCKET'
  -- changes done for dimension_class chagne in lov for 6.0
/*

and  lo.dimension_class='WARRANTY'
and lo.dimension_type = 'DAY_BUCKET'
*/
 and DATEDIFF(FRSH.lastupdated,convert_tz(SRC.warranty_expiration,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) <lo.upper_range_value 
 and DATEDIFF(FRSH.lastupdated,convert_tz(SRC.warranty_expiration,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) >=lo.lower_range_value
where 
case when SRC.warranty_expiration is null then 0 else 
coalesce(lo.row_key, -1 ) end<> coalesce(TRGT.warranty_days_bucket_key,'') 
