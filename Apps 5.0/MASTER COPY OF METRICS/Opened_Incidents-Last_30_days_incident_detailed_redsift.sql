
select	count(a11.row_key) AS Opened_Incidents_Last_30_days
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	(a12.lagging_count_of_days between 0 and 29
