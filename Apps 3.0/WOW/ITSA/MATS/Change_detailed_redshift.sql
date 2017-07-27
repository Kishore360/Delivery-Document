select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
  join	ldb.d_change_request	a116
	  on 	(a11.change_request_key = a116.row_key)
  join        ldb.d_change_request_change_outcome_c	a136
	  on 	(a116.change_outcome_c_key = a136.row_key)              
	  union
				  select 'ldb.d_internal_contact_change_assigned_to_manager_c ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
   join        ldb.d_internal_contact_assigned_to       a15
                  on         (a11.assigned_to_key = a15.row_key)				  
				    join        ldb.d_internal_contact_change_assigned_to_manager_c              a125
                  on         (a15.employee_manager_c_key = a125.row_key)