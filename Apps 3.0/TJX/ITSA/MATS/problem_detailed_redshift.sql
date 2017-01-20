select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
from	ldb.f_problem	a11
	
	join	ldb.d_problem_agebucket_c	a117
	  on 	(a11.age_c_key = a117.row_key)
	  union
	  select 'ldb.d_problem_gps_reporting_group_c' as Table_Name, count(a11.row_key) Row_Count	  
	from	ldb.f_problem	a11
	join	ldb.d_problem_gps_reporting_group_c	a118
	  on 	(a11.gps_reporting_group_c_key = a118.row_key)
	