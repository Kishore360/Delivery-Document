select sum(a11.update_count)
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12	