

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.actual_duration' ELSE 'SUCCESS' END as Message
    from
        <<tenant>>_mdwdb.d_change_request i
    left join <<tenant>>_mdwdb.f_change_request fi 
		ON (i.row_key = fi.change_request_key)
    left join <<tenant>>_mdwdb.d_lov_map lm 
		ON (lm.src_key = fi.state_src_key)
    left join app_test.lsm_ls_source_timezone tz 
		ON (tz.sourceid = 999)
    left join <<tenant>>_mdwdb.d_calendar_date ws
		ON (ws.row_key = fi.work_start_on_key
        and ws.source_id = 0)
    left join <<tenant>>_mdwdb.d_calendar_date we  
		ON (we.row_key = fi.work_end_on_key
        and we.source_id = 0)
	where lm.dimension_class = 'STATE~TASK'
	and case when lm.dimension_wh_code in ('OPEN') 
				then 0
                else TIMESTAMPDIFF(DAY, ws.calendar_date, we.calendar_date)
            end  <> fi.actual_duration
