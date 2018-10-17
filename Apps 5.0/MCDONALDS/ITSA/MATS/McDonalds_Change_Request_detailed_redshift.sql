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
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a16 
on (a11.business_service_c_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_internal_contact_change_approver_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_change_approver_c a19 
on (a11.change_approver_c_key = a19.row_key) 
union
select 'ldb.d_change_request_category a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category a110 
on (a11.category_src_key = a110.row_key) 
union
select 'ldb.d_change_request_reported_type a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a111 
on (a11.reported_type_src_key = a111.row_key) 
union
select 'ldb.d_change_request_impact a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_impact a112 
on (a11.impact_src_key = a112.row_key) 
union
select 'ldb.d_change_request_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority a113 
on (a11.priority_src_key = a113.row_key) 
union
select 'ldb.d_change_request_reason a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reason a114 
on (a11.reason_src_key = a114.row_key) 
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
select 'ldb.d_change_request_state a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a118 
on (a11.state_src_key = a118.row_key) 
union
select 'ldb.d_change_request_type a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a119 
on (a11.type_src_key = a119.row_key) 
union
select 'ldb.d_change_request_urgency a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a120 
on (a11.urgency_src_key = a120.row_key) 
union
select 'ldb.d_change_request_data_ceneter_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_data_ceneter_c a121 
on (a11.data_center_c_key = a121.row_key) 
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
select 'ldb.d_scafe_core_realm_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_scafe_core_realm_c a125 
on (a11.scafe_core_realm_c_key = a125.row_key) 
union
select 'ldb.d_change_request_standard_change_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_standard_change_c a126 
on (a11.standard_change_c_key = a126.row_key) 
union
select 'ldb.d_location a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_location a127 
on (a11.location_key = a127.row_key) 
union
select 'ldb.d_change_request_third_party_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_third_party_c a128 
on (a11.third_party_c_key = a128.row_key) 
union
select 'ldb.d_lov_change_request_affected_environment_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_lov_change_request_affected_environment_c a129 
on (a13.affected_environment_src_c_key = a129.row_key) 
union
select 'ldb.d_internal_organization_vendor_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.d_internal_organization_vendor_c a130 
on (a15.vendor_c_key = a130.row_key) 
union
select 'ldb.d_business_service_criticality a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a16 
on (a11.business_service_c_key = a16.row_key) 
join ldb.d_business_service_criticality a131 
on (a16.criticality_key = a131.row_key) 
union
select 'ldb.d_internal_contact_service_owned_by_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a16 
on (a11.business_service_c_key = a16.row_key) 
join ldb.d_internal_contact_service_owned_by_c a132 
on (a16.owned_by_c_key = a132.row_key) 
union
select 'ldb.d_business_service_used_for a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a16 
on (a11.business_service_c_key = a16.row_key) 
join ldb.d_business_service_used_for a133 
on (a16.used_for_src_key = a133.row_key) 
union
select 'ldb.d_calendar_week a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_week a134 
on (a17.week_start_date_key = a134.row_key) 
union
select 'ldb.d_lov_change_request_closure_code_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_lov_change_request_closure_code_c a135 
on (a13.closure_code_src_c_key = a135.row_key) 
union
select 'ldb.d_change_request_cmdb_location_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join ldb.d_change_request_cmdb_location_c a136 
on (a18.cmdb_location_c_key = a136.row_key) 
union
select 'ldb.d_lov_change_request_database_type_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_lov_change_request_database_type_c a137 
on (a13.database_type_src_c_key = a137.row_key) 
union
select 'ldb.d_calendar_month a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_month a138 
on (a17.month_start_date_key = a138.row_key) 
union
select 'ldb.d_calendar_quarter a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_quarter a139 
on (a17.quarter_start_date_key = a139.row_key) 
union
select 'ldb.d_calendar_year a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_year a140 
on (a17.year_start_date_key = a140.row_key) 
