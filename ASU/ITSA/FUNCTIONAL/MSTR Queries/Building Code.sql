Select a12.building_code_c, count(a11.row_key) from ldb.f_incident a11 join ldb.d_location a12
 on a11.location_key = a12.row_key
join	ldb.d_calendar_date	A14
	  on 	(a11.last_resolved_on_key = a14.row_key)
	  join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11 
group by 1;