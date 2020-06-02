SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.age_year' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_final WHERE CDCTYPE<>'D') SRC 
  LEFT JOIN #DWH_TABLE_SCHEMA.f_configuration_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 left join #DWH_TABLE_SCHEMA.d_configuration_item d 
            ON TRGT.configuration_item_key=d.row_key 
            AND d.source_id=TRGT.source_id  
    left join #DWH_TABLE_SCHEMA.d_lov_map lov_map
            ON d.source_id=lov_map.source_id 
            AND d.operational_status_src_key=lov_map.src_key  
 left join #DWH_TABLE_SCHEMA.d_configuration_item LKP 
 on LKP.row_id = SRC.sys_id
 and LKP.source_id = SRC.sourceinstance
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id )
 where 
coalesce(CASE when coalesce(LKP.purchase_date,LKP.created_on) IS NULL THEN 0 
when (lov_map.dimension_wh_code = 'NON-OPERATIONAL' or lov_map.dimension_wh_code is null) then 0 ELSE 
TIMESTAMPDIFF(year, coalesce(convert_tz(coalesce(LKP.purchase_date,LKP.created_on), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),0), 
convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) end,0) <> coalesce(d.age_year,'')