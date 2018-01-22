
select a.x/b.y from 
(select sum(a11.duration)/86400.0) as x
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
join ldb.d_internal_contact_to a18 
on (a12.to_assigned_to_key = a18.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12 )a
cross join
(select count(a11.row_key) as y
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
join ldb.d_internal_contact_to a18 
on (a12.to_assigned_to_key = a18.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12 )b
