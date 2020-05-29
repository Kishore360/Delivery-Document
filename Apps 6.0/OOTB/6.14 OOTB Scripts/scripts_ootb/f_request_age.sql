select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.age' ELSE 'SUCCESS' END as Message

 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 left join #DWH_TABLE_SCHEMA.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key and lm.dimension_class = 'REQUEST_STATE~SC_REQUEST')
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id )
where case when lm.dimension_wh_code in ('OPEN') and (coalesce( SRC.opened_at,0) > convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) then 0
	 when lm.dimension_wh_code in ('OPEN')  then TIMESTAMPDIFF(SECOND, coalesce( SRC.opened_at,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
     else case when lm.dimension_wh_code in ('CLOSED','RESOLVED') and  SRC.opened_at<= coalesce(SRC.closed_at,SRC.sys_updated_on) 
	 then TIMESTAMPDIFF(SECOND, coalesce( SRC.opened_at,0),coalesce(SRC.closed_at,SRC.sys_updated_on)) 
	else 0 end
end  <>coalesce( TRGT.age,'')
