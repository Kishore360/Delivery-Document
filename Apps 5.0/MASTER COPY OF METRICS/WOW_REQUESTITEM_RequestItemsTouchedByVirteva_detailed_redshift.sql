select 'Request Items Touched By Virteva'as Metric_Name, count( a11.row_key )
from ldb.f_request_item a11
join	ldb.d_sd_flag_c	a12
	  on 	(a11.touched_by_virteva_c_flag_key = a12.row_key)
join   ldb.d_calendar_date  A14
         on   (a11. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where	a12.flag_id = 'Y'  and   a15.lagging_count_of_month between 0 and 11;
