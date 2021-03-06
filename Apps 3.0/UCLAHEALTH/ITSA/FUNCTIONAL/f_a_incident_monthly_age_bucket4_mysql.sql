SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.'
ELSE 'Data Matched' END AS Message
FROM (
select count(*) as cnt
from
 
(SELECT  mon.row_key as month_start_date_key,
       open_task_fss.ticket_type,
       open_task_fss.assignment_group_key,
       open_task_fss.assigned_to_key,
       SUM(CASE WHEN (open_task_fss.opened_on_key BETWEEN mon.month_start_date_key AND mon.month_end_date_key) and 
       (open_task_fss.closed_on_key is null) and (open_task_fss.age > 90) then 1 else 0 END ) AS 'age_bucket4'
                   FROM uclahealth_mdwdb.d_calendar_date mon
JOIN (select f.*,d.ticket_type from uclahealth_mdwdb.f_incident f
	join uclahealth_mdwdb.d_incident d 
on (d.row_key=f.incident_key AND f.source_id = d.source_id)) open_task_fss  ON 
(open_task_fss.opened_on_key  BETWEEN mon.month_start_date_key AND mon.month_end_date_key
OR open_task_fss.closed_on_key BETWEEN mon.month_start_date_key AND mon.month_end_date_key
)
AND open_task_fss.soft_deleted_flag = 'N'
WHERE mon.month_start_date_key = mon.row_key
  AND mon.source_id = 0
  AND mon.calendar_date <= now()
GROUP BY mon.row_key,open_task_fss.ticket_type,
         open_task_fss.assignment_group_key,
         open_task_fss.assigned_to_key ) a
join
uclahealth_mdwdb.f_a_incident_monthly b
on a.ticket_type=b.ticket_type_c and
a.assigned_to_key=b.assigned_to_key
and a.assignment_group_key=b.assignment_group_key
and a.month_start_date_key=b.a_key
where
a.age_bucket4<>b.age_bucket4)a;


