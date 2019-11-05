select 'ldb.f_change_failure a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
union
select 'ldb.d_change_failure a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
 join ldb.d_change_failure a12 
       on (a11.change_failure_key = a12.row_key)  
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
 join ldb.d_configuration_item a13 
       on (a11.ci_key = a13.row_key)  
union
select 'ldb.d_change_request a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
 join ldb.d_change_request a14 
       on (a11.change_request_key = a14.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
 join ldb.d_internal_contact_assigned_to a15 
       on (a11.assigned_to_key = a15.row_key)  
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
 join ldb.d_internal_organization_group a16 
       on (a11.assignment_group_key = a16.row_key)  
union
select 'ldb.d_change_request_state a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
 join ldb.d_change_request_state a17 
       on (a11.change_state_src_key = a17.row_key)  
union
select 'ldb.d_change_request_close_code a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
 join ldb.d_change_request a14 
 on (a11.change_request_key = a14.row_key) 
       join ldb.d_change_request_close_code a18 
       on (a14.close_code_src_key = a18.row_key)  
union
select 'ldb.d_change_request_backout_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
 join ldb.d_change_request a14 
 on (a11.change_request_key = a14.row_key) 
       join ldb.d_change_request_backout_c a19 
       on (a14.change_request_backout_c_key = a19.row_key)  
union
select 'ldb.d_change_request_substate_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
 join ldb.d_change_request a14 
 on (a11.change_request_key = a14.row_key) 
       join ldb.d_change_request_substate_c a110 
       on (a14.change_request_substate_c_key = a110.row_key)  



