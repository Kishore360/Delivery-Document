

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.days_past_planned_end_date' ELSE 'SUCCESS' END as Message
    from  #TABLE_SCHEMA.f_change_request fi 
    left join #TABLE_SCHEMA.d_lov_map lm 
		ON (lm.src_key = fi.state_src_key)
    left join app_test.lsm_ls_source_timezone tz 
		ON (tz.sourceid = 999)
    left join #TABLE_SCHEMA.d_calendar_date co
		ON (co.row_key = fi.closed_on_key
        and co.source_id = 0)
    left join #TABLE_SCHEMA.d_calendar_date pe 
		ON (pe.row_key = fi.planned_end_on_key
        and pe.source_id = 0)
	where lm.dimension_class = 'STATE~TASK'
	and case when lm.dimension_wh_code in ('OPEN') 
			then case when TIMESTAMPDIFF(DAY,pe.calendar_date,'#ETL_START_TIME') > 0 
				then TIMESTAMPDIFF(DAY,pe.calendar_date,'#ETL_START_TIME') else 0 end
		else case when TIMESTAMPDIFF(DAY, co.calendar_date,pe.calendar_date) > 0 
				then TIMESTAMPDIFF(DAY, co.calendar_date,pe.calendar_date) else 0 end
		end  <> fi.days_past_planned_end_date
