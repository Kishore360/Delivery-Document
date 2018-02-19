



select 'ldb.f_request_item_fulfilled_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_contact a12 
on (a11.fulfilled_by_c_key = a12.row_key) 
union
select 'ldb.d_master_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_master_item a13 
on (a11.catalog_item_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_request_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_request_item a15 
on (a11.request_item_key = a15.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_calendar_date a16 
on (a11.fulfilled_on_c_key = a16.row_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_hr_case_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_hr_case_c a18 
on (a11.hr_case_c_key = a18.row_key) 
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_calendar_date a16 
on (a11.fulfilled_on_c_key = a16.row_key) 
join ldb.d_calendar_quarter a19 
on (a16.quarter_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_week a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_calendar_date a16 
on (a11.fulfilled_on_c_key = a16.row_key) 
join ldb.d_calendar_week a110 
on (a16.week_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_calendar_date a16 
on (a11.fulfilled_on_c_key = a16.row_key) 
join ldb.d_calendar_year a111 
on (a16.year_start_date_key = a111.row_key) 
union
select 'ldb.d_task_request_item_parent_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_task_request_item_parent_c a112 
on (a11.parent_c_key = a112.row_key) 
union
select 'ldb.d_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_request a113 
on (a11.request_key = a113.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_contact_assigned_to a114 
on (a11.assigned_to_key = a114.row_key) 
union
select 'ldb.d_change_request a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_change_request a115 
on (a11.change_c_key = a115.row_key) 
union
select 'ldb.d_internal_organization_legalentity a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_organization_legalentity a116 
on (a11.company_key = a116.row_key) 
union
select 'ldb.d_internal_organization_department a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_organization_department a117 
on (a11.opened_by_department_key = a117.row_key) 
union
select 'ldb.d_internal_contact_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_contact a12 
on (a11.fulfilled_by_c_key = a12.row_key) 
join ldb.d_internal_contact_mdm a118 
on (a12.row_current_key = a118.row_current_key) 
union
select 'ldb.d_location_hr_case_c_employee_location_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_location_hr_case_c_employee_location_c a119 
on (a11.employee_location_c_key = a119.row_key) 
union
select 'ldb.d_internal_organization_hr_case_c_emp_dept_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_organization_hr_case_c_emp_dept_c a120 
on (a11.employee_department_c_key = a120.row_key) 
union
select 'ldb.d_internal_contact_fulfilled_by_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_contact_fulfilled_by_c a121 
on (a11.fulfilled_by_c_key = a121.row_key) 
union
select 'ldb.d_request_item_hr_category_src_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_request_item_hr_category_src_c a122 
on (a11.category_src_c_key = a122.row_key) 
union
select 'ldb.d_hr_change_category a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_hr_change_category a123 
on (a11.hr_category_src_key = a123.row_key) 
union
select 'ldb.d_hr_change a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_hr_change a124 
on (a11.hr_change_key = a124.row_key) 
union
select 'ldb.d_location_request_item_location_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_location_request_item_location_c a125 
on (a11.location_key = a125.row_key) 
union
select 'ldb.d_internal_contact_hr_case_c_hiring_manager_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_contact_hr_case_c_hiring_manager_c a126 
on (a11.hiring_manager_c_key = a126.row_key) 
union
select 'ldb.d_sc_req_item_approval a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_sc_req_item_approval a127 
on (a11.approval_state_src_key = a127.row_key) 
union
select 'ldb.d_request_item_stage a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_request_item_stage a128 
on (a11.stage_src_key = a128.row_key) 
union
select 'ldb.d_request_item_state a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_request_item_state a129 
on (a11.state_src_key = a129.row_key) 
union
select 'ldb.d_internal_contact_requested_for a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_contact_requested_for a130 
on (a11.requested_for_key = a130.row_key) 
union
select 'ldb.d_configuration_item_request_item_so_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_configuration_item_request_item_so_c a131 
on (a11.service_offering_c_key = a131.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_contact_task_closed_by a132 
on (a11.fulfilled_by_c_key = a132.row_key) 
union
select 'ldb.d_internal_organization_request_item_vendor_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_organization_request_item_vendor_c a133 
on (a11.vendor_c_key = a133.row_key) 
union
select 'ldb.d_internal_contact_assignment_manager_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
join ldb.d_internal_contact_assignment_manager_c a134 
on (a14.manager_c_key = a134.row_key) 
union
select 'ldb.d_internal_organization_gp_depart_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
join ldb.d_internal_organization_gp_depart_c a135 
on (a14.department_c_key = a135.row_key) 
union
select 'ldb.d_business_unit_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
join ldb.d_business_unit_c a136 
on (a17.business_unit_c_key = a136.row_key) 
union
select 'ldb.d_lov_request_item_ci_type_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_request_item a15 
on (a11.request_item_key = a15.row_key) 
join ldb.d_lov_request_item_ci_type_c a137 
on (a15.ci_type_c_key = a137.row_key) 
union
select 'ldb.d_lov_request_item_contact_type_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_request_item a15 
on (a11.request_item_key = a15.row_key) 
join ldb.d_lov_request_item_contact_type_c a138 
on (a15.contact_type_c_key = a138.row_key) 
union
select 'ldb.d_lov_hr_case_c_employee_type_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_hr_case_c a18 
on (a11.hr_case_c_key = a18.row_key) 
join ldb.d_lov_hr_case_c_employee_type_c a139 
on (a18.employment_type_src_key = a139.row_key) 
union
select 'ldb.d_lov_hr_case_c_required_phone_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_hr_case_c a18 
on (a11.hr_case_c_key = a18.row_key) 
join ldb.d_lov_hr_case_c_required_phone_c a140 
on (a18.required_phone_src_key = a140.row_key) 
union
select 'ldb.d_hr_case_state_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_hr_case_c a18 
on (a11.hr_case_c_key = a18.row_key) 
join ldb.d_hr_case_state_c a141 
on (a18.state_src_key = a141.row_key) 
union
select 'ldb.d_calendar_month a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_fulfilled_c a11 
join ldb.d_calendar_date a16 
on (a11.fulfilled_on_c_key = a16.row_key) 
join ldb.d_calendar_month a142 
on (a16.month_start_date_key = a142.row_key) 

