select 'ldb.f_sr_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
join ldb.d_calendar_month a13 
on (a12.month_start_date_key = a13.row_key) 
union
select 'ldb.d_calendar_quarter a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) join ldb.d_calendar_month a13 
on (a12.month_start_date_key = a13.row_key) 
join ldb.d_calendar_quarter a14 
on (a13.quarter_start_date_key = a14.row_key) 
union
select 'ldb.d_sr_task_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_sr_task_c a15 
on (a11.sr_task_c_key = a15.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_contact_opened_by_c a16 
on (a11.opened_by_key = a16.row_key) 
union
select 'ldb.d_calendar_date_fiscal a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date_fiscal a17 
on (a11.fiscal_date_key = a17.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date_fiscal a17 
on (a11.fiscal_date_key = a17.row_key) 
join ldb.d_calendar_fiscal_quarter a18 
on (a17.quarter_start_date_key = a18.row_key) 
union
select 'ldb.d_calendar_fiscal_year a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date_fiscal a17 
on (a11.fiscal_date_key = a17.row_key) 
join ldb.d_calendar_fiscal_year a19 
on (a17.year_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_week a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
join ldb.d_calendar_week a110 
on (a12.week_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) join ldb.d_calendar_month a13 
on (a12.month_start_date_key = a13.row_key) join ldb.d_calendar_quarter a14 
on (a13.quarter_start_date_key = a14.row_key) 
join ldb.d_calendar_year a111 
on (a14.year_start_date_key = a111.row_key) 
union
select 'ldb.d_internal_organization_group_parent_internal_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_organization_group_parent_internal_c a112 
on (a11.assignment_group_c_key = a112.row_key) 
union
select 'ldb.d_service_request_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a113 
on (a11.service_request_c_key = a113.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_contact_assigned_to a114 
on (a11.assigned_to_key = a114.row_key) 
union
select 'ldb.d_internal_organization_group a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_organization_group a115 
on (a11.assignment_group_key = a115.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_contact_closed_by_c a116 
on (a11.closed_by_key = a116.row_key) 
union
select 'ldb.d_configuration_item a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_configuration_item a117 
on (a11.configuration_item_key = a117.row_key) 
union
select 'ldb.d_duration_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_duration_c a118 
on (a11.opened_by_employee_duration_c = a118.row_key) 
union
select 'ldb.d_flag_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_flag_c a119 
on (a11.sd_touch_flag_c_key = a119.row_key) 
union
select 'ldb.d_internal_organization_dpt_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_sr_task_c a15 
on (a11.sr_task_c_key = a15.row_key) 
join ldb.d_internal_organization_dpt_c a120 
on (a15.department_key = a120.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_internal_organization_group_parent_internal_c a112 
on (a11.assignment_group_c_key = a112.row_key) 
join ldb.d_internal_organization_group_parent_c a121 
on (a112.parent_row_c_key = a121.row_key) 
union
select 'ldb.d_lov_service_request_category_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a113 
on (a11.service_request_c_key = a113.row_key) 
join ldb.d_lov_service_request_category_c a122 
on (a113.category_src_key = a122.row_key) 
union
select 'ldb.d_lov_service_request_priority_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a113 
on (a11.service_request_c_key = a113.row_key) 
join ldb.d_lov_service_request_priority_c a123 
on (a113.priority_src_key = a123.row_key) 
union
select 'ldb.d_lov_service_request_subcategory_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a113 
on (a11.service_request_c_key = a113.row_key) 
join ldb.d_lov_service_request_subcategory_c a124 
on (a113.subcategory_src_key = a124.row_key) 
union
select 'ldb.d_lov_service_request_type_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_service_request_c a113 
on (a11.service_request_c_key = a113.row_key) 
join ldb.d_lov_service_request_type_c a125 
on (a113.type_src_key = a125.row_key) 
union
select 'ldb.d_lov_sr_task_state_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sr_task_c a11 
join ldb.d_sr_task_c a15 
on (a11.sr_task_c_key = a15.row_key) 
join ldb.d_lov_sr_task_state_c a126 
on (a15.state_src_key = a126.row_key) 