-- MTTC (SECS) VALUE IS MATCHING BUT DECIMAL PLACES SHOWN WHICH IS NOT REQUIRED-- 

select	'Closed Walkup'as metrics,count(a11.row_key) AS value
from	ldb.f_walk_up_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11

union
select	'Create to Close Duration(Secs)'as metrics,sum(a11.open_to_close_duration) AS value
from	ldb.f_walk_up_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select 'MTTC(secs)' as metrics,a.value1/b.value2 as value from 
(select	sum(a11.open_to_close_duration) AS value1
from	ldb.f_walk_up_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11)a 
cross join 
(select	count(a11.row_key) AS value2
from	ldb.f_walk_up_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11)b 
union
select	'OPened Walkup'as metrics,count(a11.row_key) AS value
from	ldb.f_walk_up_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11