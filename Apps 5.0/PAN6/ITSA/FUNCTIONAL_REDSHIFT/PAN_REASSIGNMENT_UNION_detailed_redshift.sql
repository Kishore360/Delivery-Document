--Need to write seperate level metric Query for  Avg Duration for assignee,Avg Durationfor Assignment Group--

select 'Avg Duration for assignee' as metrics,avg(a11.duration_on_my_plate_c/3600.0) as value --*** data not matching
from ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12
UNION
select 'Avg Durationfor Assignment Group' as metrics,avg(a11.duration_on_my_plate_c/3600.0) as value --*** data not matching
from ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12
union


union
select 'Duration(hours)' as metrics,max(a11.duration_on_my_plate_c/3600.0) as value
from ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12
union
select 'Handoff Count(Assignee)' as metrics,max(a11.reassignee_count_c) as value
from ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12

union
select 'Reassignment Count (Group)' as metrics,max(a11.reassignment_count_numerify_c) as value
from ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12

union
SELECT 'Updates',SUM(a.update_count_c) as Updates
FROM ldb.f_t_task_activity_reassignment_c a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11