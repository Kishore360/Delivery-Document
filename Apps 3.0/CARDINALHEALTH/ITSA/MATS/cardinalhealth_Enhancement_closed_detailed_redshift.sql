select 'ldb.f_enhancement_rm_closed_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) 
union
select 'ldb.d_lov_rm_enhancement_state_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_lov_rm_enhancement_state_c a13 
on (a11.state_src_key = a13.row_key) 
union
select 'ldb.d_master_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_master_item a14 
on (a11.catalog_item_rm_c_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_internal_contact_emp_seniors_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_internal_contact_emp_seniors_c a17 
on (a16.manager_c_key = a17.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c_relation a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a18 
on (a11.assignment_group_key = a18.level0_assigment_group_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_calendar_date a19 
on (a11.closed_on_key = a19.row_key) 
union
select 'ldb.d_enhancement_rm_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_enhancement_rm_c a110 
on (a11.enhancement_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact_enhancement_opened_by_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_enhancement_rm_c a110 
on (a11.enhancement_c_key = a110.row_key) 
join ldb.d_internal_contact_enhancement_opened_by_c a111 
on (a110.opened_by_c_key = a111.row_key) 
union
select 'ldb.d_calendar_greg_fiscal_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_calendar_greg_fiscal_c a112 
on (a11.closed_on_key = a112.greogrian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_calendar_greg_fiscal_c a112 
on (a11.closed_on_key = a112.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal a113 
on (a112.fiscal_key = a113.row_key) 
union
select 'ldb.d_internal_contact_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a114 
on (a12.row_current_key = a114.row_current_key) 
union
select 'ldb.d_rm_change_scope_feature_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_rm_change_scope_feature_c a115 
on (a11.feature_change_scope_c_key = a115.row_key) 
union
select 'ldb.d_configuration_item a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_configuration_item a116 
on (a11.configuration_item_key = a116.row_key) 
union
select 'ldb.d_request_item a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_request_item a117 
on (a11.request_item_key = a117.row_key) 
union
select 'ldb.d_internal_contact_requested_for a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_internal_contact_requested_for a118 
on (a11.requestor_c_key = a118.row_key) 
union
select 'ldb.d_rm_status_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_rm_status_c a119 
on (a11.status_rm_src_c_key = a119.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_internal_contact_task_closed_by a120 
on (a11.closed_by_key = a120.row_key) 
union
select 'ldb.d_task_impact a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_task_impact a121 
on (a11.impact_src_key = a121.row_key) 
union
select 'ldb.d_location a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_location a122 
on (a11.location_key = a122.row_key) 
union
select 'ldb.d_task_priority a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_task_priority a123 
on (a11.priority_src_key = a123.row_key) 
union
select 'ldb.d_task_contacttype a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_task_contacttype a124 
on (a11.reported_type_src_key = a124.row_key) 
union
select 'ldb.d_task_urgency a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_task_urgency a125 
on (a11.urgency_src_key = a125.row_key) 
union
select 'ldb.d_rm_lov_type_of_request_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_rm_lov_type_of_request_c a126 
on (a11.type_of_request_c_key = a126.row_key) 
union
select 'ldb.d_internal_organization_legalentity_company_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
join ldb.d_internal_organization_legalentity_company_c a127 
on (a15.user_company_c1_key = a127.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a18 
on (a11.assignment_group_key = a18.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c a128 
on (a18.level0_manager_c_key = a128.level0_manager_c_key) 
union
select 'ldb.d_internal_contact_director a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) join ldb.d_internal_contact_mdm a114 
on (a12.row_current_key = a114.row_current_key) 
join ldb.d_internal_contact_director a129 
on (a114.director_c_key = a129.row_key) 
union
select 'ldb.d_internal_contact_manager a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) join ldb.d_internal_contact_mdm a114 
on (a12.row_current_key = a114.row_current_key) 
join ldb.d_internal_contact_manager a130 
on (a114.manager_c_key = a130.row_key) 
union
select 'ldb.d_internal_contact_vp a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) join ldb.d_internal_contact_mdm a114 
on (a12.row_current_key = a114.row_current_key) 
join ldb.d_internal_contact_vp a131 
on (a114.vp_c_key = a131.row_key) 
union
select 'ldb.d_internal_contact_enhancement_director_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_enhancement_rm_c a110 
on (a11.enhancement_c_key = a110.row_key) join ldb.d_internal_contact_enhancement_opened_by_c a111 
on (a110.opened_by_c_key = a111.row_key) 
join ldb.d_internal_contact_enhancement_director_c a132 
on (a111.director_c_key = a132.row_key) 
union
select 'ldb.d_internal_contact_enhancement_manager_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_enhancement_rm_c a110 
on (a11.enhancement_c_key = a110.row_key) join ldb.d_internal_contact_enhancement_opened_by_c a111 
on (a110.opened_by_c_key = a111.row_key) 
join ldb.d_internal_contact_enhancement_manager_c a133 
on (a111.manager_c_key = a133.row_key) 
union
select 'ldb.d_internal_contact_enhancement_vp_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_enhancement_rm_c a110 
on (a11.enhancement_c_key = a110.row_key) join ldb.d_internal_contact_enhancement_opened_by_c a111 
on (a110.opened_by_c_key = a111.row_key) 
join ldb.d_internal_contact_enhancement_vp_c a134 
on (a111.vp_c_key = a134.row_key) 
union
select 'ldb.d_calendar_fiscal_period a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_calendar_greg_fiscal_c a112 
on (a11.closed_on_key = a112.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a113 
on (a112.fiscal_key = a113.row_key) 
join ldb.d_calendar_fiscal_period a135 
on (a113.period_start_date_key = a135.row_key) 
union
select 'ldb.d_calendar_month a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_calendar_date a19 
on (a11.closed_on_key = a19.row_key) 
join ldb.d_calendar_month a136 
on (a19.month_start_date_key = a136.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_calendar_greg_fiscal_c a112 
on (a11.closed_on_key = a112.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a113 
on (a112.fiscal_key = a113.row_key) 
join ldb.d_calendar_fiscal_quarter a137 
on (a113.quarter_start_date_key = a137.row_key) 
union
select 'ldb.d_calendar_fiscal_year a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_rm_closed_c a11 
join ldb.d_calendar_greg_fiscal_c a112 
on (a11.closed_on_key = a112.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a113 
on (a112.fiscal_key = a113.row_key) 
join ldb.d_calendar_fiscal_year a138 
on (a113.year_start_date_key = a138.row_key) 