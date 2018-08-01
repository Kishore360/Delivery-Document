select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_business_service a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request a16 
on (a11.change_request_key = a16.row_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a18 
on (a11.date_key = a18.row_key) 
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a18 
on (a11.date_key = a18.row_key) 
join ldb.d_calendar_month a19 
on (a18.month_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a18 
on (a11.date_key = a18.row_key) join ldb.d_calendar_month a19 
on (a18.month_start_date_key = a19.row_key) 
join ldb.d_calendar_quarter a110 
on (a19.quarter_start_date_key = a110.row_key) 
union
select 'ldb.d_change_request_risk a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_risk a111 
on (a11.risk_src_key = a111.row_key) 
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
select 'ldb.d_change_request_scope a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_scope a119 
on (a11.scope_src_key = a119.row_key) 
union
select 'ldb.d_change_request_state a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_state a120 
on (a11.state_src_key = a120.row_key) 
union
select 'ldb.d_change_request_type a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_type a121 
on (a11.type_src_key = a121.row_key) 
union
select 'ldb.d_change_request_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_urgency a122 
on (a11.urgency_src_key = a122.row_key) 
union
select 'ldb.d_internal_organization_department a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_department a123 
on (a11.requested_by_department_key = a123.row_key) 
union
select 'ldb.d_domain a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_domain a124 
on (a11.domain_key = a124.row_key) 
union
select 'ldb.d_internal_contact_mdm a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
join ldb.d_internal_contact_mdm a125 
on (a12.employee_mdm_key = a125.row_key) 
union
select 'ldb.d_location a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_location a126 
on (a11.location_key = a126.row_key) 
union
select 'ldb.d_business_service_criticality a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
join ldb.d_business_service_criticality a127 
on (a15.criticality_key = a127.row_key) 
union
select 'ldb.d_business_service_used_for a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
join ldb.d_business_service_used_for a128 
on (a15.used_for_src_key = a128.row_key) 
union
select 'ldb.d_lov_configuration_service_used_for_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
join ldb.d_lov_configuration_service_used_for_c a129 
on (a17.ci_used_for_c_key = a129.row_key) 
union
select 'ldb.d_calendar_week a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a18 
on (a11.date_key = a18.row_key) 
join ldb.d_calendar_week a130 
on (a18.week_start_date_key = a130.row_key) 
union
select 'ldb.d_internal_contact_change_coordinator_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request a16 
on (a11.change_request_key = a16.row_key) 
join ldb.d_internal_contact_change_coordinator_c a131 
on (a16.change_coordinator_c_key = a131.row_key) 
union
select 'ldb.d_internal_contact_manager_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request a16 
on (a11.change_request_key = a16.row_key) 
join ldb.d_internal_contact_manager_c a132 
on (a16.change_manager_c_key = a132.row_key) 
union
select 'ldb.d_calendar_year a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a18 
on (a11.date_key = a18.row_key) join ldb.d_calendar_month a19 
on (a18.month_start_date_key = a19.row_key) join ldb.d_calendar_quarter a110 
on (a19.quarter_start_date_key = a110.row_key) 
join ldb.d_calendar_year a133 
on (a110.year_start_date_key = a133.row_key); 
