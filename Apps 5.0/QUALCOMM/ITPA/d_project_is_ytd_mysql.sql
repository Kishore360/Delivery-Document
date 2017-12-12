SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.is_ytd_flag' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.d_project sf
JOIN (select source_id , max(lastupdated) refresh_date from #DWH_TABLE_SCHEMA.d_o_data_freshness group by 1) odf 
ON odf.source_id = sf.source_id
JOIN #DWH_TABLE_SCHEMA.d_lov_map dlm ON sf.project_state_src_key = dlm.src_key AND sf.source_id = dlm.source_id 
JOIN ( select year_start_date, year_end_date from #DWH_TABLE_SCHEMA.d_calendar_date where calendar_date=year_start_date and lagging_count_of_year=0 and calendar_code = 0) cal  
ON
			( (cal.year_start_date BETWEEN sf.planned_start_on AND sf.planned_end_on) 
					or (cal.year_end_date between sf.planned_start_on and sf.planned_end_on) 
					or (sf.planned_start_on between cal.year_start_date and cal.year_end_date)
					or (cal.year_start_date BETWEEN sf.actual_start_on AND sf.actual_end_on) 
					or (cal.year_end_date between sf.actual_start_on and sf.actual_end_on) 
					or (sf.actual_start_on between cal.year_start_date and cal.year_end_date) 
					or ( COALESCE(sf.actual_end_on, odf.refresh_date) between cal.year_start_date and cal.year_end_date) ) OR dlm.dimension_wh_code IN ('OPEN')
where case when cal.year_start_date BETWEEN sf.planned_start_on AND sf.planned_end_on then 'Y'
when cal.year_end_date between sf.planned_start_on and sf.planned_end_on then 'Y'
when sf.planned_start_on between cal.year_start_date and cal.year_end_date then 'Y'
when cal.year_start_date BETWEEN sf.actual_start_on AND sf.actual_end_on then 'Y'
when cal.year_end_date between sf.actual_start_on and sf.actual_end_on then 'Y'
when sf.actual_start_on between cal.year_start_date and cal.year_end_date then 'Y'
when COALESCE(sf.actual_end_on, odf.refresh_date) between cal.year_start_date and cal.year_end_date then 'Y'
when dlm.dimension_wh_code IN ('OPEN') then 'Y'
else 'N' end
<> COALESCE(sf.is_ytd_flag ,'')