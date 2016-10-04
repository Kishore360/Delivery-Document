SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt
from 

(SELECT  mon.row_key as week_start_date_key,
       open_task_fss.assignment_group_key,
       open_task_fss.assigned_to_key,
       SUM(CASE WHEN open_task_fss.opened_on_key BETWEEN mon.week_start_date_key AND mon.week_end_date_key then open_task_fss.age else 0 END ) AS opened_age
	   FROM gilead_mdwdb.d_calendar_date mon
JOIN gilead_mdwdb.f_task_fss_c open_task_fss  ON (open_task_fss.opened_on_key  BETWEEN
mon.week_start_date_key AND mon.week_end_date_key
OR open_task_fss.closed_on_key BETWEEN mon.week_start_date_key AND mon.week_end_date_key
)
AND open_task_fss.soft_deleted_flag = 'N'
WHERE mon.week_start_date_key = mon.row_key
  AND mon.source_id = 0
  AND mon.calendar_date <= now()
GROUP BY mon.row_key,
         open_task_fss.assignment_group_key,
         open_task_fss.assigned_to_key ) a
join
gilead_mdwdb.f_a_task_fss_c_weekly b
on a.assigned_to_key=b.assigned_to_key
and a.assignment_group_key=b.assignment_group_key
and a.week_start_date_key=b.a_key
where 
a.opened_age<>b.opened_age)a