select 'ldb.f_enhancement_rm_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_master_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_master_item a13 
on (a11.catalog_item_rm_c_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_internal_contact_emp_seniors_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
left outer join ldb.d_internal_contact_emp_seniors_c a15 
on (a14.manager_c_key = a15.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c_relation a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_assignment_group_level0_manager_c_relation a16 
on (a11.assignment_group_key = a16.level0_assigment_group_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
union
select 'ldb.d_enhancement_rm_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_enhancement_rm_c a18 
on (a11.enhancement_c_key = a18.row_key) 
union
select 'ldb.d_calendar_greg_fiscal_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_calendar_greg_fiscal_c a19 
on (a11.opened_on_key = a19.greogrian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_calendar_greg_fiscal_c a19 
on (a11.opened_on_key = a19.greogrian_calendar_key) 
left outer join ldb.d_calendar_date_fiscal a110 
on (a19.fiscal_key = a110.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_internal_contact_assigned_to a111 
on (a11.assigned_to_key = a111.row_key) 
union
select 'ldb.d_rm_change_scope_feature_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_rm_change_scope_feature_c a112 
on (a11.feature_change_scope_c_key = a112.row_key) 
union
select 'ldb.d_configuration_item a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_configuration_item a113 
on (a11.configuration_item_key = a113.row_key) 
union
select 'ldb.d_internal_contact_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
left outer join ldb.d_internal_contact_mdm a114 
on (a12.row_current_key = a114.row_current_key) 
union
select 'ldb.d_lov_rm_enhancement_state_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_lov_rm_enhancement_state_c a115 
on (a11.state_src_key = a115.row_key) 
union
select 'ldb.d_request_item a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_request_item a116 
on (a11.request_item_key = a116.row_key) 
union
select 'ldb.d_internal_contact_requested_for a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_internal_contact_requested_for a117 
on (a11.requestor_c_key = a117.row_key) 
union
select 'ldb.d_rm_status_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_rm_status_c a118 
on (a11.status_rm_src_c_key = a118.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_internal_contact_task_closed_by a119 
on (a11.closed_by_key = a119.row_key) 
union
select 'ldb.d_task_impact a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_task_impact a120 
on (a11.impact_src_key = a120.row_key) 
union
select 'ldb.d_location a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_location a121 
on (a11.location_key = a121.row_key) 
union
select 'ldb.d_task_priority a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_task_priority a122 
on (a11.priority_src_key = a122.row_key) 
union
select 'ldb.d_task_contacttype a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_task_contacttype a123 
on (a11.reported_type_src_key = a123.row_key) 
union
select 'ldb.d_task_urgency a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_task_urgency a124 
on (a11.urgency_src_key = a124.row_key) 
union
select 'ldb.d_rm_lov_type_of_request_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_rm_lov_type_of_request_c a125 
on (a11.type_of_request_c_key = a125.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_assignment_group_level0_manager_c_relation a16 
on (a11.assignment_group_key = a16.level0_assigment_group_key) 
left outer join ldb.d_assignment_group_level0_manager_c a126 
on (a16.level0_manager_c_key = a126.level0_manager_c_key) 
union
select 'ldb.d_calendar_fiscal_period a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_calendar_greg_fiscal_c a19 
on (a11.opened_on_key = a19.greogrian_calendar_key) left outer join ldb.d_calendar_date_fiscal a110 
on (a19.fiscal_key = a110.row_key) 
left outer join ldb.d_calendar_fiscal_period a127 
on (a110.period_start_date_key = a127.row_key) 
union
select 'ldb.d_calendar_month a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
left outer join ldb.d_calendar_month a128 
on (a17.month_start_date_key = a128.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_calendar_greg_fiscal_c a19 
on (a11.opened_on_key = a19.greogrian_calendar_key) left outer join ldb.d_calendar_date_fiscal a110 
on (a19.fiscal_key = a110.row_key) 
left outer join ldb.d_calendar_fiscal_quarter a129 
on (a110.quarter_start_date_key = a129.row_key) 
union
select 'ldb.d_calendar_fiscal_year a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_c a11 
left outer join ldb.d_calendar_greg_fiscal_c a19 
on (a11.opened_on_key = a19.greogrian_calendar_key) left outer join ldb.d_calendar_date_fiscal a110 
on (a19.fiscal_key = a110.row_key) 
left outer join ldb.d_calendar_fiscal_year a130 
on (a110.year_start_date_key = a130.row_key) 