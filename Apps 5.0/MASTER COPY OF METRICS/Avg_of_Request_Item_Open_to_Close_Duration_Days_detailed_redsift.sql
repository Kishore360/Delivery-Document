select	sum((a11.open_to_close_duration / 86400.0))/count(a11.row_key) AS Avg_of_Request_Item_Open_to_Close_Duration_Days
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
