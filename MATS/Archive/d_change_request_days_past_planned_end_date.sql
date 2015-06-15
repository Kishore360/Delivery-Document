

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.days_past_planned_end_date' ELSE 'SUCCESS' END as Message
    from
        #TABLE_SCHEMA.d_change_request i
    left join #TABLE_SCHEMA.f_change_request fi 
		ON (i.row_key = fi.change_request_key)
    left join #TABLE_SCHEMA.d_lov_map lm 
		ON (lm.src_key = fi.state_src_key)
    left join app_test.lsm_ls_source_timezone tz 
		ON (tz.sourceid = 999)
    left join #TABLE_SCHEMA.d_calendar_date ws
		ON (ws.row_key = fi.work_start_on_key
        and ws.source_id = 0)
    left join #TABLE_SCHEMA.d_calendar_date we  
		ON (we.row_key = fi.work_end_on_key
        and we.source_id = 0)
	where lm.dimension_class = 'STATE~TASK'
	and case when lm.dimension_wh_code in ('OPEN') 
			then case when TIMESTAMPDIFF(DAY,#ETL_START_TIME,planned_end_on) > 0 
				then TIMESTAMPDIFF(DAY,#ETL_START_TIME,planned_end_on) else 0 end
		else case when TIMESTAMPDIFF(DAY, closed_on,planned_end_on) > 0 
				then TIMESTAMPDIFF(DAY, closed_on,planned_end_on) else 0 end
		end  <> i.days_past_planned_end_date
