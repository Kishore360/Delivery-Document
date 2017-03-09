select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_business_service a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a13 
on (a11.business_service_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_change_request a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a15 
on (a11.change_request_key = a15.row_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_change_request_category a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category a19 
on (a11.category_src_key = a19.row_key) 
union
select 'ldb.d_change_request_impact a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_impact a110 
on (a11.impact_src_key = a110.row_key) 
union
select 'ldb.d_change_request_priority a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority a111 
on (a11.priority_src_key = a111.row_key) 
union
select 'ldb.d_change_request_reason a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reason a112 
on (a11.reason_src_key = a112.row_key) 
union
select 'ldb.d_change_request_reported_type a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a113 
on (a11.reported_type_src_key = a113.row_key) 
union
select 'ldb.d_change_request_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a114 
on (a11.state_src_key = a114.row_key) 
union
select 'ldb.d_change_request_review_status a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_review_status a115 
on (a11.review_status_src_key = a115.row_key) 
union
select 'ldb.d_change_request_risk a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a116 
on (a11.risk_src_key = a116.row_key) 
union
select 'ldb.d_change_request_scope a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a117 
on (a11.scope_src_key = a117.row_key) 
union
select 'ldb.d_change_request_type a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a118 
on (a11.type_src_key = a118.row_key) 
union
select 'ldb.d_change_request_urgency a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a119 
on (a11.urgency_src_key = a119.row_key) 
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
select 'ldb.d_business_service_criticality a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a13 
on (a11.business_service_key = a13.row_key) 
join ldb.d_business_service_criticality a124 
on (a13.criticality_key = a124.row_key) 
union
select 'ldb.d_business_service_used_for a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a13 
on (a11.business_service_key = a13.row_key) 
join ldb.d_business_service_used_for a125 
on (a13.used_for_src_key = a125.row_key) 
union
select 'ldb.d_calendar_month a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a126 
on (a14.month_start_date_key = a126.row_key) 
union
select 'ldb.d_calendar_week a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_week a127 
on (a14.week_start_date_key = a127.row_key) 
union
select 'ldb.d_calendar_quarter a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_quarter a128 
on (a14.quarter_start_date_key = a128.row_key) 

