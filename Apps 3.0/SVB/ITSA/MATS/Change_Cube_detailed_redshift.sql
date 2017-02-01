select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_change_request_category a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category a17 
on (a11.category_src_key = a17.row_key) 
union
select 'ldb.d_change_request_impact a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_impact a18 
on (a11.impact_src_key = a18.row_key) 
union
select 'ldb.d_change_request_priority a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority a19 
on (a11.priority_src_key = a19.row_key) 
union
select 'ldb.d_change_request_reason a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reason a110 
on (a11.reason_src_key = a110.row_key) 
union
select 'ldb.d_change_request_reported_type a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a111 
on (a11.reported_type_src_key = a111.row_key) 
union
select 'ldb.d_configuration_item_change_request_application_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item_change_request_application_c a112 
on (a11.configuration_item_application_c_key = a112.row_key) 
union
select 'ldb.d_change_request_state a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a113 
on (a11.state_src_key = a113.row_key) 
union
select 'ldb.d_change_request_closure_status_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_closure_status_c a114 
on (a11.closure_code_src_c_key = a114.row_key) 
union
select 'ldb.d_change_request_risk a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a115 
on (a11.risk_src_key = a115.row_key) 
union
select 'ldb.d_change_request_scope a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a116 
on (a11.scope_src_key = a116.row_key) 
union
select 'ldb.d_change_request_type a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a117 
on (a11.type_src_key = a117.row_key) 
union
select 'ldb.d_change_request_urgency a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a118 
on (a11.urgency_src_key = a118.row_key) 
union
select 'ldb.d_configuration_item a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a119 
on (a11.configuration_item_key = a119.row_key) 
union
select 'ldb.d_internal_organization_department a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_department a120 
on (a11.requested_by_department_key = a120.row_key) 
union
select 'ldb.d_domain a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_domain a121 
on (a11.domain_key = a121.row_key) 
union
select 'ldb.d_internal_contact_mdm a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a122 
on (a12.row_current_key = a122.row_current_key) 
union
select 'ldb.d_location a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_location a123 
on (a11.location_key = a123.row_key) 
union
select 'ldb.d_lov_unplanned_impact_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_lov_unplanned_impact_c a124 
on (a13.unplanned_impact_c_key = a124.row_key) 
union
select 'ldb.d_lov_closure_code_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_lov_closure_code_c a125 
on (a13.closure_code_c_key = a125.row_key) 
union
select 'ldb.d_lov_expedite_reason_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_lov_expedite_reason_c a126 
on (a13.expedite_reason_c_key = a126.row_key) 
union
select 'ldb.d_calendar_month a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a127 
on (a14.month_start_date_key = a127.row_key) 
union
select 'ldb.d_lov_phase_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_lov_phase_c a128 
on (a13.phase_c_key = a128.row_key) 
union
select 'ldb.d_lov_phase_state_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_lov_phase_state_c a129 
on (a13.phase_state_c_key = a129.row_key)
