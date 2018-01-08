select	count(a11.row_key) AS Resolved_Incidents_Local_support_Needed
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_internal_organization_group	a14
	  on 	(a11.assignment_group_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
	join	ldb.d_incident_close_code	a16
	  on 	(a13.close_code_src_key = a16.row_key)
where	((a16.source_dimension_code = 'Solved (Permanently)'
 or a16.source_dimension_code = 'Solved (Work Around)')
 and a14.organization_name <> 'Virteva Level 1'
 and a15.lagging_count_of_month between 0 and 11)