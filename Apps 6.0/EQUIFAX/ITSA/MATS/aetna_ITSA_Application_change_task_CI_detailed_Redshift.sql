select 'ldb.f_change_request_ci_application_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
union
select 'ldb.d_business_application_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_business_application_c a14 
on (a11.business_application_c_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.dh_employee_hierarchy_dept_head_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_employee_hierarchy_dept_head_c a16 
on (a15.department_head_c_key = a16.lev_0_key) 
union
select 'ldb.d_change_request_risk a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_change_request_risk a17 
on (a11.risk_src_key = a17.row_key) 
union
select 'ldb.d_calendar_date_planned_start_on_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_calendar_date_planned_start_on_c a18 
on (a11.planned_start_on_key = a18.row_key) 
union
select 'ldb.d_configuration_item_task_ci_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_configuration_item_task_ci_c a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_internal_contact_assigned_to a110 
on (a11.assigned_to_key = a110.row_key) 
union
select 'ldb.d_calendar_month a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_month a111 
on (a12.month_start_date_key = a111.row_key) 
union
select 'ldb.d_change_request_category a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_change_request_category a112 
on (a11.category_src_key = a112.row_key) 
union
select 'ldb.d_change_request_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_change_request_priority a113 
on (a11.priority_src_key = a113.row_key) 
union
select 'ldb.d_change_request_reason a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_change_request_reason a114 
on (a11.reason_src_key = a114.row_key) 
union
select 'ldb.d_change_request_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_change_request_state a115 
on (a11.state_src_key = a115.row_key) 
union
select 'ldb.d_change_request_type a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_change_request_type a116 
on (a11.change_request_type_src_key = a116.row_key) 
union
select 'ldb.d_aetna_system_environments_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_aetna_system_environments_c a117 
on (a13.aetna_system_environment_c_key = a117.row_key) 
union
select 'ldb.dh_employee_hierarchy_dept_head_level2_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_employee_hierarchy_dept_head_c a16 
on (a15.department_head_c_key = a16.lev_0_key) 
join ldb.dh_employee_hierarchy_dept_head_level2_c a118 
on (a16.lev_1_key = a118.row_key) 
union
select 'ldb.dh_employee_hierarchy_dept_head_level3_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_employee_hierarchy_dept_head_c a16 
on (a15.department_head_c_key = a16.lev_0_key) 
join ldb.dh_employee_hierarchy_dept_head_level3_c a119 
on (a16.lev_2_key = a119.row_key) 
union
select 'ldb.dh_employee_hierarchy_dept_head_level4_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_employee_hierarchy_dept_head_c a16 
on (a15.department_head_c_key = a16.lev_0_key) 
join ldb.dh_employee_hierarchy_dept_head_level4_c a120 
on (a16.lev_3_key = a120.row_key) 
union
select 'ldb.dh_employee_hierarchy_dept_head_level5_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_employee_hierarchy_dept_head_c a16 
on (a15.department_head_c_key = a16.lev_0_key) 
join ldb.dh_employee_hierarchy_dept_head_level5_c a121 
on (a16.lev_4_key = a121.row_key) 
union
select 'ldb.d_internal_contact_department_head_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.d_internal_contact_department_head_c a122 
on (a15.department_head_c_key = a122.row_key) 
union
select 'ldb.d_internal_organization_department_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_ci_application_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.d_internal_organization_department_c a123 
on (a15.department_c_key = a123.row_key)