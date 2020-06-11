SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.ci_age_key' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_final WHERE CDCTYPE<>'D') SRC 
   left join #DWH_TABLE_SCHEMA.d_configuration_item TRGT 
            ON TRGT.row_id=SRC.sys_id
            AND TRGT.source_id=SRC.sourceinstance  
    left join #DWH_TABLE_SCHEMA.d_lov_map lov_map
            ON TRGT.source_id=lov_map.source_id 
            AND TRGT.operational_status_src_key=lov_map.src_key  
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id )
  left join  #DWH_TABLE_SCHEMA.d_lov lov
on lov.dimension_class =  'WH_AGEBUCKET~CMDB_CI' 
and coalesce(TIMESTAMPDIFF(day, coalesce(convert_tz(coalesce(TRGT.purchase_date,TRGT.created_on), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),0), 
convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')),0) >=lov.lower_range_value
and coalesce(TIMESTAMPDIFF(day, coalesce(convert_tz(coalesce(TRGT.purchase_date,TRGT.created_on), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),0), 
convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')),0) <lov.upper_range_value 
 where 
 coalesce(CASE when (lov_map.dimension_wh_code = 'NON-OPERATIONAL' or lov_map.dimension_wh_code is null) then 0 
 when lov_map.dimension_wh_code is null then 0 else
lov.row_key end,-1) <> coalesce(TRGT.ci_age_bucket_key,'')
