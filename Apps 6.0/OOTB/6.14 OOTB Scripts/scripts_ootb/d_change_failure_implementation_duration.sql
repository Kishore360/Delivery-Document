-- Column need to be removed ADVA-369

-- For Closed Changes, Difference (Actual Start Date, Actual End Date)
-- For Open Changes, Difference (Planned Start Date, Planned End Date)
-- Actual start date = work_start, planned_start_date - start_date, opened - opened_at, planned_end_date-end_date, end_date-closed_at

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.implementation_duration' ELSE 'SUCCESS' END as Message
 
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN   (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
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
 
	where case when LKP.dimension_wh_code in ('CANCELED') then -1
				when (LKP.dimension_wh_code in ('OPEN') AND (SRC.start_date IS NULL OR SRC.end_date IS NULL)) THEN -1
				when LKP.dimension_wh_code in ('OPEN') then (TIMESTAMPDIFF(SECOND,SRC.start_date,SRC.end_date)) 
				when (LKP.dimension_wh_code in ('CLOSED','CANCELED') AND (SRC.work_start IS NULL OR (coalesce(SRC.closed_at,SRC.sys_updated_on) IS NULL))) THEN -1
				when LKP.dimension_wh_code in ('CLOSED') then (TIMESTAMPDIFF(SECOND,SRC.work_start,coalesce(SRC.closed_at,SRC.sys_updated_on)))
				ELSE -1 end  <> coalesce(TRGT.implementation_duration,'')
				