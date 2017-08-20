select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_access_application_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_access_application_c a18 
on (a11.application_c_key = a18.row_key) 
union
select 'ldb.d_configuration_application_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_configuration_application_c a19 
on (a11.cmdb_ci_c_key = a19.row_key) 
union
select 'ldb.d_variable_lov_c_access_action a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_variable_lov_c_access_action a110 
on (a11.access_action_c_key = a110.row_key) 
union
select 'ldb.d_access_environments_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_access_environments_c a113 
on (a11.environment_c_key = a113.row_key) 
union
select 'ldb.d_internal_organization_group_request_task_assignment_group_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group_request_task_assignment_group_c a118 
on (a11.request_task_assignment_group_c_key = a118.row_key) 
union
select 'ldb.d_internal_organization_group_request_item_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_configuration_application_c a19 
on (a11.cmdb_ci_c_key = a19.row_key) 
join ldb.d_internal_organization_group_request_item_c a122 
on (a19.support_group_key = a122.row_key) 
