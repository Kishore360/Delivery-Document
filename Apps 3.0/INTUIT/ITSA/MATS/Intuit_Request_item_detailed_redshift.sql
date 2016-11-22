select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_task_contacttype_req_item_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_task_contacttype_req_item_c a114 
on (a11.reported_type_src_c_key = a114.row_key) 
union
select 'ldb.d_internal_contact_manager_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
join ldb.d_internal_contact_manager_c a122 
on (a14.manager_c_key = a122.row_key) 
