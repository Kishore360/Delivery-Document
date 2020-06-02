SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.asset_age_year_bucket_key' ELSE 'SUCCESS' END as Message
  FROM (select * from #MDS_TABLE_SCHEMA.alm_asset_final where CDCTYPE <> 'D') SRC 
  
 LEFT JOIN #DWH_TABLE_SCHEMA.d_asset TRGT 
 ON (concat('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 

LEFT join 
(select source_id,max(lastupdated) as lastupdated from
#DWH_TABLE_SCHEMA.d_o_data_freshness TRGT
group by source_id) FRSH
on FRSH.source_id=SRC.sourceinstance

LEFT join #DWH_TABLE_SCHEMA.d_lov lo
on lo.dimension_class='ASSET_AGE~YEAR_BUCKET'
  -- changes done for dimension_class chagne in lov for 6.0
  /*
and  lo.dimension_class='ASSET_AGE'
and lo.dimension_type = 'YEAR_BUCKET' */
and case when  FRSH.lastupdated> convert_tz(SRC.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')  then 
 round(DATEDIFF(FRSH.lastupdated,convert_tz(SRC.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'))/365,0)
  else 0 end 
 <lo.upper_range_value 
 and case when  FRSH.lastupdated> convert_tz(SRC.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')  then 
 round(DATEDIFF(FRSH.lastupdated,convert_tz(SRC.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'))/365,0)
  else 0 end 
 >=lo.lower_range_value
where lo.row_key <> coalesce(TRGT.asset_age_year_bucket_key,'') 
