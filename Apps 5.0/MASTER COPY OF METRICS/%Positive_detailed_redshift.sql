select	sum(a11.positive_response) /sum(a11.row_key)
from	ldb.f_incident_response	a11
join ldb.d_calendar_date a112 
on (a11.requested_on_key = a112.row_key) 
where a112.lagging_count_of_days between 0 and 29 