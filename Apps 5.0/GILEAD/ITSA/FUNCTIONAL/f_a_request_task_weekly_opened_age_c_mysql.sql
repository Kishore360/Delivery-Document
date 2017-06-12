SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt
from 

(SELECT  mon.row_key as week_start_date_key,
       req_task.assignment_group_key,
       req_task.assigned_to_key,
      SUM(CASE WHEN req_task.opened_on_key BETWEEN mon.week_start_date_key AND mon.week_end_date_key then req_task.age_c else 0 END) as opened_age_c
FROM gilead_mdwdb.d_calendar_date mon
JOIN gilead_mdwdb.f_request_task req_task  ON (req_task.opened_on_key  BETWEEN
mon.week_start_date_key AND mon.week_end_date_key
OR req_task.closed_on_key BETWEEN mon.week_start_date_key AND mon.week_end_date_key
)
AND req_task.soft_deleted_flag = 'N'
WHERE mon.week_start_date_key = mon.row_key
  AND mon.source_id = 0
  AND mon.calendar_date <= now()
GROUP BY mon.row_key,
         req_task.assignment_group_key,
         req_task.assigned_to_key ) a
join
gilead_mdwdb.f_a_request_task_weekly b
on a.assigned_to_key=b.assigned_to_key
and a.assignment_group_key=b.assignment_group_key
and a.week_start_date_key=b.a_key
where 
a.opened_age_c<>b.opened_age_c)a
