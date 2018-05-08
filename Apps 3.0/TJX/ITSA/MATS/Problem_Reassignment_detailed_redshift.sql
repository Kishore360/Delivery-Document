select 'ldb.f_problem' as Table_Name, count(a11.row_key) Row_Count
from	ldb.f_problem_activity_c	a11
union
select	  'ldb.d_activity_priority_from_c' as Table_Name, count(a11.row_key) Row_Count
	  	from	ldb.f_problem_activity_c	a11
	join	ldb.d_problem_priority_from_c	a17
	  on 	(a11.from_priority_key = a17.row_key)	
	  union
	  select	  'ldb.d_activity_priority_to_c' as Table_Name, count(a11.row_key) Row_Count
	  	from	ldb.f_problem_activity_c	a11
	join	ldb.d_problem_priority_to_c	a17
	  on 	(a11.to_priority_key = a17.row_key)	
	  union
	  select	  'ldb.d_internal_contact_activity_change_user_c' as Table_Name, count(a11.row_key) Row_Count
	  	from	ldb.f_problem_activity_c	a11
	
	join	ldb.d_internal_contact_activity_change_user_c	a177
	  on 	(a11.change_by_user_c_key = a177.row_key)	
	  	  union
select	  'ldb.d_internal_organization_activity_change_group_c' as Table_Name, count(a11.row_key) Row_Count
	  	from	ldb.f_problem_activity_c	a11
	join	ldb.d_internal_organization_activity_change_group_c	a115
	  on 	(a11.assignment_group_on_change_c_key = a115.row_key)
	  union
	  select	  'ldb.d_problem_gps_reporting_group_c' as Table_Name, count(a11.row_key) Row_Count
	  	from	ldb.f_problem_activity_c	a11
	join	ldb.d_problem_gps_reporting_group_c	a17
	  on 	(a11.gps_reporting_group_c_key = a17.row_key)
	  
