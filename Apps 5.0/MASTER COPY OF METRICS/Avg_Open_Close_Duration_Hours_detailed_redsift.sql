select	sum((a11.open_to_close_duration / 3600))/ count(a11.row_key) 	as Avg_Open_Close_Duration_Hours
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11