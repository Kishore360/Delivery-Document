select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.dormancy_age' ELSE 'SUCCESS' END as Message
/*select TRGT.row_key,
lm.dimension_wh_code, 
CASE WHEN lm.dimension_wh_code = 'OPEN' THEN TIMESTAMPDIFF(second,coalesce(SRC.sys_updated_on,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))	ELSE 0 END sr, TRGT.dormancy_age tg*/
FROM  ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_customerservice_case_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_case TRGT 
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id )
left join #DWH_TABLE_SCHEMA.d_lov_map lm 
ON (lm.src_key = TRGT.state_src_key and lm.source_id = TRGT.source_id and lm.dimension_class = 'STATE~CASE')
LEFT JOIN (
select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id
) df 
ON (TRGT.source_id = df.source_id)
where lm.dimension_class = 'STATE~CASE'
AND coalesce(CASE WHEN lm.dimension_wh_code = 'OPEN' THEN TIMESTAMPDIFF(second,coalesce(SRC.sys_updated_on,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))	ELSE 0 END, 0) <> coalesce(TRGT.dormancy_age, '')
