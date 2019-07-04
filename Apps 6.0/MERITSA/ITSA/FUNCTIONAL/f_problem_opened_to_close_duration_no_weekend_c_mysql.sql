SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
From meritsa_mdwdb.f_problem trgt
INNER JOIN 
(
Select
    sys_id,opened_at, closed_at,
	(sum(case when dt.day_of_week in (6,7) then 0
			  when date(opened_at) = date(closed_at) then UNIX_TIMESTAMP(closed_at) - UNIX_TIMESTAMP(opened_at)
			  when date(opened_at) = dt.calendar_date then 24*60*60 - time_to_sec(time(opened_at))
              when date(closed_at) = dt.calendar_date then time_to_sec(time(closed_at))
              else 24*60*60  	end
		)
    ) time_diff_sec
From   ( select sys_id,opened_at , closed_at  from meritsa_mdsdb.problem_final ) f
join meritsa_mdwdb.d_calendar_date dt
    on dt.calendar_date between date(opened_at) and date(closed_at)
group by  sys_id,opened_at, closed_at
) src on src.sys_id=trgt.row_id
where trgt.opened_to_close_duration_no_weekend_c<> src.time_diff_sec 