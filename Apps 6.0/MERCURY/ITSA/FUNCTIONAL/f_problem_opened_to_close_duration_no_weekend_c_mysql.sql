 SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
From mercury_mdwdb.f_problem trgt
INNER JOIN 
(
Select
    sys_id,CONVERT_TZ(opened_at, 'GMT','America/Los_Angeles'), CONVERT_TZ(closed_at, 'GMT','America/Los_Angeles'),
                (sum(case when dt.day_of_week in (6,7) then 0
                                                  when date(CONVERT_TZ(opened_at, 'GMT','America/Los_Angeles')) = date(CONVERT_TZ(closed_at, 'GMT','America/Los_Angeles')) then UNIX_TIMESTAMP(CONVERT_TZ(closed_at, 'GMT','America/Los_Angeles')) - UNIX_TIMESTAMP(CONVERT_TZ(opened_at, 'GMT','America/Los_Angeles'))
                                                  when date(CONVERT_TZ(opened_at, 'GMT','America/Los_Angeles')) = dt.calendar_date then 24*60*60 - time_to_sec(time(CONVERT_TZ(opened_at, 'GMT','America/Los_Angeles')))
              when date(CONVERT_TZ(closed_at, 'GMT','America/Los_Angeles')) = dt.calendar_date then time_to_sec(time(CONVERT_TZ(closed_at, 'GMT','America/Los_Angeles')))
              else 24*60*60  end
                                )
    ) time_diff_sec
From   ( select sys_id, opened_at  , closed_at  from mercury_mdsdb.problem_final  where cdctype = 'X') f
join mercury_mdwdb.d_calendar_date dt
    on dt.calendar_date between date(CONVERT_TZ(opened_at, 'GMT','America/Los_Angeles')) and date(CONVERT_TZ(closed_at, 'GMT','America/Los_Angeles'))
group by  sys_id,CONVERT_TZ(opened_at, 'GMT','America/Los_Angeles'), CONVERT_TZ(closed_at, 'GMT','America/Los_Angeles')
) src on src.sys_id=trgt.row_id
where trgt.opened_to_close_duration_no_weekend_c <> src.time_diff_sec
