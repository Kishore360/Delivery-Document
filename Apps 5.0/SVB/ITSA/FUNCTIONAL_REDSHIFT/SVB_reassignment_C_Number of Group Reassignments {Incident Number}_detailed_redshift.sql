select a11.incident_key,
max(a13.incident_number) AS incident_number,
	max(a13.reassignment_count_numerify) AS WJXBFS1
from	ldb.f_incident_activity	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.assigned_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	a14.lagging_count_of_month between 0 and 12
group by 1
