select	count(a11.row_key) AS Incidents_Touched_By_Virteva
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
	join	ldb.d_flag_c	a14
	  on 	(a11.touched_by_virteva_c_flag_key = a14.row_key)
where	(a14.flag_id = 'Y'
 and a13.lagging_count_of_month between 0 and 11)