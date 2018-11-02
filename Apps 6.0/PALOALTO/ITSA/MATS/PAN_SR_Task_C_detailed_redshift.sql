select 'ldb.f_sr_task_c a11 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_service_request_c a14 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a14 
on (a11.service_request_c_key = a14.row_key) 
union
select 'ldb.d_sr_task_c a15 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_sr_task_c a15 
on (a11.sr_task_c_key = a15.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a16 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_contact_opened_by_c a16 
on (a11.opened_by_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a19 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_contact_closed_by_c a19 
on (a11.closed_by_key = a19.row_key) 
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_configuration_item a110 
on (a11.configuration_item_key = a110.row_key) 
union
select 'ldb.d_duration_c a111 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_duration_c a111 
on (a11.opened_by_employee_duration = a111.duration_c_key) 
union
select 'ldb.d_lov_service_request_category_c a112 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a14 
on (a11.service_request_c_key = a14.row_key) 
join ldb.d_lov_service_request_category_c a112 
on (a14.category_src_key = a112.row_key) 
union
select 'ldb.d_internal_organization_dpt_c  a113 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_sr_task_c a15 
on (a11.sr_task_c_key = a15.row_key) 
join ldb.d_internal_organization_dpt_c a113 
on (a15.department_key = a113.row_key) 
/*union
select 'ldb.d_internal_organization_group_parent_c a114 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
join ldb.d_internal_organization_group_parent_c a114 
on (a17.parent_row_key_c = a114.row_key)*/ 
union
select 'ldb.d_lov_service_request_priority_c a115 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a14 
on (a11.service_request_c_key = a14.row_key) 
join ldb.d_lov_service_request_priority_c a115 
on (a14.priority_src_key = a115.row_key) 
union
select 'ldb.d_lov_sr_task_state_c a116 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_sr_task_c a15 
on (a11.sr_task_c_key = a15.row_key) 
join ldb.d_lov_sr_task_state_c a116 
on (a15.state_src_key = a116.row_key) 
union
select 'ldb.d_lov_service_request_subcategory_c a117 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a14 
on (a11.service_request_c_key = a14.row_key) 
join ldb.d_lov_service_request_subcategory_c a117 
on (a14.subcategory_src_key = a117.row_key) 
union
select 'ldb.d_lov_service_request_type_c a118 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a14 
on (a11.service_request_c_key = a14.row_key) 
join ldb.d_lov_service_request_type_c a118 
on (a14.type_src_key = a118.row_key) 
union
select 'ldb.d_calendar_quarter a119 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a16 
on (a14.month_start_date_key = a16.row_key) 
join ldb.d_calendar_quarter a119 
on (a16.quarter_start_date_key = a119.row_key) 
union
select 'ldb.d_calendar_year a120 ' as Table_name, count(1) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_month a16 
on (a13.month_start_date_key = a16.row_key) 
join ldb.d_calendar_quarter a119 
on (a16.quarter_start_date_key = a119.row_key) 
join ldb.d_calendar_year a120 
on (a119.year_start_date_key = a120.row_key) 

