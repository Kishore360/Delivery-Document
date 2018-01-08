SELECT 
a.open_to_resolve_duration/b.resolved_incidents as MTTR_RTM
FROM 
(select	sum((a11.open_to_resolve_duration / 86400.0)) AS open_to_resolve_duration
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_rolling_three_months	a13
	  on 	(a12.month_start_date_key = a13.previousmonth)
	join	ldb.d_incident	a14
	  on 	(a11.incident_key = a14.row_key)
	join	ldb.d_incident_state	a15
	  on 	(a14.state_src_key = a15.row_key)
where	a15.wh_dimension_code in ('RESOLVED', 'CLOSED')  
and a12.lagging_count_of_month between 0 and 11) a 
CROSS JOIN 
(select	count(a11.row_key) AS resolved_incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_rolling_three_months	a13
	  on 	(a12.month_start_date_key = a13.previousmonth) 
 where  (a12.lagging_count_of_month between 0 and 11) 
) b;
