select	(sum(a11.uk_business_duration_c) / 3600.0) AS Incident_UK_Open_to_Close_Business_Duration_Hrs
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11