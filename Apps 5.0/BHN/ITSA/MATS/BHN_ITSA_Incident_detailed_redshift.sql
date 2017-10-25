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
select 'ldb.d_incident a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
union
select 'ldb.d_change_request_caused_by a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a110 
on (a11.caused_by_change_key = a110.row_key) 
union
select 'ldb.d_change_request a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a111 
on (a11.change_request_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_calendar_date_fiscal a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a113 
on (a11.opened_on_key = a113.row_key) 
union
select 'ldb.d_calendar_fiscal_period a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a113 
on (a11.opened_on_key = a113.row_key) 
join ldb.d_calendar_fiscal_period a114 
on (a113.period_start_date_key = a114.row_key) 
union
select 'ldb.d_incident_priority a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_priority a115 
on (a11.priority_src_key = a115.row_key) 
union
select 'ldb.d_calendar_date_changed_on_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_calendar_date_changed_on_c a116 
on (a19.changed_on_date_c = a116.row_key) 
union
select 'ldb.d_calendar_week a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_week a117 
on (a18.week_start_date_key = a117.row_key) 
union
select 'ldb.d_calendar_year a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_year a118 
on (a18.year_start_date_key = a118.row_key) 
union
select 'ldb.d_calendar_month a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a119 
on (a18.month_start_date_key = a119.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a120 
on (a11.assigned_to_key = a120.row_key) 
union
select 'ldb.d_incident_call_category_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_call_category_c a121 
on (a11.call_categroy_c_key = a121.row_key) 
union
select 'ldb.d_incident_class_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_class_c a122 
on (a11.class_c_key = a122.row_key) 
union
select 'ldb.d_internal_organization_legalentity a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a123 
on (a11.company_key = a123.row_key) 
union
select 'ldb.d_customer_mdm a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a124 
on (a12.row_current_key = a124.row_current_key) 
union
select 'ldb.d_internal_organization_department a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_organization_department a125 
on (a13.department_key = a125.row_key) 
union
select 'ldb.d_domain a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a126 
on (a11.domain_key = a126.row_key) 
union
select 'ldb.d_internal_contact_mdm a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a127 
on (a13.row_current_key = a127.row_current_key) 
union
select 'ldb.d_calendar_time_hour a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a128 
on (a14.hour_24_format_num = a128.hour_24_format_num) 
union
select 'ldb.d_incident_agebucket a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_agebucket a129 
on (a11.age_key = a129.row_key) 
union
select 'ldb.d_incident_contacttype a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a130 
on (a11.reported_type_src_key = a130.row_key) 
union
select 'ldb.d_incident_impact a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a131 
on (a11.impact_src_key = a131.row_key) 
union
select 'ldb.d_incident_urgency a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a132 
on (a11.urgency_src_key = a132.row_key) 
union
select 'ldb.d_incident_lob_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_lob_c a133 
on (a11.line_of_business_c_key = a133.row_key) 
union
select 'ldb.d_location a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a134 
on (a11.location_key = a134.row_key) 
union
select 'ldb.d_internal_contact_manager_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_manager_c a135 
on (a13.manager_c_key = a135.row_key) 
union
select 'ldb.o_data_freshness a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.o_data_freshness a136 
on (a11.source_id = a136.source_id) 
union
select 'ldb.d_internal_contact_task_closed_by a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_task_closed_by a137 
on (a11.closed_by_key = a137.row_key) 
union
select 'ldb.d_internal_contact_task_resolved_by a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_task_resolved_by a138 
on (a11.last_resolved_by_key = a138.row_key) 
union
select 'ldb.d_business_service_criticality a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_criticality a140 
on (a17.criticality_key = a140.row_key) 
union
select 'ldb.d_business_service_used_for a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_used_for a141 
on (a17.used_for_src_key = a141.row_key) 
union
select 'ldb.d_calendar_fiscal_week a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a113 
on (a11.opened_on_key = a113.row_key) 
join ldb.d_calendar_fiscal_week a142 
on (a113.week_start_date_key = a142.row_key) 
union
select 'ldb.d_incident_category a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_category a143 
on (a19.category_src_key = a143.row_key) 
union
select 'ldb.d_incident_close_code a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_close_code a144 
on (a19.close_code_src_key = a144.row_key) 
union
select 'ldb.d_incident_severity a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_severity a145 
on (a19.severity_src_key = a145.row_key) 
union
select 'ldb.d_incident_state a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_state a146 
on (a19.state_src_key = a146.row_key) 
union
select 'ldb.d_incident_subcategory a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_subcategory a147 
on (a19.sub_category_src_key = a147.row_key) 
union
select 'ldb.d_internal_contact_manager_assigned_to a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a120 
on (a11.assigned_to_key = a120.row_key) 
join ldb.d_internal_contact_manager_assigned_to a148 
on (a120.manager_c_key = a148.row_key) 
union
select 'ldb.d_calendar_quarter a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_quarter a149 
on (a18.quarter_start_date_key = a149.row_key) 
union
select 'ldb.d_calendar_fiscal_year a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a113 
on (a11.opened_on_key = a113.row_key) 
join ldb.d_calendar_fiscal_year a150 
on (a113.year_start_date_key = a150.row_key) 
