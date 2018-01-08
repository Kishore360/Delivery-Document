select	count(a11.row_key) AS Reopened_Incidents_Missed_Any_SLA
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_flag = 'Y'
 and a13.overall_sla_outcome_flag = 'N'
 and a14.lagging_count_of_month between 0 and 11)