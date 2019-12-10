select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
union
select 'ldb.d_parent_change_request_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_parent_change_request_c a14 
on (a11.parent_change_request_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) 
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) 
join ldb.d_calendar_month a17 
on (a16.month_start_date_key = a17.row_key) 
union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17 
on (a16.month_start_date_key = a17.row_key) 
join ldb.d_calendar_quarter a18 
on (a17.quarter_start_date_key = a18.row_key) 
union
select 'ldb.d_change_request a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a19 
on (a11.change_request_key = a19.row_key) 
union
select 'ldb.d_internal_contact_change_closed_by_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_change_closed_by_c a110 
on (a11.closed_by_key = a110.row_key) 
union
select 'ldb.d_internal_contact_opened_by_d_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_opened_by_d_c a111 
on (a11.opened_by_key = a111.row_key) 
union
select 'ldb.d_calendar_week a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) 
join ldb.d_calendar_week a112 
on (a16.week_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_year a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17 
on (a16.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18 
on (a17.quarter_start_date_key = a18.row_key) 
join ldb.d_calendar_year a113 
on (a18.year_start_date_key = a113.row_key) 
union
select 'ldb.d_internal_organization_group a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a114 
on (a11.assignment_group_key = a114.row_key) 
union
select 'ldb.d_change_request_category a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category a115 
on (a11.category_src_key = a115.row_key) 
union
select 'ldb.d_change_request_reported_type a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a116 
on (a11.reported_type_src_key = a116.row_key) 
union
select 'ldb.d_internal_contact_change_owner_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_change_owner_c a117 
on (a11.change_owner_c_key = a117.row_key) 
union
select 'ldb.d_change_request_priority a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority a118 
on (a11.priority_src_key = a118.row_key) 
union
select 'ldb.d_change_request_reason a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reason a119 
on (a11.reason_src_key = a119.row_key) 
union
select 'ldb.d_lov_change_request_impact_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_change_request_impact_c a120 
on (a11.impact_src_key = a120.row_key) 
union
select 'ldb.d_change_request_review_status a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_review_status a121 
on (a11.review_status_src_key = a121.row_key) 
union
select 'ldb.d_change_request_risk a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a122 
on (a11.risk_src_key = a122.row_key) 
union
select 'ldb.d_change_request_scope a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a123 
on (a11.scope_src_key = a123.row_key) 
union
select 'ldb.d_change_request_state a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a119 
on (a11.state_src_key = a119.row_key) 
union
select 'ldb.d_change_request_type a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a125 
on (a11.type_src_key = a125.row_key) 
union
select 'ldb.d_change_request_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a126 
on (a11.urgency_src_key = a126.row_key) 
union
select 'ldb.d_configuration_item a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a127 
on (a11.configuration_item_key = a127.row_key) 
union
select 'ldb.d_internal_organization_department a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_department a128 
on (a11.requested_by_department_key = a128.row_key) 
union
select 'ldb.d_domain a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_domain a129 
on (a11.domain_key = a129.row_key) 
union
select 'ldb.d_internal_contact_mdm a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
join ldb.d_internal_contact_mdm a130 
on (a12.employee_mdm_key = a130.row_key) 
union
select 'ldb.d_lov_change_request_environment_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_change_request_environment_c a131 
on (a11.environment_src_c_key = a131.row_key) 
union
select 'ldb.d_calendar_time_hour a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
join ldb.d_calendar_time_hour a132 
on (a13.hour_key = a132.row_key) 
union
select 'ldb.d_lov_includes_data_change_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_includes_data_change_c a133 
on (a11.includes_data_change_c_key = a133.row_key) 
union
select 'ldb.d_location a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_location a134 
on (a11.location_key = a134.row_key) 
union
select 'ldb.d_lov_change_request_non_prod_environment_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_change_request_non_prod_environment_c a135 
on (a11.non_prod_env_src_c_key = a135.row_key) 
union
select 'ldb.d_lov_change_request_parent_state a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_parent_change_request_c a14 
on (a11.parent_change_request_key = a14.row_key) 
join ldb.d_lov_change_request_parent_state a136 
on (a14.parent_state_src_key = a136.row_key) 
union
select 'ldb.o_data_freshness a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.o_data_freshness a137 
on (a11.source_id = a137.source_id) 
union
select 'ldb.d_internal_contact_change_closed_by_manager_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_change_closed_by_c a110 
on (a11.closed_by_key = a110.row_key) 
join ldb.d_internal_contact_change_closed_by_manager_c a138 
on (a110.manager_c_key = a138.row_key) 
union
select 'ldb.d_internal_contact_change_opened_by_manager_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_opened_by_d_c a111 
on (a11.opened_by_key = a111.row_key) 
join ldb.d_internal_contact_change_opened_by_manager_c a139 
on (a111.manager_c_key = a139.row_key) 

 
