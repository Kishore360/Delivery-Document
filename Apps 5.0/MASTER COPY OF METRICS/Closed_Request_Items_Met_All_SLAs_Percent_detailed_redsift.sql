
select coalesce(Closed_Request_Items_Met_All_SLAs/Closed_Request_Items_C,0)as Closed_Request_Items_Met_All_SLAs_Percent
from (
select	count(a11.row_key) AS Closed_Request_Items_Met_All_SLAs
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 11)  )a
cross join 
(select	count(a11.row_key) AS Closed_Request_Items_C
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11  )b






 



