
select 'ldb.f_request_task' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_task       a11 
union
select'ldb.d_internal_contact_cost_center_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_task       a11 
left outer join  ldb.d_internal_contact_cost_center_c       a14
on (a11.requested_for_c_key=a14.row_key)
union
select'ldb.d_request_task_agebucket_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_task       a11 
left outer join  ldb.d_request_task_agebucket_c       a112
on (a11.request_task_age_c_key=a112.row_key)
union
select'ldb.d_cost_center' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_task       a11 
 left outer join  ldb.d_internal_contact_cost_center_c       a14
on (a11.requested_for_c_key=a14.row_key)
left outer join   ldb.d_cost_center       a115
on (a14.cost_center_c_key=a115.row_key)
union
select'ldb.d_internal_contact_request_task_assigned_to_manager_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_task       a11 
 left outer join  ldb.d_internal_contact_assigned_to       a18
on (a11.assigned_to_key=a18.row_key)
left outer join  ldb.d_internal_contact_request_task_assigned_to_manager_c       a116
on (a18.employee_manager_c_key=a116.row_key)




