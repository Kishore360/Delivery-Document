select 'ldb.f_defect_rm_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
union
select 'ldb.d_lov_rm_defect_state_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_lov_rm_defect_state_c a12 
on (a11.state_src_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_internal_contact_emp_seniors_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.d_internal_contact_emp_seniors_c a16 
on (a15.manager_c_key = a16.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c_relation a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a17 
on (a11.assignment_group_key = a17.level0_assigment_group_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_defect_rm_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_defect_rm_c a19 
on (a11.defect_c_key = a19.row_key) 
union
select 'ldb.d_internal_contact_defect_opened_by_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_defect_rm_c a19 
on (a11.defect_c_key = a19.row_key) 
join ldb.d_internal_contact_defect_opened_by_c a110 
on (a19.opened_by_c_key = a110.row_key) 
union
select 'ldb.d_calendar_greg_fiscal_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_key = a112.row_key) 
union
select 'ldb.d_internal_contact_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a113 
on (a13.row_current_key = a113.row_current_key) 
union
select 'ldb.d_rm_change_scope_feature_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_rm_change_scope_feature_c a114 
on (a11.feature_change_scope_c_key = a114.row_key) 
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_configuration_item a115 
on (a11.configuration_item_key = a115.row_key) 
union
select 'ldb.d_internal_contact_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_internal_contact_mdm a116 
on (a11.opened_by_c_key = a116.row_current_key) 
union
select 'ldb.d_internal_contact_requested_for a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_internal_contact_requested_for a117 
on (a11.requestor_c_key = a117.row_key) 
union
select 'ldb.d_rm_status_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_rm_status_c a118 
on (a11.status_rm_src_c_key = a118.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_internal_contact_task_closed_by a119 
on (a11.closed_by_key = a119.row_key) 
union
select 'ldb.d_task_impact a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_task_impact a120 
on (a11.impact_src_key = a120.row_key) 
union
select 'ldb.d_location a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_location a121 
on (a11.location_key = a121.row_key) 
union
select 'ldb.d_task_priority a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_task_priority a122 
on (a11.priority_src_key = a122.row_key) 
union
select 'ldb.d_task_contacttype a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_task_contacttype a123 
on (a11.reported_type_src_key = a123.row_key) 
union
select 'ldb.d_task_urgency a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_task_urgency a124 
on (a11.urgency_src_key = a124.row_key) 
union
select 'ldb.d_rm_lov_type_of_request_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_rm_lov_type_of_request_c a125 
on (a11.type_of_request_c_key = a125.row_key) 
union
select 'ldb.d_internal_organization_legalentity_company_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
join ldb.d_internal_organization_legalentity_company_c a126 
on (a14.user_company_c1_key = a126.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a17 
on (a11.assignment_group_key = a17.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c a127 
on (a17.level0_manager_c_key = a127.level0_manager_c_key) 
union
select 'ldb.d_internal_contact_director a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.d_internal_contact_mdm a113 
on (a13.row_current_key = a113.row_current_key) 
join ldb.d_internal_contact_director a128 
on (a113.director_c_key = a128.row_key) 
union
select 'ldb.d_internal_contact_manager a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.d_internal_contact_mdm a113 
on (a13.row_current_key = a113.row_current_key) 
join ldb.d_internal_contact_manager a129 
on (a113.manager_c_key = a129.row_key) 
union
select 'ldb.d_internal_contact_vp a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.d_internal_contact_mdm a113 
on (a13.row_current_key = a113.row_current_key) 
join ldb.d_internal_contact_vp a130 
on (a113.vp_c_key = a130.row_key) 
union
select 'ldb.d_internal_contact_defect_director_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_defect_rm_c a19 
on (a11.defect_c_key = a19.row_key) join ldb.d_internal_contact_defect_opened_by_c a110 
on (a19.opened_by_c_key = a110.row_key) 
join ldb.d_internal_contact_defect_director_c a131 
on (a110.director_c_key = a131.row_key) 
union
select 'ldb.d_internal_contact_defect_manager_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_defect_rm_c a19 
on (a11.defect_c_key = a19.row_key) join ldb.d_internal_contact_defect_opened_by_c a110 
on (a19.opened_by_c_key = a110.row_key) 
join ldb.d_internal_contact_defect_manager_c a132 
on (a110.manager_c_key = a132.row_key) 
union
select 'ldb.d_internal_contact_defect_vp_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_defect_rm_c a19 
on (a11.defect_c_key = a19.row_key) join ldb.d_internal_contact_defect_opened_by_c a110 
on (a19.opened_by_c_key = a110.row_key) 
join ldb.d_internal_contact_defect_vp_c a133 
on (a110.vp_c_key = a133.row_key) 
union
select 'ldb.d_calendar_fiscal_period a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_key = a112.row_key) 
join ldb.d_calendar_fiscal_period a134 
on (a112.period_start_date_key = a134.row_key) 
union
select 'ldb.d_calendar_month a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a135 
on (a18.month_start_date_key = a135.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_key = a112.row_key) 
join ldb.d_calendar_fiscal_quarter a136 
on (a112.quarter_start_date_key = a136.row_key) 
union
select 'ldb.d_calendar_fiscal_year a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_defect_rm_c a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_key = a112.row_key) 
join ldb.d_calendar_fiscal_year a137 
on (a112.year_start_date_key = a137.row_key) 