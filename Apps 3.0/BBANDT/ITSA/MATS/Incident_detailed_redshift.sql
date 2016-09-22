select 'ldb.f_incident' as Table_name, count(a11.row_key) Row_Count
from      ldb.f_incident    a11
union
select 'ldb.d_assignment_group_manager_c' as Table_name, count(a11.row_key) Row_Count
from      ldb.f_incident    a11
join        ldb.d_internal_organization_group         a12
                  on         (a11.assignment_group_key = a12.row_key)
                join        ldb.d_assignment_group_manager_c     a13
                  on         (a12.manager_c_key = a13.row_key)
				  union
				  select 'd_incident_cause_code_c' as Table_name, count(a11.row_key) Row_Count
				  from      ldb.f_incident    a11
				     join        ldb.d_incident   a12
                  on         (a11.incident_key = a12.row_key)
                join        ldb.d_incident_cause_code_c    a13
                  on         (a12.cause_code_c_key = a13.row_key)
				  union
				  select 'd_incident_resolution_code_c' as Table_name, count(a11.row_key) Row_Count
				  from      ldb.f_incident    a11
				     join        ldb.d_incident   a12
                  on         (a11.incident_key = a12.row_key)
				   join        ldb.d_incident_resolution_code_c           a19
                  on         (a12.resolution_code_c_key = a19.row_key)
				  union
				  select 'd_incident_resolution_ci_c' as Table_name, count(a11.row_key) Row_Count
				  from      ldb.f_incident    a11
				  join        ldb.d_incident_resolution_ci_c a12
                  on         (a11.resolution_ci_c_key = a12.row_key)