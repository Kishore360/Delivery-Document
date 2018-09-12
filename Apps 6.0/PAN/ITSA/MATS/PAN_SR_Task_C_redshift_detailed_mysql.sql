select 'ldb.f_sr_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
union
select 'ldb.d_internal_organization_group_parent_internal_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_organization_group_parent_internal_c a12 
on (a11.assignment_group_c_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
union
select 'ldb.d_service_request_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a16 
on (a11.service_request_c_key = a16.row_key) 
union
select 'ldb.d_sr_task_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_sr_task_c a17 
on (a11.sr_task_c_key = a17.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_contact_opened_by_c a18 
on (a11.opened_by_key = a18.row_key) 
union
select 'ldb.d_calendar_week a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_week a19 
on (a13.week_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_year a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
join ldb.d_calendar_year a110 
on (a15.year_start_date_key = a110.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_contact_assigned_to a111 
on (a11.assigned_to_key = a111.row_key) 
union
select 'ldb.d_internal_organization_group a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_organization_group a112 
on (a11.assignment_group_key = a112.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_contact_closed_by_c a113 
on (a11.closed_by_key = a113.row_key) 
union
select 'ldb.d_configuration_item a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_configuration_item a114 
on (a11.configuration_item_key = a114.row_key) 
union
select 'ldb.d_duration_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_duration_c a115 
on (a11.opened_by_employee_duration = a115.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_organization_group_parent_internal_c a12 
on (a11.assignment_group_c_key = a12.row_key) 
join ldb.d_internal_organization_group_parent_c a116 
on (a12.parent_row_c_key = a116.row_key) 
union
select 'ldb.d_flag_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_flag_c a117 
on (a11.sd_touch_flag_c_key = a117.row_key) 
union
select 'ldb.d_lov_service_request_category_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a16 
on (a11.service_request_c_key = a16.row_key) 
join ldb.d_lov_service_request_category_c a118 
on (a16.category_src_key = a118.row_key) 
union
select 'ldb.d_internal_organization_dpt_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_sr_task_c a17 
on (a11.sr_task_c_key = a17.row_key) 
join ldb.d_internal_organization_dpt_c a119 
on (a17.department_key = a119.row_key) 
union
select 'ldb.d_lov_service_request_priority_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a16 
on (a11.service_request_c_key = a16.row_key) 
join ldb.d_lov_service_request_priority_c a120 
on (a16.priority_src_key = a120.row_key) 
union
select 'ldb.d_lov_sr_task_state_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_sr_task_c a17 
on (a11.sr_task_c_key = a17.row_key) 
join ldb.d_lov_sr_task_state_c a121 
on (a17.state_src_key = a121.row_key) 
union
select 'ldb.d_lov_service_request_subcategory_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a16 
on (a11.service_request_c_key = a16.row_key) 
join ldb.d_lov_service_request_subcategory_c a122 
on (a16.subcategory_src_key = a122.row_key) 
union
select 'ldb.d_lov_service_request_type_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a16 
on (a11.service_request_c_key = a16.row_key) 
join ldb.d_lov_service_request_type_c a123 
on (a16.type_src_key = a123.row_key) 
