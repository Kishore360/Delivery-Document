select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
from	ldb.f_incident	a11
	
	union
select	'ldb.d_incident_type_c' as Table_Name, count(a11.row_key) Row_Count
	from	ldb.f_incident	a11
	join	ldb.d_incident	a17
	  on 	(a11.incident_key = a17.row_key)
	join	ldb.d_incident_type_c	a114
	  on 	(a17.incident_type_c_key = a114.row_key)
	  union
select	  'ldb.d_internal_organization_incident_priority_change_group_c' as Table_Name, count(a11.row_key) Row_Count
	  	from	ldb.f_incident	a11
	join	ldb.d_incident	a17
	  on 	(a11.incident_key = a17.row_key)
	join	ldb.d_internal_organization_incident_priority_change_group_c	a115
	  on 	(a17.priority_change_by_assignment_group_c_key = a115.row_key)
	  union
select	  'ldb.d_internal_contact_priority_assignment_user_c' as Table_Name, count(a11.row_key) Row_Count
	  	from	ldb.f_incident	a11
	join	ldb.d_incident	a17
	  on 	(a11.incident_key = a17.row_key)	  
	join	ldb.d_internal_contact_priority_assignment_user_c	a116
	  on 	(a17.priority_change_by_use_c_key = a116.row_key)

