select 'ldb.d_internal_organization_group	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_internal_organization_group	a11 
union
select 'ldb.d_h_all_hierarchies_transpose_c	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_internal_organization_group	a11 
join	ldb.d_h_all_hierarchies_transpose_c	a12 
on (a11.manager_c_key = a12.lower_key) 
union
select 'ldb.d_internal_contact_assignment_group_hie_manager_c	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_internal_organization_group	a11 
join	ldb.d_h_all_hierarchies_transpose_c	a12 
on (a11.manager_c_key = a12.lower_key) 
join	ldb.d_internal_contact_assignment_group_hie_manager_c	a13 
on (a12.upper_key = a13.row_key) 