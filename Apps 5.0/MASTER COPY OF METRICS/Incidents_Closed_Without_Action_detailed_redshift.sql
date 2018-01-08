select	(count((CASE WHEN a13.closed_without_intervention_flag = 'Y' THEN a11.row_key ELSE NULL END))+
	count((CASE WHEN a13.duplicate_incident_flag = 'Y' THEN a11.row_key ELSE NULL END)))*1.0 AS "Incidents Closed Without Action"
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a14.lagging_count_of_month between 0 and 11
 and (a13.closed_without_intervention_flag = 'Y'
 or a13.duplicate_incident_flag = 'Y')) 
