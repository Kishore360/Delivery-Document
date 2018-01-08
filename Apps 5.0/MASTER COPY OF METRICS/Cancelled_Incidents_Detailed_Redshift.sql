select	count(a11.row_key) AS Cancelled_Incidents
from	ldb.f_incident_closed	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.closed_on_key = a13.row_key)
	join	ldb.d_incident_close_code	a14
	  on 	(a12.close_code_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a13.month_start_date_key = a15.row_key)
where	(a14.source_dimension_code = 'Not Solved (Cancelled)'
 and a15.lagging_count_of_month between 0 and 11)