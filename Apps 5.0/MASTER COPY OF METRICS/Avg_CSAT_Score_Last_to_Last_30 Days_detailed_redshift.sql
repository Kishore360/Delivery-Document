select (a.x/b.y)*1 from 
(select sum(a11.response_value) as x
from ldb.f_incident_response a11 
join ldb.d_calendar_date a112 
on (a11.requested_on_key = a112.row_key) 
where a112.lagging_count_of_days between 30 and 59 
)a
cross join 
(select count(a11.row_key) as y
from ldb.f_incident_response a11 
join ldb.d_calendar_date a112 
on (a11.requested_on_key = a112.row_key) 
where a112.lagging_count_of_days between 30 and 59 )b