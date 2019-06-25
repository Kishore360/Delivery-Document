select 'ldb.f_incident_asc_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
union
select 'ldb.d_calendar_time a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_calendar_time a12 
on (a11.time_key_c = a12.row_key) 
union
select 'ldb.d_incident_asc_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_incident_asc_c a13 
on (a11.incident_asc_c_key = a13.row_key) 
union
select 'ldb.d_business_service a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_business_service a14 
on (a11.asc_incident_business_service_c_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_calendar_date a15 
on (a11.date_key_c = a15.row_key) 
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_calendar_date a15 
on (a11.date_key_c = a15.row_key) 
join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) 
union
select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_calendar_date a15 
on (a11.date_key_c = a15.row_key) join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) 
join ldb.d_calendar_quarter a17 
on (a16.quarter_start_date_key = a17.row_key) 
union
select 'ldb.d_calendar_week a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_calendar_date a15 
on (a11.date_key_c = a15.row_key) 
join ldb.d_calendar_week a18 
on (a15.week_start_date_key = a18.row_key) 
union
select 'ldb.d_calendar_year a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_calendar_date a15 
on (a11.date_key_c = a15.row_key) join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) join ldb.d_calendar_quarter a17 
on (a16.quarter_start_date_key = a17.row_key) 
join ldb.d_calendar_year a19 
on (a17.year_start_date_key = a19.row_key) 
union
select 'ldb.d_problem a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_problem a110 
on (a11.asc_problem_c_key = a110.row_key) 
union
select 'ldb.d_lov_incident_asc_caller_type_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_lov_incident_asc_caller_type_c a111 
on (a11.asc_incident_caller_type_c_key = a111.row_key) 
union
select 'ldb.d_lov_incident_asc_impact_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_lov_incident_asc_impact_c a112 
on (a11.asc_incident_impact_c_key = a112.row_key) 
union
select 'ldb.d_lov_incident_asc_priority_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_lov_incident_asc_priority_c a113 
on (a11.asc_incident_priority_c_key = a113.row_key) 
union
select 'ldb.d_lov_incident_asc_urgency_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_lov_incident_asc_urgency_c a114 
on (a11.asc_incident_urgency_c_key = a114.row_key) 
union
select 'ldb.d_lov_incident_asc_lob_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_lov_incident_asc_lob_c a115 
on (a11.asc_incident_line_of_business_c_key = a115.row_key) 
union
select 'ldb.d_lov_incident_asc_contact_type_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_lov_incident_asc_contact_type_c a116 
on (a11.asc_incident_contact_type_c_key = a116.row_key) 
union
select 'ldb.d_lov_incident_asc_resolution_type_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_lov_incident_asc_resolution_type_c a117 
on (a11.asc_incident_resolution_type_c_key = a117.row_key) 
union
select 'ldb.d_lov_incident_asc_escalation_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_lov_incident_asc_escalation_c a118 
on (a11.asc_incident_escalation_c_key = a118.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_internal_contact_assigned_to a119 
on (a11.asc_incident_assigned_to_c_key = a119.row_key) 
union
select 'ldb.d_internal_organization_group a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_internal_organization_group a120 
on (a11.asc_incident_assignment_group_c_key = a120.row_key) 
union
select 'ldb.d_internal_contact_caller_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_internal_contact_caller_c a121 
on (a11.asc_incident_caller_c_key = a121.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_internal_contact_closed_by_c a122 
on (a11.asc_incident_closed_by_key = a122.row_key) 
union
select 'ldb.d_configuration_item a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_configuration_item a123 
on (a11.asc_incident_configuration_item_c_key = a123.row_key) 
union
select 'ldb.d_internal_organization_department a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_internal_organization_department a124 
on (a11.asc_incident_opened_by_department_c_key = a124.row_key) 
union
select 'ldb.d_calendar_time_hour a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_calendar_time a12 
on (a11.time_key_c = a12.row_key) 
join ldb.d_calendar_time_hour a125 
on (a12.hour_key = a125.row_key) 
union
select 'ldb.d_internal_contact_created_by_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_internal_contact_created_by_c a126 
on (a11.asc_incident_opened_by_key = a126.row_key) 
union
select 'ldb.d_location a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_location a127 
on (a11.asc_incident_location_c_key = a127.row_key) 
union
select 'ldb.d_internal_contact_resolved_by a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_internal_contact_resolved_by a128 
on (a11.asc_incident_last_resolved_by_c_key = a128.row_key) 
union
select 'ldb.o_data_freshness a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.o_data_freshness a129 
on (a11.source_id = a129.source_id) 
union
select 'ldb.d_lov_incident_asc_category_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_incident_asc_c a13 
on (a11.incident_asc_c_key = a13.row_key) 
join ldb.d_lov_incident_asc_category_c a130 
on (a13.asc_incident_category_c_key = a130.row_key) 
union
select 'ldb.d_lov_incident_asc_state_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_incident_asc_c a13 
on (a11.incident_asc_c_key = a13.row_key) 
join ldb.d_lov_incident_asc_state_c a131 
on (a13.asc_incident_state_c_key = a131.row_key) 
union
select 'ldb.d_lov_incident_asc_subcategory_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_incident_asc_c a13 
on (a11.incident_asc_c_key = a13.row_key) 
join ldb.d_lov_incident_asc_subcategory_c a132 
on (a13.asc_incident_sub_category_c_key = a132.row_key) 
union
select 'ldb.d_business_service_criticality a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_business_service a14 
on (a11.asc_incident_business_service_c_key = a14.row_key) 
join ldb.d_business_service_criticality a133 
on (a14.criticality_key = a133.row_key) 
union
select 'ldb.d_business_service_used_for a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_asc_c a11 
join ldb.d_business_service a14 
on (a11.asc_incident_business_service_c_key = a14.row_key) 
join ldb.d_business_service_used_for a134 
on (a14.used_for_src_key = a134.row_key) 