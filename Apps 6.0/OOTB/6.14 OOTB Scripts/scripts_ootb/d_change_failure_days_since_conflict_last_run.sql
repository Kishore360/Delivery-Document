-- For Open Changes: Difference between Current date & Conflict last run date
-- For Closed Change: Difference between Actual start date & Conflict last run date

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.days_since_conflict_last_run' ELSE 'SUCCESS' END as Message
 
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN  (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
left join #DWH_TABLE_SCHEMA.d_lov_map LKP 
on  SRC.state=LKP.dimension_code  
and LKP.dimension_class = 'STATE~CHANGE_REQUEST'
and LKP.source_id = SRC.sourceinstance
 LEFT JOIN 
 (select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id 
 ) df 
  ON TRGT.source_id = df.source_id

	where (case when LKP.dimension_wh_code in ('CANCELED') THEN -1
			when LKP.dimension_wh_code in ('OPEN') and (conflict_last_run is null) THEN -1
			when LKP.dimension_wh_code in ('OPEN') 
			then case when TIMESTAMPDIFF(SECOND,coalesce(SRC.conflict_last_run,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) > 0 
				then ((TIMESTAMPDIFF(SECOND,coalesce(SRC.conflict_last_run,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')))/86400) 
				else -1 end
		when LKP.dimension_wh_code in ('CLOSED') and (conflict_last_run is null OR SRC.work_start IS NULL) then -1
		when LKP.dimension_wh_code in ('CLOSED')  then 
			case when TIMESTAMPDIFF(SECOND,coalesce(SRC.work_start,0),coalesce(SRC.conflict_last_run,0)) > 0 
				then ((TIMESTAMPDIFF(SECOND,coalesce(SRC.work_start,0),coalesce(SRC.conflict_last_run,0)))/86400)
				else -1 end
		else 0	end)  <> coalesce(TRGT.days_since_conflict_last_run,'')
		
		
