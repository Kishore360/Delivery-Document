select 'ldb.f_adhoc_request_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
union
select 'ldb.d_internal_organization_legalentity a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_internal_organization_legalentity a12 
on (a11.company_key = a12.row_key) 
union
select 'ldb.d_location a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_location a13 
on (a11.location_key = a13.row_key) 
union
select 'ldb.d_customer a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_customer a14 
on (a11.customer_key = a14.row_key) 
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
union
select 'ldb.d_calendar_time a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_calendar_time a16 
on (a11.opened_time_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.dh_assignment_group_tier_hierarchy a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.dh_assignment_group_tier_hierarchy a19 
on (a11.assignment_group_key = a19.user_group_tier_key) 
union
select 'ldb.dh_assignment_group_type_hierarchy a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.dh_assignment_group_type_hierarchy a110 
on (a11.assignment_group_key = a110.user_group_type_key) 
union
select 'ldb.d_calendar_date a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
union
select 'ldb.d_adhoc_request_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_adhoc_request_c a112 
on (a11.adhoc_request_c_key = a112.row_key) 
union
select 'ldb.d_change_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_change_request a113 
on (a11.change_request_key = a113.row_key) 
union
select 'ldb.d_configuration_item a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_configuration_item a114 
on (a11.configuration_item_key = a114.row_key) 
union
select 'ldb.d_calendar_week a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_week a115 
on (a111.week_start_date_key = a115.row_key) 
union
select 'ldb.d_lov_adhoc_request_category_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_lov_adhoc_request_category_c a116 
on (a11.category_src_key = a116.row_key) 
union
select 'ldb.d_lov_adhoc_request_contacttype_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_lov_adhoc_request_contacttype_c a117 
on (a11.reported_type_src_key = a117.row_key) 
union
select 'ldb.d_lov_adhoc_request_priority_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_lov_adhoc_request_priority_c a118 
on (a11.priority_src_key = a118.row_key) 
union
select 'ldb.d_lov_adhoc_request_state_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_lov_adhoc_request_state_c a119 
on (a11.state_src_key = a119.row_key) 
union
select 'ldb.d_lov_adhoc_request_subcategory_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_lov_adhoc_request_subcategory_c a120 
on (a11.sub_category_src_key = a120.row_key) 
union
select 'ldb.d_lov_adhoc_request_urgency_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_lov_adhoc_request_urgency_c a121 
on (a11.urgency_src_key = a121.row_key) 
union
select 'ldb.d_configuration_item a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_configuration_item a122 
on (a11.business_service_c_key = a122.row_key) 
union
select 'ldb.d_customer_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_customer a14 
on (a11.customer_key = a14.row_key) 
join ldb.d_customer_mdm a123 
on (a14.row_current_key = a123.row_current_key) 
union
select 'ldb.d_internal_organization_department a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_internal_organization_department a124 
on (a11.opened_by_department_key = a124.row_key) 
union
select 'ldb.d_domain a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_domain a125 
on (a11.domain_key = a125.row_key) 
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
join ldb.d_internal_contact_mdm a126 
on (a15.row_current_key = a126.row_current_key) 
union
select 'ldb.d_calendar_time_hour a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_calendar_time a16 
on (a11.opened_time_key = a16.row_key) 
join ldb.d_calendar_time_hour a127 
on (a16.hour_24_format_num = a127.hour_24_format_num) 
union
select 'ldb.d_incident_impact a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_incident_impact a128 
on (a11.impact_src_key = a128.row_key) 
union
select 'ldb.d_calendar_month a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_month a129 
on (a111.month_start_date_key = a129.row_key) 
union
select 'ldb.d_calendar_quarter a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_quarter a130 
on (a111.quarter_start_date_key = a130.row_key) 
union
select 'ldb.d_calendar_year a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_year a131 
on (a111.year_start_date_key = a131.row_key) 
