select 'ldb.f_sdlc_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_master_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_master_item a13 
on (a11.catalog_item_rm_c_key = a13.row_key) 
union
select 'ldb.d_lov_rm_sdlc_state_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_lov_rm_sdlc_state_c a14 
on (a11.state_src_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_internal_contact_emp_seniors_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_internal_contact_emp_seniors_c a17 
on (a16.manager_c_key = a17.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c_relation a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a18 
on (a11.assignment_group_key = a18.level0_assigment_group_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
union
select 'ldb.d_sdlc_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_sdlc_c a110 
on (a11.task_key = a110.row_key) 
union
select 'ldb.d_calendar_greg_fiscal_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_key = a112.row_key) 
union
select 'ldb.d_internal_contact_sdlc_opened_by_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_sdlc_c a110 
on (a11.task_key = a110.row_key) 
join ldb.d_internal_contact_sdlc_opened_by_c a113 
on (a110.opened_by_c_key = a113.row_key) 
union
select 'ldb.d_calendar_week a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_week a114 
on (a19.week_start_date_key = a114.row_key) 
union
select 'ldb.d_rm_change_scope_feature_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_rm_change_scope_feature_c a115 
on (a11.feature_change_scope_c_key = a115.row_key) 
union
select 'ldb.d_configuration_item a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_configuration_item a116 
on (a11.configuration_item_key = a116.row_key) 
union
select 'ldb.d_internal_contact_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a117 
on (a12.row_current_key = a117.row_current_key) 
union
select 'ldb.d_request_item a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_request_item a118 
on (a11.request_item_key = a118.row_key) 
union
select 'ldb.d_internal_contact_requested_for a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_internal_contact_requested_for a119 
on (a11.requestor_c_key = a119.row_key) 
union
select 'ldb.d_rm_status_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_rm_status_c a120 
on (a11.status_rm_src_c_key = a120.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_internal_contact_task_closed_by a121 
on (a11.closed_by_key = a121.row_key) 
union
select 'ldb.d_task_impact a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_task_impact a122 
on (a11.impact_src_key = a122.row_key) 
union
select 'ldb.d_location a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_location a123 
on (a11.location_key = a123.row_key) 
union
select 'ldb.d_task_priority a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_task_priority a124 
on (a11.priority_src_key = a124.row_key) 
union
select 'ldb.d_task_contacttype a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_task_contacttype a125 
on (a11.reported_type_src_key = a125.row_key) 
union
select 'ldb.d_task_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_task_urgency a126 
on (a11.urgency_src_key = a126.row_key) 
union
select 'ldb.d_rm_lov_type_of_request_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_rm_lov_type_of_request_c a127 
on (a11.type_of_request_c_key = a127.row_key) 
union
select 'ldb.d_internal_organization_legalentity_company_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
join ldb.d_internal_organization_legalentity_company_c a128 
on (a15.user_company_c1_key = a128.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a18 
on (a11.assignment_group_key = a18.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c a129 
on (a18.level0_manager_c_key = a129.level0_manager_c_key) 
union
select 'ldb.d_calendar_fiscal_period a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_key = a112.row_key) 
join ldb.d_calendar_fiscal_period a130 
on (a112.period_start_date_key = a130.row_key) 
union
select 'ldb.d_calendar_month a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_month a131 
on (a19.month_start_date_key = a131.row_key) 
union
select 'ldb.d_internal_contact_sdlc_director_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_sdlc_c a110 
on (a11.task_key = a110.row_key) join ldb.d_internal_contact_sdlc_opened_by_c a113 
on (a110.opened_by_c_key = a113.row_key) 
join ldb.d_internal_contact_sdlc_director_c a132 
on (a113.director_c_key = a132.row_key) 
union
select 'ldb.d_internal_contact_sdlc_manager_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_sdlc_c a110 
on (a11.task_key = a110.row_key) join ldb.d_internal_contact_sdlc_opened_by_c a113 
on (a110.opened_by_c_key = a113.row_key) 
join ldb.d_internal_contact_sdlc_manager_c a133 
on (a113.manager_c_key = a133.row_key) 
union
select 'ldb.d_internal_contact_sdlc_vp_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_sdlc_c a110 
on (a11.task_key = a110.row_key) join ldb.d_internal_contact_sdlc_opened_by_c a113 
on (a110.opened_by_c_key = a113.row_key) 
join ldb.d_internal_contact_sdlc_vp_c a134 
on (a113.vp_c_key = a134.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_key = a112.row_key) 
join ldb.d_calendar_fiscal_quarter a135 
on (a112.quarter_start_date_key = a135.row_key) 
union
select 'ldb.d_calendar_fiscal_year a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sdlc_c a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_key = a112.row_key) 
join ldb.d_calendar_fiscal_year a136 
on (a112.year_start_date_key = a136.row_key) 
