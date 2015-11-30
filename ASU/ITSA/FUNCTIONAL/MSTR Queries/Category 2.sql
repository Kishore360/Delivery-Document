 Select a12.Source_dimension_name, count(a11.row_key) from ldb.f_incident a11 join ldb.d_incident_category2_c a12
 on a11.category_2_src_c_key= a12.row_key
join	ldb.d_calendar_date	A14
	  on 	(a11.last_resolved_on_key = a14.row_key)
	  join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11 
group by 1;
