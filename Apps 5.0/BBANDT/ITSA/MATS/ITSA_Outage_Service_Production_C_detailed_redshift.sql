select 'ldb.f_incident_outage a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_archer_application_c a12
on (a11.application_archer_c_key = a12.row_key)
union
select 'ldb.d_software_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_software_c a13
on (a11.archer_id_c_key = a13.row_key)
union
select 'ldb.d_application a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a14
on (a11.application_key = a14.row_key)
union
select 'ldb.d_business_service a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a15
on (a11.business_service_key = a15.row_key)
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a16
on (a11.start_on_key = a16.row_key)
union
select 'ldb.d_change_request_caused_by a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a17
on (a11.caused_by_change_key = a17.row_key)
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a18
on (a11.configuration_item_key = a18.row_key)
union
select 'ldb.d_incident a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a19
on (a11.incident_key = a19.row_key)
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a16
on (a11.start_on_key = a16.row_key)
join ldb.d_calendar_month a110
on (a16.month_start_date_key = a110.row_key)
union
select 'ldb.d_outage a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a111
on (a11.outage_key = a111.row_key)
union
select 'ldb.d_problem a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a112
on (a11.incident_related_problem_c_key = a112.row_key)
union
select 'ldb.d_eit_application_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_eit_application_c a113
on (a11.eit_application_c_key = a113.row_key)
union
select 'ldb.d_internal_contact_assigned_to a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_internal_contact_assigned_to a114
on (a11.assigned_to_key = a114.row_key)
union
select 'ldb.d_internal_organization_group a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_internal_organization_group a115
on (a11.assignment_group_key = a115.row_key)
union
select 'ldb.d_configuration_item_incident a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item_incident a116
on (a11.incident_configuration_item_key = a116.row_key)
union
select 'ldb.d_incident_contacttype a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_contacttype a117
on (a11.reported_type_src_key = a117.row_key)
union
select 'ldb.d_incident_impact a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_impact a118
on (a11.impact_src_key = a118.row_key)
union
select 'ldb.d_incident_urgency a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_urgency a119
on (a11.urgency_src_key = a119.row_key)
union
select 'ldb.d_application_tier a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a14
on (a11.application_key = a14.row_key)
join ldb.d_application_tier a120
on (a14.tier_src_key = a120.row_key)
union
select 'ldb.d_application_used_for a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a14
on (a11.application_key = a14.row_key)
join ldb.d_application_used_for a121
on (a14.used_for_src_key = a121.row_key)
union
select 'ldb.d_business_service_criticality a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a15
on (a11.business_service_key = a15.row_key)
join ldb.d_business_service_criticality a122
on (a15.criticality_key = a122.row_key)
union
select 'ldb.d_business_service_used_for a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a15
on (a11.business_service_key = a15.row_key)
join ldb.d_business_service_used_for a123
on (a15.used_for_src_key = a123.row_key)
union
select 'ldb.d_calendar_week a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a16
on (a11.start_on_key = a16.row_key)
join ldb.d_calendar_week a124
on (a16.week_start_date_key = a124.row_key)
union
select 'ldb.d_lov_configuration_item_tier_rating_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a18
on (a11.configuration_item_key = a18.row_key)
join ldb.d_lov_configuration_item_tier_rating_c a125
on (a18.tier_rating_c_key = a125.row_key)
union
select 'ldb.d_incident_category a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_category a126
on (a19.category_src_key = a126.row_key)
union
select 'ldb.d_incident_priority a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_priority a127
on (a19.priority_src_key = a127.row_key)
union
select 'ldb.d_incident_subcategory a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_subcategory a128
on (a19.sub_category_src_key = a128.row_key)
union
select 'ldb.d_outage_type a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a111
on (a11.outage_key = a111.row_key)
join ldb.d_outage_type a129
on (a111.outage_type_src_key = a129.row_key)
union
select 'ldb.d_calendar_quarter a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a16
on (a11.start_on_key = a16.row_key)
join ldb.d_calendar_quarter a130
on (a16.quarter_start_date_key = a130.row_key)
union
select 'ldb.d_calendar_year a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a16
on (a11.start_on_key = a16.row_key)
join ldb.d_calendar_year a131
on (a16.year_start_date_key = a131.row_key)