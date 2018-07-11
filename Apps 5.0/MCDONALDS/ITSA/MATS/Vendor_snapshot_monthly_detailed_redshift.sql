select count(1)
from	ldb.n_incident_vdr_io_snapshot_monthly_c	a11
	join	ldb.d_calendar_month	a12
	  on 	(a11.month_start_key = a12.row_key)
	  join	ldb.d_internal_contact_group_vendor_name_c	a13
	  on 	(a11.assigned_to_key = a13.row_key)
	  join	ldb.d_business_service	a14
	  on 	(a11.business_service_key = a14.row_key)
	  join	ldb.d_incident_priority	a15
	  on 	(a11.priority_src_key = a15.row_key)
	  join	ldb.d_lov_snapshot_incident_agebucket_c	a16
	  on 	(a11.age_key = a16.row_key)