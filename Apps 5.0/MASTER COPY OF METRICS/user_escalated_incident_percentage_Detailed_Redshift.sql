SELECT 
(a.standard_incident_status_count/b.Incident_resolved_closed)*100 as user_escalated_incident_percentage
FROM 
(select	count(a11.row_key) AS standard_incident_status_count
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.u_status_update_count_c >=  1
 and a13.u_major_c = 'N'
 and a14.lagging_count_of_month between 0 and 11)
) a 
CROSS JOIN 
(select	count(a11.row_key) AS Incident_resolved_closed
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_incident_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a14.wh_dimension_code in ('RESOLVED', 'CLOSED')
 and a15.lagging_count_of_month between 0 and 11)  
) b;
