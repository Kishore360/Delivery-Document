

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.change_request_age' ELSE 'SUCCESS' END as Message
    from
        #TABLE_SCHEMA.d_change_request i
    left join #TABLE_SCHEMA.f_change_request fi 
		ON (i.row_key = fi.change_request_key)
    left join #TABLE_SCHEMA.d_lov_map lm 
		ON (lm.src_key = fi.state_src_key)
    left join app_test.lsm_ls_source_timezone tz 
		ON (tz.sourceid = 999)
    left join #TABLE_SCHEMA.d_calendar_date co 
		ON (co.row_key = fi.opened_on_key
        and co.source_id = 0)
    left join #TABLE_SCHEMA.d_calendar_date cc 
		ON (cc.row_key = fi.closed_on_key
        and cc.source_id = 0)
	where lm.dimension_class = 'STATE~TASK'
	and case when lm.dimension_wh_code in ('OPEN') 
				then TIMESTAMPDIFF(DAY, co.calendar_date, convert_tz('#ETL_START_TIME', tz.source_time_zone, tz.target_time_zone))
                else TIMESTAMPDIFF(DAY, co.calendar_date, cc.calendar_date)
            end  <> fi.change_request_age
