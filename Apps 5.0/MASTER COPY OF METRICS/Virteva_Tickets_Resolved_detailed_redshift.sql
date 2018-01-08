select	count(a11.row_key) AS Virteva_Tickets_Resolved
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_internal_organization_group	a13
	  on 	(a11.assignment_group_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.organization_name = 'Virteva Level 1'
 and a14.lagging_count_of_month between 0 and 11)