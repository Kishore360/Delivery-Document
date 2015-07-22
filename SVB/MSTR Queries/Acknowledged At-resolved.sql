
select  d.Calendar_Date, count(1) 
from ldb.f_incident a
join d_calendar_date_acknowledged_at_c d
on a.acknowledged_at_c_key=d.row_key
join	ldb.d_calendar_date	A14
	  on 	(a.last_resolved_on_key = a14.row_key)
	  join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11
group by 1;