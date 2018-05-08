select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_customer a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_location a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a19 
on (a11.location_key = a19.row_key) 
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a110 
on (a11.configuration_item_key = a110.row_key) 
union
select 'ldb.d_calendar_week a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_week a111 
on (a18.week_start_date_key = a111.row_key) 
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) join ldb.d_calendar_week a111 
on (a18.week_start_date_key = a111.row_key) 
join ldb.d_calendar_month a112 
on (a111.month_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_quarter a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) join ldb.d_calendar_week a111 
on (a18.week_start_date_key = a111.row_key) join ldb.d_calendar_month a112 
on (a111.month_start_date_key = a112.row_key) 
join ldb.d_calendar_quarter a113 
on (a112.quarter_start_date_key = a113.row_key) 
union
select 'ldb.d_calendar_year a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) join ldb.d_calendar_week a111 
on (a18.week_start_date_key = a111.row_key) join ldb.d_calendar_month a112 
on (a111.month_start_date_key = a112.row_key) join ldb.d_calendar_quarter a113 
on (a112.quarter_start_date_key = a113.row_key) 
join ldb.d_calendar_year a114 
on (a113.year_start_date_key = a114.row_key) 
union
select 'ldb.d_problem a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_problem a115 
on (a11.problem_key = a115.row_key) 
union
select 'ldb.d_reported_for_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_reported_for_c a116 
on (a16.reported_for_c_key = a116.row_key) 
union
select 'ldb.d_internal_contact a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a117 
on (a11.last_resolved_by_key = a117.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_opened_by_c a118 
on (a11.opened_by_c_key = a118.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a119 
on (a11.assigned_to_key = a119.row_key) 
union
select 'ldb.d_change_request_caused_by a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a120 
on (a11.caused_by_change_key = a120.row_key) 
union
select 'ldb.d_change_request a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a121 
on (a11.change_request_key = a121.row_key) 
union
select 'ldb.d_internal_organization_legalentity a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a122 
on (a11.company_key = a122.row_key) 
union
select 'ldb.d_customer_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a123 
on (a12.row_current_key = a123.row_current_key) 
union
select 'ldb.d_internal_organization_department a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_department a124 
on (a11.opened_by_department_key = a124.row_key) 
union
select 'ldb.d_domain a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a125 
on (a11.domain_key = a125.row_key) 
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a126 
on (a13.row_current_key = a126.row_current_key) 
union
select 'ldb.d_calendar_time_hour a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a127 
on (a14.hour_24_format_num = a127.hour_24_format_num) 
union
select 'ldb.d_incident_agebucket a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_agebucket a128 
on (a11.age_key = a128.row_key) 
union
select 'ldb.d_internal_contact_mi_primary_owner_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_mi_primary_owner_c a129 
on (a11.mi_primary_owner_c_key = a129.row_key) 
union
select 'ldb.d_task_impact a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a130 
on (a11.impact_src_key = a130.row_key) 
union
select 'ldb.d_task_priority a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a131 
on (a11.priority_src_key = a131.row_key) 
union
select 'ldb.d_task_contacttype a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_contacttype a132 
on (a11.reported_type_src_key = a132.row_key) 
union
select 'ldb.d_task_urgency a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_urgency a133 
on (a11.urgency_src_key = a133.row_key) 
union
select 'ldb.d_business_impact_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_business_impact_c a134 
on (a16.business_impact_c_key = a134.row_key) 
union
select 'ldb.d_business_service_criticality a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_criticality a135 
on (a17.criticality_key = a135.row_key) 
union
select 'ldb.d_business_service_used_for a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_used_for a136 
on (a17.used_for_src_key = a136.row_key) 
union
select 'ldb.d_fujitsu_location_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_fujitsu_location_c a137 
on (a16.fujitsu_location_c_key = a137.row_key) 
union
select 'ldb.d_gps_reporting_group_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_gps_reporting_group_c a138 
on (a16.gps_reporting_group_c_key = a138.row_key) 
union
select 'ldb.d_incident_category a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_category a139 
on (a16.category_src_key = a139.row_key) 
union
select 'ldb.d_incident_close_code a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_close_code a140 
on (a16.close_code_src_key = a140.row_key) 
union
select 'ldb.d_incident_severity a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_severity a141 
on (a16.severity_src_key = a141.row_key) 
union
select 'ldb.d_incident_state a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_state a142 
on (a16.state_src_key = a142.row_key) 
union
select 'ldb.d_incident_subcategory a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_subcategory a143 
on (a16.sub_category_src_key = a143.row_key) 
union
select 'ldb.d_incident_type_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_type_c a144 
on (a16.incident_type_c_key = a144.row_key) 
union
select 'ldb.d_root_cause_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_root_cause_c a145 
on (a16.root_cause_c_key = a145.row_key) 
union
select 'ldb.d_internal_organization_business_group_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) join ldb.d_reported_for_c a116 
on (a16.reported_for_c_key = a116.row_key) 
join ldb.d_internal_organization_business_group_c a146 
on (a116.business_group_c_key = a146.row_key) 
