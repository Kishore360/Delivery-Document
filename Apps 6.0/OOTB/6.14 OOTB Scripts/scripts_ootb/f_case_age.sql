
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.age' ELSE 'SUCCESS' END as Message
FROM 
#DWH_TABLE_SCHEMA.d_case SRC
left outer join #DWH_TABLE_SCHEMA.f_case TRGT
on  TRGT.row_id=SRC.row_id
left join #DWH_TABLE_SCHEMA.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key and lm.dimension_class = 'STATE~CASE')
    
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id )
 
where 
CASE when lm.dimension_wh_code in ('OPEN') 
then TIMESTAMPDIFF(SECOND, coalesce(convert_tz(SRC.opened_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),0), 
convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
when lm.dimension_wh_code in ('RESOLVED', 'CLOSED')
then TIMESTAMPDIFF(SECOND, coalesce(convert_tz(SRC.opened_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),0),
convert_tz(coalesce(SRC.last_resolved_on,SRC.closed_on,df.lastupdated), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
end
<> coalesce(TRGT.age,0)