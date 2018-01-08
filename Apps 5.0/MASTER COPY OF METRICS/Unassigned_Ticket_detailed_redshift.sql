select	count(a11.row_key) AS Unassigned_Ticket
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_incident_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_internal_contact_assigned_to	a15
	  on 	(a11.assigned_to_key = a15.row_key)
	join	ldb.d_calendar_month	a16
	  on 	(a12.month_start_date_key = a16.row_key)
where	(a15.full_name = 'UNSPECIFIED'
 and a14.wh_dimension_code in ('RESOLVED', 'CLOSED')
 and a16.lagging_count_of_month between 0 and 11)