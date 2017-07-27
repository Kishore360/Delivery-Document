select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
from	ldb.f_incident_activity	a11
	
	union
select	'ldb.d_incident_type_c' as Table_Name, count(a11.row_key) Row_Count
	from	ldb.f_incident_activity	a11
	join	ldb.d_incident	a17
	  on 	(a11.incident_key = a17.row_key)
	join	ldb.d_incident_type_c	a114
	  on 	(a17.incident_type_c_key = a114.row_key)
	  union
select	  'ldb.d_internal_organization_activity_change_group_c' as Table_Name, count(a11.row_key) Row_Count
	  	from	ldb.f_incident_activity	a11
	join	ldb.d_incident	a17
	  on 	(a11.incident_key = a17.row_key)
	join	ldb.d_internal_organization_activity_change_group_c	a115
	  on 	(a17.priority_change_by_assignment_group_c_key = a115.row_key)
	  union
select	  'ldb.d_internal_contact_activity_assigned_to_c' as Table_Name, count(a11.row_key) Row_Count
	  	from	ldb.f_incident_activity	a11
	join	ldb.d_incident	a17
	  on 	(a11.incident_key = a17.row_key)	  
	join	ldb.d_internal_contact_activity_assigned_to_c	a116
	  on 	(a17.priority_change_by_use_c_key = a116.row_key)
union
select	  'ldb.d_activity_priority_from_c' as Table_Name, count(a11.row_key) Row_Count
	  	from	ldb.f_incident_activity	a11
	join	ldb.d_activity_priority_from_c	a17
	  on 	(a11.from_priority_key = a17.row_key)	
	  union
	  select	  'ldb.d_activity_priority_to_c' as Table_Name, count(a11.row_key) Row_Count
	  	from	ldb.f_incident_activity	a11
	join	ldb.d_activity_priority_to_c	a17
	  on 	(a11.to_priority_key = a17.row_key)	
	  union
	  select	  'ldb.d_internal_contact_activity_change_user_c' as Table_Name, count(a11.row_key) Row_Count
	  	from	ldb.f_incident_activity	a11
	
	join	ldb.d_internal_contact_activity_change_user_c	a177
	  on 	(a11.change_by_user_c_key = a177.row_key)	

