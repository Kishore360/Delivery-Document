select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_date_fiscal a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.closed_on_key = a13.row_key) 
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_configuration_item a14 
on (a11.configuration_item_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.dh_user_group_classification_hierarchy a16 
on (a11.assignment_group_key = a16.user_group_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level1 a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.dh_user_group_classification_hierarchy a16 
on (a11.assignment_group_key = a16.user_group_key) 
join ldb.dh_user_group_classification_hierarchy_level1 a17 
on (a16.user_group_classification_level1 = a17.user_group_level1_key) 
union
select 'ldb.d_change_request a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request a18 
on (a11.change_request_key = a18.row_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a19 
on (a11.closed_on_key = a19.row_key) 
union
select 'ldb.d_internal_contact_requested_by_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact_requested_by_c a110 
on (a11.requested_by_key = a110.row_key) 
union
select 'ldb.d_internal_organization_group a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a111 
on (a11.assignment_group_key = a111.row_key) 
union
select 'ldb.d_change_request_approval a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_approval a112 
on (a11.approval_state_src_key = a112.row_key) 
union
select 'ldb.d_change_request_category a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_category a113 
on (a11.category_src_key = a113.row_key) 
union
select 'ldb.d_change_request_reported_type a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_reported_type a114 
on (a11.reported_type_src_key = a114.row_key) 
union
select 'ldb.d_change_request_impact a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_impact a115 
on (a11.impact_src_key = a115.row_key) 
union
select 'ldb.d_change_request_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_priority a116 
on (a11.priority_src_key = a116.row_key) 
union
select 'ldb.d_change_request_reason a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_reason a117 
on (a11.reason_src_key = a117.row_key) 
union
select 'ldb.d_change_request_review_status a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_review_status a118 
on (a11.review_status_src_key = a118.row_key) 
union
select 'ldb.d_change_request_risk a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_risk a119 
on (a11.risk_src_key = a119.row_key) 
union
select 'ldb.d_change_request_scope a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_scope a120 
on (a11.scope_src_key = a120.row_key) 
union
select 'ldb.d_change_request_state a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_state a121 
on (a11.state_src_key = a121.row_key) 
union
select 'ldb.d_change_request_type a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_type a122 
on (a11.type_src_key = a122.row_key) 
union
select 'ldb.d_change_request_urgency a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_urgency a123 
on (a11.urgency_src_key = a123.row_key) 
union
select 'ldb.d_lov_change_request_u_completion_code_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_lov_change_request_u_completion_code_c a124 
on (a11.completion_src_c_key = a124.row_key) 
union
select 'ldb.d_internal_organization_department a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_department a125 
on (a11.requested_by_department_key = a125.row_key) 
union
select 'ldb.d_domain a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_domain a126 
on (a11.domain_key = a126.row_key) 
union
select 'ldb.d_internal_contact_mdm a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a127 
on (a12.row_current_key = a127.row_current_key) 
union
select 'ldb.d_calendar_fiscal_period a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.closed_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_period a128 
on (a13.period_start_date_key = a128.row_key) 
union
select 'ldb.d_internal_contact_client_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact_client_c a129 
on (a11.client_c_key = a129.row_key) 
union
select 'ldb.d_internal_contact_qa_approver_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact_qa_approver_c a130 
on (a11.qa_approver_c_key = a130.row_key) 
union
select 'ldb.d_lov_change_request_u_sub_category_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_lov_change_request_u_sub_category_c a131 
on (a11.sub_category_src_c_key = a131.row_key) 
union
select 'ldb.d_location a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_location a132 
on (a11.location_key = a132.row_key) 
union
select 'ldb.d_internal_organization_group_change_request_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_configuration_item a14 
on (a11.configuration_item_key = a14.row_key) 
join ldb.d_internal_organization_group_change_request_c a133 
on (a14.change_control_c_key = a133.row_key) 
union
select 'ldb.d_internal_contact_manager_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
join ldb.d_internal_contact_manager_c a134 
on (a15.manager_key = a134.row_key) 
union
select 'ldb.d_calendar_month a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a19 
on (a11.closed_on_key = a19.row_key) 
join ldb.d_calendar_month a135 
on (a19.month_start_date_key = a135.row_key) 
union
select 'ldb.d_calendar_week a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a19 
on (a11.closed_on_key = a19.row_key) 
join ldb.d_calendar_week a136 
on (a19.week_start_date_key = a136.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.closed_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_quarter a137 
on (a13.quarter_start_date_key = a137.row_key) 
union
select 'ldb.d_calendar_quarter a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a19 
on (a11.closed_on_key = a19.row_key) 
join ldb.d_calendar_quarter a138 
on (a19.quarter_start_date_key = a138.row_key) 
union
select 'ldb.d_calendar_fiscal_year a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.closed_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_year a139 
on (a13.year_start_date_key = a139.row_key) 
union
select 'ldb.d_calendar_year a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a19 
on (a11.closed_on_key = a19.row_key) 
join ldb.d_calendar_year a140 
on (a19.year_start_date_key = a140.row_key) 