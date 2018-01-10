select planned_duration-actual_duration as Deviation_Duration from (
select	sum((a11.planned_duration / 86400.0)) AS planned_duration,
	sum((a11.actual_duration / 86400.0)) AS actual_duration
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11)z