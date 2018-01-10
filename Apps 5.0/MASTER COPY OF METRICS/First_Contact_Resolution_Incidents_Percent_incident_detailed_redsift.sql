SELECT 
(a.first_contact_resolution_c_flag/b.closed_incidents)*100*1.0 as First_Contact_Resolution_Incidents_Percent
FROM 
(select	count(a11.row_key) AS first_contact_resolution_c_flag
from	ldb.f_incident_closed	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.closed_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.first_contact_resolution_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 11 )
) a 
CROSS JOIN 
(select	count(a11.row_key) AS closed_incidents
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11 
) b 