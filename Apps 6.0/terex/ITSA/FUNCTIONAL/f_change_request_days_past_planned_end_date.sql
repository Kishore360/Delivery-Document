       
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.time_past_planned_end_date' ELSE 'SUCCESS' END as Message
 
 FROM ( SELECT * FROM terex_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN  terex_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 

 left join terex_mdwdb.d_lov_map LKP 
on  SRC.u_change_state=LKP.dimension_code  
and LKP.dimension_class = 'STATE~CHANGE_REQUEST'
and LKP.source_id = SRC.sourceinstance
 LEFT JOIN 
 (select source_id,max(lastupdated) as lastupdated from  terex_mdwdb.d_o_data_freshness
 group by source_id 
 ) df 
  ON TRGT.source_id = df.source_id
  -- AND TRGT.etl_run_number = df.etl_run_number)
 
	where  case when LKP.dimension_wh_code in ('OPEN') 
			then case when TIMESTAMPDIFF(SECOND,coalesce(SRC.end_date,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) > 0 
				then TIMESTAMPDIFF(SECOND,coalesce(SRC.end_date,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) 
				else 0 end
		else case when TIMESTAMPDIFF(SECOND,coalesce(SRC.end_date,0),coalesce(SRC.work_end,SRC.closed_at,SRC.sys_updated_on,0)) > 0 
				then TIMESTAMPDIFF(SECOND,coalesce(SRC.end_date,0), coalesce(SRC.work_end,SRC.closed_at,SRC.sys_updated_on,0))
				else 0 end
		end  <> TRGT.time_past_planned_end_date
		
		
