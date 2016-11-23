
select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a13 
on (a11.configuration_item_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_change_request a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a15 
on (a11.change_request_key = a15.row_key) 
union
select 'ldb.d_internal_contact_requested_by a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_requested_by a16 
on (a11.requested_by_key = a16.row_key) 
union
select 'ldb.d_calendar_greg_fiscal a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_greg_fiscal a17 
on (a11.opened_on_key = a17.gregorian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_greg_fiscal a17 
on (a11.opened_on_key = a17.gregorian_calendar_key) 
join ldb.d_calendar_date_fiscal a18 
on (a17.fiscal_calendar_key = a18.row_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) 
union
select 'ldb.d_change_request_approval a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_approval a111 
on (a11.approval_state_src_key = a111.row_key) 
union
select 'ldb.d_change_request_category a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category a112 
on (a11.category_src_key = a112.row_key) 
union
select 'ldb.d_change_request_impact a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_impact a113 
on (a11.impact_src_key = a113.row_key) 
union
select 'ldb.d_change_request_priority a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority a114 
on (a11.priority_src_key = a114.row_key) 
union
select 'ldb.d_change_request_reason a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reason a115 
on (a11.reason_src_key = a115.row_key) 
union
select 'ldb.d_change_request_reported_type a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a116 
on (a11.reported_type_src_key = a116.row_key) 
union
select 'ldb.d_change_request_state a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a117 
on (a11.state_src_key = a117.row_key) 
union
select 'ldb.d_change_request_review_status a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_review_status a118 
on (a11.review_status_src_key = a118.row_key) 
union
select 'ldb.d_change_request_risk a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a119 
on (a11.risk_src_key = a119.row_key) 
union
select 'ldb.d_change_request_scope a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a120 
on (a11.scope_src_key = a120.row_key) 
union
select 'ldb.d_change_request_type a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a121 
on (a11.type_src_key = a121.row_key) 
union
select 'ldb.d_change_request_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a122 
on (a11.urgency_src_key = a122.row_key) 
union
select 'ldb.d_change_request_u_completion_code_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_u_completion_code_c a123 
on (a11.completion_src_c_key = a123.row_key) 
union
select 'ldb.d_internal_organization_department a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_department a124 
on (a11.requested_by_department_key = a124.row_key) 
union
select 'ldb.d_domain a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_domain a125 
on (a11.domain_key = a125.row_key) 
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a126 
on (a12.row_current_key = a126.row_current_key) 
union
select 'ldb.d_internal_contact_client_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_client_c a127 
on (a11.client_c_key = a127.row_key) 
union
select 'ldb.d_internal_contact_qa_approver_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_qa_approver_c a128 
on (a11.qa_approver_c_key = a128.row_key) 
union
select 'ldb.d_change_request_u_sub_category_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_u_sub_category_c a129 
on (a11.sub_category_src_c_key = a129.row_key) 
union
select 'ldb.d_location a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_location a130 
on (a11.location_key = a130.row_key) 
union
select 'ldb.d_internal_organization_group_change_request_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a13 
on (a11.configuration_item_key = a13.row_key) 
join ldb.d_internal_organization_group_change_request_c a131 
on (a13.change_control_c_key = a131.row_key) 
union
select 'ldb.d_internal_contact_manager_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
join ldb.d_internal_contact_manager_c a132 
on (a14.manager_c_key = a132.row_key) 
union
select 'ldb.d_calendar_fiscal_period a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_greg_fiscal a17 
on (a11.opened_on_key = a17.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a18 
on (a17.fiscal_calendar_key = a18.row_key) 
join ldb.d_calendar_fiscal_period a133 
on (a18.period_start_date_key = a133.row_key) 
union
select 'ldb.d_calendar_month a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_month a134 
on (a19.month_start_date_key = a134.row_key) 
union
select 'ldb.d_calendar_week a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_week a135 
on (a19.week_start_date_key = a135.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_greg_fiscal a17 
on (a11.opened_on_key = a17.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a18 
on (a17.fiscal_calendar_key = a18.row_key) 
join ldb.d_calendar_fiscal_quarter a136 
on (a18.quarter_start_date_key = a136.row_key) 
union
select 'ldb.d_calendar_quarter a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_quarter a137 
on (a19.quarter_start_date_key = a137.row_key) 
union
select 'ldb.d_calendar_fiscal_year a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_greg_fiscal a17 
on (a11.opened_on_key = a17.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a18 
on (a17.fiscal_calendar_key = a18.row_key) 
join ldb.d_calendar_fiscal_year a138 
on (a18.year_start_date_key = a138.row_key) 
union
select 'ldb.d_calendar_year a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_year a139 
on (a19.year_start_date_key = a139.row_key)
