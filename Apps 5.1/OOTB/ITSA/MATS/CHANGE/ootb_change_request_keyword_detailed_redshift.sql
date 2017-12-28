select 'ldb.f_change_request a11 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
union
select 'd_calendar_time' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join	ldb.d_calendar_time	a14
	  on 	(a11.opened_time_key = a14.row_key)
union
select 'd_calendar_time_hour' as Table_name, count(1) Row_Count
from ldb.f_change_request a11
join	ldb.d_calendar_time	a14
	  on 	(a11.opened_time_key = a14.row_key)
join	ldb.d_calendar_time_hour	a110
	  on 	(a14.hour_24_format_num = a110.hour_24_format_num)
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_change_request a14 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a14 
on (a11.change_request_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_change_request_category a18 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category a18 
on (a11.category_src_key = a18.row_key) 
union
select 'ldb.d_change_request_impact a19 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_impact a19 
on (a11.impact_src_key = a19.row_key) 
union
select 'ldb.d_change_request_priority a110 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority a110 
on (a11.priority_src_key = a110.row_key) 
union
select 'ldb.d_change_request_reason a111 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reason a111 
on (a11.reason_src_key = a111.row_key) 
union
select 'ldb.d_change_request_reported_type a112 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a112 
on (a11.reported_type_src_key = a112.row_key) 
union
select 'ldb.d_change_request_state a113 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a113 
on (a11.state_src_key = a113.row_key) 
union
select 'ldb.d_change_request_review_status a114 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_review_status a114 
on (a11.review_status_src_key = a114.row_key) 
union
select 'ldb.d_change_request_risk a115 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a115 
on (a11.risk_src_key = a115.row_key) 
union
select 'ldb.d_change_request_scope a116 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a116 
on (a11.scope_src_key = a116.row_key) 
union
select 'ldb.d_change_request_type a117 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a117 
on (a11.type_src_key = a117.row_key) 
union
select 'ldb.d_change_request_urgency a118 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a118 
on (a11.urgency_src_key = a118.row_key) 
union
select 'ldb.d_configuration_item a119 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a119 
on (a11.configuration_item_key = a119.row_key) 
union
select 'ldb.d_internal_organization_department a120 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_department a120 
on (a11.requested_by_department_key = a120.row_key) 
union
select 'ldb.d_domain a121 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_domain a121 
on (a11.domain_key = a121.row_key) 
union
select 'ldb.d_internal_contact_mdm a122 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a122 
on (a13.row_current_key = a122.row_current_key) 
union
select 'ldb.d_location a123 ' as Table_name, count(1) Row_Count
from ldb.f_change_request a11 
join ldb.d_location a123 
on (a11.location_key = a123.row_key) 