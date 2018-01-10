select	count(a11.fulfilled_on_c_key) AS INT_FTR
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_request_item	a12
	  on 	(a11.request_item_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.fulfilled_on_c_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.international_first_time_resolution_flag_c = 'Y'
 and a14.lagging_count_of_month between 0 and 11)