select 'ldb.f_service_request_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
union
select 'ldb.d_service_request_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a12 
on (a11.service_request_c_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact a15 
on (a11.employee_key = a15.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact_opened_by_c a16 
on (a11.opened_by_key = a16.row_key) 
union
select 'ldb.d_calendar_date_fiscal a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_calendar_date_fiscal a17 
on (a11.fiscal_date_key = a17.row_key) 
union
select 'ldb.d_internal_contact_employee_type_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact_employee_type_c a18 
on (a11.opened_by_c_key = a18.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_calendar_date_fiscal a17 
on (a11.fiscal_date_key = a17.row_key) 
join ldb.d_calendar_fiscal_quarter a19 
on (a17.quarter_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_fiscal_year a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_calendar_date_fiscal a17 
on (a11.fiscal_date_key = a17.row_key) 
join ldb.d_calendar_fiscal_year a110 
on (a17.year_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_month a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
join ldb.d_calendar_month a111 
on (a14.month_start_date_key = a111.row_key) 
union
select 'ldb.d_calendar_quarter a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a111 
on (a14.month_start_date_key = a111.row_key) 
join ldb.d_calendar_quarter a112 
on (a111.quarter_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
join ldb.d_calendar_week a113 
on (a14.week_start_date_key = a113.row_key) 
union
select 'ldb.d_calendar_year a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a111 
on (a14.month_start_date_key = a111.row_key) join ldb.d_calendar_quarter a112 
on (a111.quarter_start_date_key = a112.row_key) 
join ldb.d_calendar_year a114 
on (a112.year_start_date_key = a114.row_key) 
union
select 'ldb.d_internal_organization_group_parent_internal_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_organization_group_parent_internal_c a115 
on (a11.assignment_group_c_key = a115.row_key) 
union
select 'ldb.d_internal_contact_requestor_employee_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact_requestor_employee_c a116 
on (a11.requestor_c_key = a116.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact_assigned_to a117 
on (a11.assigned_to_key = a117.row_key) 
union
select 'ldb.d_employee_duration_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_employee_duration_c a118 
on (a11.requestor_employee_duration_c_key = a118.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact_closed_by_c a119 
on (a11.closed_by_key = a119.row_key) 
union
select 'ldb.d_configuration_item a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_configuration_item a120 
on (a11.configuration_item_key = a120.row_key) 
union
select 'ldb.d_duration_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_duration_c a121 
on (a11.opened_by_employee_duration_c = a121.row_key) 
union
select 'ldb.d_internal_contact_requestor_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact_requestor_c a122 
on (a11.requestor_c_key = a122.row_key) 
union
select 'ldb.d_internal_contact_resolved_by a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact_resolved_by a123 
on (a11.last_resolved_by_key = a123.row_key) 
union
select 'ldb.d_flag_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_flag_c a124 
on (a11.sd_touch_flag_c_key = a124.row_key) 
union
select 'ldb.d_lov_service_request_agebucket_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_lov_service_request_agebucket_c a125 
on (a11.age_key = a125.row_key) 
union
select 'ldb.d_lov_service_request_reported_type_src_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_lov_service_request_reported_type_src_c a126 
on (a11.reported_type_src_key = a126.row_key) 
union
select 'ldb.d_lov_sys_user_group_portfolio_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
join ldb.d_lov_sys_user_group_portfolio_c a127 
on (a13.portfolio_src_c_key = a127.row_key) 
union
select 'ldb.d_internal_organization_department a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_organization_department a128 
on (a11.department_key = a128.row_key) 
union
select 'ldb.d_internal_contact_mdm a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact a15 
on (a11.employee_key = a15.row_key) 
join ldb.d_internal_contact_mdm a129 
on (a15.employee_mdm_key = a129.row_key) 
union
select 'ldb.d_lov_sc_req_item_employee_type_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact_employee_type_c a18 
on (a11.opened_by_c_key = a18.row_key) 
join ldb.d_lov_sc_req_item_employee_type_c a130 
on (a18.employee_type_c_key = a130.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_organization_group_parent_internal_c a115 
on (a11.assignment_group_c_key = a115.row_key) 
join ldb.d_internal_organization_group_parent_c a131 
on (a115.parent_row_c_key = a131.row_key) 
union
select 'ldb.d_lov_service_request_support_domain_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a12 
on (a11.service_request_c_key = a12.row_key) 
join ldb.d_lov_service_request_support_domain_c a132 
on (a12.support_domain_src_c_key = a132.row_key) 
union
select 'ldb.d_lov_service_request_state_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a12 
on (a11.service_request_c_key = a12.row_key) 
join ldb.d_lov_service_request_state_c a133 
on (a12.state_src_key = a133.row_key) 
union
select 'ldb.d_lov_service_request_category_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a12 
on (a11.service_request_c_key = a12.row_key) 
join ldb.d_lov_service_request_category_c a134 
on (a12.category_src_key = a134.row_key) 
union
select 'ldb.d_lov_service_request_priority_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a12 
on (a11.service_request_c_key = a12.row_key) 
join ldb.d_lov_service_request_priority_c a135 
on (a12.priority_src_key = a135.row_key) 
union
select 'ldb.d_lov_service_request_subcategory_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a12 
on (a11.service_request_c_key = a12.row_key) 
join ldb.d_lov_service_request_subcategory_c a136 
on (a12.subcategory_src_key = a136.row_key) 
union
select 'ldb.d_lov_service_request_type_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a12 
on (a11.service_request_c_key = a12.row_key) 
join ldb.d_lov_service_request_type_c a137 
on (a12.type_src_key = a137.row_key) 