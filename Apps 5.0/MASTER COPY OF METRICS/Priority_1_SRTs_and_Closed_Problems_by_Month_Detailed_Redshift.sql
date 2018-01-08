select	count(a11.problem_key) AS Priority_1_SRTs_and_Closed_Problems_by_Month
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.open_closed_same_month_c = 'Y'
 and a14.lagging_count_of_month between 0 and 11)