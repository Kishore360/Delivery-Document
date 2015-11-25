select  d.Full_name, count(1) 
from ldb.f_incident a
join ldb.d_internal_contact_reported_by_c d
on a.reported_by_c_key = d.row_key
join	ldb.d_calendar_date	A14
	  on 	(a.closed_on_key = a14.row_key)
	  join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11
group by 1;