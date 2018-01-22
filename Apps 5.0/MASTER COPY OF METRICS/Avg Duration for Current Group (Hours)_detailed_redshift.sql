
select a.x/b.y from 
(
select sum(a11.duration)/3600.0) as x
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
join ldb.d_internal_organization_group_to a19 
on (a11.to_assignment_group_key = a19.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12 )a
(select count(a11.row_key) as y
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
join ldb.d_internal_organization_group_to a19 
on (a11.to_assignment_group_key = a19.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12 )b
