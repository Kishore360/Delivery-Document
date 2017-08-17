select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a16 
on (a11.change_request_key = a16.row_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_calendar_week a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_week a18 
on (a15.week_start_date_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a19 
on (a11.business_service_c_key = a19.row_key) 
union
select 'ldb.d_change_request_approval a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_approval a110 
on (a11.approval_state_src_key = a110.row_key) 
union
select 'ldb.d_lov_change_request_category_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_change_request_category_c a111 
on (a11.category_src_key = a111.row_key) 
union
select 'ldb.d_change_request_reported_type a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a112 
on (a11.reported_type_src_key = a112.row_key) 
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
select 'ldb.d_change_request_review_status a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_review_status a116 
on (a11.review_status_src_key = a116.row_key) 
union
select 'ldb.d_change_request_risk a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a117 
on (a11.risk_src_key = a117.row_key) 
union
select 'ldb.d_change_request_scope a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a118 
on (a11.scope_src_key = a118.row_key) 
union
select 'ldb.d_change_request_state a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a119 
on (a11.state_src_key = a119.row_key) 
union
select 'ldb.d_change_request_type a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a120 
on (a11.type_src_key = a120.row_key) 
union
select 'ldb.d_change_request_urgency a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a121 
on (a11.urgency_src_key = a121.row_key) 
union
select 'ldb.d_internal_organization_department a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_department a122 
on (a11.requested_by_department_key = a122.row_key) 
union
select 'ldb.d_domain a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_domain a123 
on (a11.domain_key = a123.row_key) 
union
select 'ldb.d_internal_contact_mdm a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a124 
on (a12.row_current_key = a124.row_current_key) 
union
select 'ldb.d_lov_change_request_implementation_state_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_change_request_implementation_state_c a125 
on (a11.implementation_state_src_c_key = a125.row_key) 
union
select 'ldb.d_location a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_location a126 
on (a11.location_key = a126.row_key) 
union
select 'ldb.d_lov_change_request_souce_of_change_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_change_request_souce_of_change_c a127 
on (a11.souce_of_change_src_c_key = a127.row_key) 
union
select 'ldb.d_lov_change_request_subcategory_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_change_request_subcategory_c a128 
on (a11.sub_category_src_c_key = a128.row_key) 
union
select 'ldb.d_calendar_month a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_month a129 
on (a15.month_start_date_key = a129.row_key) 
union
select 'ldb.d_calendar_quarter a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_quarter a130 
on (a15.quarter_start_date_key = a130.row_key) 
union
select 'ldb.d_calendar_year a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_year a131 
on (a15.year_start_date_key = a131.row_key) 
