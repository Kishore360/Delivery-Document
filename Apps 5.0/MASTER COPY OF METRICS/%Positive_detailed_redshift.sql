select a.x/b.y*1.0 from 
(select
sum(a11.positive_response)*1.0 as x
from	ldb.f_incident_response	a11
join ldb.d_calendar_date a112 
on (a11.requested_on_key = a112.row_key)
join ldb.d_calendar_month a113
on (a112.month_start_date_key=a113.row_key) 
where a113.lagging_count_of_months between 0 and 11 
)a
UNION
(select
count(a11.row_key)*1.0 as y
from	ldb.f_incident_response	a11
join ldb.d_calendar_date a112 
on (a11.requested_on_key = a112.row_key)
join ldb.d_calendar_month a113
on (a112.month_start_date_key=a113.row_key) 
where a113.lagging_count_of_months between 0 and 11)
b