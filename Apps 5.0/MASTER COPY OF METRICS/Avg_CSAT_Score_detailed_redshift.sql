
select a.x/b.y*1.0 from 
(select sum(a11.response_value)*1.0 as x
from ldb.f_incident_response a11 
join ldb.d_calendar_date a112 
on (a11.requested_on_key = a112.row_key) 
where a112.lagging_count_of_month between 0 and 12 
)a
cross join 
(select count(a11.row_key)*1.0 as y
from ldb.f_incident_response a11 
join ldb.d_calendar_date a112 
on (a11.requested_on_key = a112.row_key) 
where a112.lagging_count_of_month between 0 and 12 )b