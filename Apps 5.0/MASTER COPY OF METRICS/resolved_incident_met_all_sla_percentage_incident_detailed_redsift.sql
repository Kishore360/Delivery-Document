SELECT 
(a.resolved_incident_met_all_sla/b.resolved_incident)*100*1.0 as resolved_incident_met_all_sla_percentage
FROM 
(select	count(a11.row_key) AS resolved_incident_met_all_sla
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.last_resolved_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 11) 
) a 
CROSS JOIN 
(select	count(a11.row_key) AS resolved_incident
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
) b 