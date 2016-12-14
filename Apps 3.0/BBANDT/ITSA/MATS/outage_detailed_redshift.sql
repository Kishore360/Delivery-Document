select 'ldb.f_incident_outage a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
union
select 'ldb.d_change_request_caused_by a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_change_request_caused_by a12 
on (a11.caused_by_change_key = a12.row_key) 
union
select 'ldb.d_application a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_application a13 
on (a11.application_key = a13.row_key) 
union
select 'ldb.d_business_service a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_business_service a14 
on (a11.business_service_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_calendar_date a15 
on (a11.start_on_key = a15.row_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_incident a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
union
select 'ldb.d_outage a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_outage a18 
on (a11.outage_key = a18.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_internal_contact_assigned_to a19 
on (a11.assigned_to_key = a19.row_key) 
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) 
union
select 'ldb.d_configuration_item_incident a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_configuration_item_incident a111 
on (a11.incident_configuration_item_key = a111.row_key) 
union
select 'ldb.d_task_impact a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_task_impact a112 
on (a11.impact_src_key = a112.row_key) 
union
select 'ldb.d_task_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_task_priority a113 
on (a11.priority_src_key = a113.row_key) 
union
select 'ldb.d_task_contacttype a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_task_contacttype a114 
on (a11.reported_type_src_key = a114.row_key) 
union
select 'ldb.d_task_urgency a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_task_urgency a115 
on (a11.urgency_src_key = a115.row_key) 
union
select 'ldb.d_application_tier a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_application a13 
on (a11.application_key = a13.row_key) 
join ldb.d_application_tier a116 
on (a13.tier_src_key = a116.row_key) 
union
select 'ldb.d_application_used_for a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_application a13 
on (a11.application_key = a13.row_key) 
join ldb.d_application_used_for a117 
on (a13.used_for_src_key = a117.row_key) 
union
select 'ldb.d_business_service_criticality a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_business_service a14 
on (a11.business_service_key = a14.row_key) 
join ldb.d_business_service_criticality a118 
on (a14.criticality_key = a118.row_key) 
union
select 'ldb.d_business_service_used_for a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_business_service a14 
on (a11.business_service_key = a14.row_key) 
join ldb.d_business_service_used_for a119 
on (a14.used_for_src_key = a119.row_key) 
union
select 'ldb.d_incident_category a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_category a120 
on (a17.category_src_key = a120.row_key) 
union
select 'ldb.d_incident_subcategory a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_subcategory a121 
on (a17.sub_category_src_key = a121.row_key) 
union
select 'ldb.d_calendar_month a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_calendar_date a15 
on (a11.start_on_key = a15.row_key) 
join ldb.d_calendar_month a122 
on (a15.month_start_date_key = a122.row_key) 
union
select 'ldb.d_outage_type a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_outage a18 
on (a11.outage_key = a18.row_key) 
join ldb.d_outage_type a123 
on (a18.outage_type_src_key = a123.row_key) 
union
select 'ldb.d_calendar_quarter a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_calendar_date a15 
on (a11.start_on_key = a15.row_key) 
join ldb.d_calendar_quarter a124 
on (a15.quarter_start_date_key = a124.row_key) 
union
select 'ldb.d_calendar_year a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11 
join ldb.d_calendar_date a15 
on (a11.start_on_key = a15.row_key) 
join ldb.d_calendar_year a125 
on (a15.year_start_date_key = a125.row_key) 
