
select	count(a11.row_key) AS Missed_SLA_With_Pause
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.met_sla_with_pause_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 11)