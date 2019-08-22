select 'ldb.f_task_ci_c	a11 ' as Table_name, count(1) Row_Count
from ldb.f_task_ci_c	a11 
union
select 'ldb.d_task_ci_c	a12 ' as Table_name, count(1) Row_Count
from ldb.f_task_ci_c	a11 
join	ldb.d_task_ci_c	a12 
on (a11.task_ci_c_key = a12.row_key) 
union
select 'ldb.d_configuration_item	a13 ' as Table_name, count(1) Row_Count
from ldb.f_task_ci_c	a11 
join	ldb.d_configuration_item	a13 
on (a11.configuration_item_key = a13.row_key) 
union
select 'ldb.d_configuration_item_task_ci_c	a14 ' as Table_name, count(1) Row_Count
from ldb.f_task_ci_c	a11 
join	ldb.d_configuration_item_task_ci_c	a14 
on (a11.configuration_item_key = a14.row_key) 
union
select 'ldb.d_task	a15 ' as Table_name, count(1) Row_Count
from ldb.f_task_ci_c	a11 
join	ldb.d_task	a15 
on (a11.task_key = a15.row_key) 
union
select 'ldb.d_task_priority	a16 ' as Table_name, count(1) Row_Count
from ldb.f_task_ci_c	a11 
join	ldb.d_task	a15 
on (a11.task_key = a15.row_key) 
join	ldb.d_task_priority	a16 
on (a15.priority_src_key = a16.row_key) 
union
select 'ldb.d_internal_contact_owned_by_c	a17 ' as Table_name, count(1) Row_Count
from ldb.f_task_ci_c	a11 
join	ldb.d_configuration_item	a13 
on (a11.configuration_item_key = a13.row_key) 
join	ldb.d_internal_contact_owned_by_c	a17 
on (a13.owned_by_c_key = a17.row_key) 
union
select 'ldb.d_internal_organization_configuration_item_support_group_c	a18 ' as Table_name, count(1) Row_Count
from ldb.f_task_ci_c	a11 
join	ldb.d_configuration_item	a13 
on (a11.configuration_item_key = a13.row_key) 
join	ldb.d_internal_organization_configuration_item_support_group_c	a18 
on (a13.support_group_c_key = a18.row_key) 
union
select 'ldb.d_task_type	a19 ' as Table_name, count(1) Row_Count
from ldb.f_task_ci_c	a11 
join	ldb.d_task	a15 
on (a11.task_key = a15.row_key) 
join	ldb.d_task_type	a19 
on (a15.task_type_src_key = a19.row_key) 