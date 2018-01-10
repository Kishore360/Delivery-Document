select	count(a11.fulfilled_on_c_key) AS Fulfilled_Request_Item
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11