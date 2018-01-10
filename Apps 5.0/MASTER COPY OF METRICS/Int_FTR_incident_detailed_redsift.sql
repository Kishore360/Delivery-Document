
select	count(a11.row_key) AS Int_FTR
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.last_resolved_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.international_first_time_resolution_flag_c = 'Y'
 and a14.lagging_count_of_month between 0 and 11)
