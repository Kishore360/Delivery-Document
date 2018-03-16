-- Avg Durationfor Current Group(hours),Avg Durationfor new assignee(hours) --
select '# of handoffs (assignee)' as metrics,max(a11.reassignee_count_c) as value
from ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12

union
select '# of reassignments (group)' as metrics,max(a11.reassignment_count_numerify_c) as value
from ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12

union
select 'Avg Durationfor Current Group(hours)' as metrics,avg(a11.duration_on_my_plate_c/3600.0) as value --*** data not matching
from ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12
union
select 'Avg Durationfor new assignee(hours)' as metrics,avg(a11.duration_on_my_plate_c/3600.0) as value --*** data not matching
from ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12

union
select 'Duration(hours)' as metrics,max(a11.duration_on_my_plate_c/3600.0) as value
from ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12
