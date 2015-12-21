select  b.source_dimension_name , count(1) 
from ldb.f_incident a
 join ldb.d_incident_outage_type_c b
on a.outage_type_c_key=b.row_key
 join	ldb.d_calendar_date	A14
	  on 	(a.last_resolved_on_key = a14.row_key)
	  join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11
group by 1;