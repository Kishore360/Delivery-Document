select  c.source_dimension_name , count(1)
from ldb.f_incident a
inner join ldb.d_location b
on a.location_key=b.row_key 
inner join ldb.d_brand_c c
on b.brand_c_key=c.row_key
join	ldb.d_calendar_date	A14
	  on 	(a.opened_on_key = a14.row_key)
	  join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11
group by 1;


select  c.source_dimension_name , count(1)
from ldb.f_incident_closed a
inner join ldb.d_location b
on a.location_key=b.row_key 
inner join ldb.d_brand_c c
on b.brand_c_key=c.row_key
join	ldb.d_calendar_date	A14
	  on 	(a.closed_on_key = a14.row_key)
	  join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11
group by 1;


select  c.source_dimension_name , count(1)
from ldb.f_incident_resolved a
inner join ldb.d_location b
on a.location_key=b.row_key 
inner join ldb.d_brand_c c
on b.brand_c_key=c.row_key
join	ldb.d_calendar_date	A14
	  on 	(a.resolved_on_key = a14.row_key)
	  join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11
group by 1;