





select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.change_request_age_key' ELSE 'SUCCESS' END as Message
    from
        #DWH_TABLE_SCHEMA.d_change_request i
    left join #DWH_TABLE_SCHEMA.f_change_request fi 
		ON (i.row_key = fi.change_request_key)
    left join #DWH_TABLE_SCHEMA.d_lov_map lm 
		ON (lm.src_key = fi.state_src_key)
    left join app_test.lsm_ls_source_timezone tz 
		ON (tz.sourceid = 999)
    left join #DWH_TABLE_SCHEMA.d_calendar_date co 
		ON (co.row_key = fi.opened_on_key
        and co.source_id = 0)
	left join #DWH_TABLE_SCHEMA.d_calendar_date cc 
		ON (co.row_key = fi.closed_on_key
        and co.source_id = 0)
	left join #DWH_TABLE_SCHEMA.d_lov A
        ON(case when lm.dimension_wh_code in ('OPEN') 
				then TIMESTAMPDIFF(DAY, convert_tz(co.calendar_date, tz.source_time_zone, tz.target_time_zone),'#ETL_START_TIME')
                else TIMESTAMPDIFF(DAY, co.calendar_date, cc.calendar_date)
            end  between A.lower_range_value and A.upper_range_value)
    where
			lm.dimension_class = 'STATE~TASK'
	and     COALESCE(A.row_key,-1 ) <> fi.change_request_age_key
	
