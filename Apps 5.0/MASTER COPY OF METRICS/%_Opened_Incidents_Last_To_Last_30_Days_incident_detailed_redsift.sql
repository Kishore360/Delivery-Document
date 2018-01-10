
SELECT 
((b.opened_incidents_last_30_days-a.opened_incidents_last_to_last_30_days)/a.opened_incidents_last_to_last_30_days)*100*1.0 as resolved_incident_met_all_sla_percentage
FROM 
(select	count(a11.row_key) AS opened_incidents_last_to_last_30_days
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
where	a12.lagging_count_of_days between 30 and 59 
) a 
CROSS JOIN 
(select	count(a11.row_key) AS opened_incidents_last_30_days
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a12.lagging_count_of_days between 0 and 29

) b 