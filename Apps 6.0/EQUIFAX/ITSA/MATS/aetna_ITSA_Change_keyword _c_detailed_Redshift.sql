select 'ldb.f_change_request_keyword a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_change_request a16 
on (a11.change_request_key = a16.row_key) 
union
select 'ldb.d_change_request_category a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_change_request_category a17 
on (a11.category_src_key = a17.row_key) 
union
select 'ldb.d_change_request_reported_type a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_change_request_reported_type a18 
on (a11.reported_type_src_key = a18.row_key) 
union
select 'ldb.d_change_request_impact a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_change_request_impact a19 
on (a11.impact_src_key = a19.row_key) 
union
select 'ldb.d_change_request_priority a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_change_request_priority a110 
on (a11.priority_src_key = a110.row_key) 
union
select 'ldb.d_change_request_reason a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_change_request_reason a111 
on (a11.reason_src_key = a111.row_key) 
union
select 'ldb.d_change_request_review_status a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_change_request_review_status a112 
on (a11.review_status_src_key = a112.row_key) 
union
select 'ldb.d_change_request_risk a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_change_request_risk a113 
on (a11.risk_src_key = a113.row_key) 
union
select 'ldb.d_change_request_scope a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_change_request_scope a114 
on (a11.scope_src_key = a114.row_key) 
union
select 'ldb.d_change_request_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_change_request_state a115 
on (a11.state_src_key = a115.row_key) 
union
select 'ldb.d_change_request_type a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_change_request_type a116 
on (a11.type_src_key = a116.row_key) 
union
select 'ldb.d_change_request_urgency a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_change_request_urgency a117 
on (a11.urgency_src_key = a117.row_key) 
union
select 'ldb.d_configuration_item a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_configuration_item a118 
on (a11.configuration_item_key = a118.row_key) 
union
select 'ldb.d_internal_organization_department a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_internal_organization_department a119 
on (a11.requested_by_department_key = a119.row_key) 
union
select 'ldb.d_domain a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_domain a120 
on (a11.domain_key = a120.row_key) 
union
select 'ldb.d_internal_contact_mdm a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a121 
on (a12.row_current_key = a121.row_current_key) 
union
select 'ldb.d_location a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_location a122 
on (a11.location_key = a122.row_key) 
union
select 'ldb.d_calendar_month a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_month a123 
on (a15.month_start_date_key = a123.row_key) 
union
select 'ldb.d_calendar_week a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_week a124 
on (a15.week_start_date_key = a124.row_key) 
union
select 'ldb.d_calendar_quarter a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_quarter a125 
on (a15.quarter_start_date_key = a125.row_key) 
union
select 'ldb.d_calendar_year a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_keyword a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_year a126 
on (a15.year_start_date_key = a126.row_key) 