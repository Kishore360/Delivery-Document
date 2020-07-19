select 'ldb.f_incident_outage a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_archer_application_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_archer_application_c a13
on (a11.application_archer_c_key = a13.row_key)
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
union
select 'ldb.d_archer_software_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_archer_software_c a15
on (a11.archer_id_c_key = a15.row_key)
union
select 'ldb.d_application_mdm a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a16
on (a12.mdm_key = a16.row_key)
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key)
union
select 'ldb.d_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key) join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key)
join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
union
select 'ldb.d_change_request_caused_by a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a111
on (a11.caused_by_change_key = a111.row_key)
union
select 'ldb.d_configuration_item_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_configuration_item_mdm a112
on (a14.mdm_key = a112.row_key)
union
select 'ldb.d_incident a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a113
on (a11.incident_key = a113.row_key)
union
select 'ldb.d_calendar_year a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key) join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key) join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
join ldb.d_calendar_year a114
on (a110.year_start_date_key = a114.row_key)
union
select 'ldb.d_outage a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a115
on (a11.outage_key = a115.row_key)
union
select 'ldb.d_internal_contact_assigned_to a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_internal_contact_assigned_to a116
on (a11.assigned_to_key = a116.row_key)
union
select 'ldb.d_internal_organization_group a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_internal_organization_group a117
on (a11.assignment_group_key = a117.row_key)
union
select 'ldb.d_eit_application_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_eit_application_c a118
on (a11.eit_application_c_key = a118.row_key)
union
select 'ldb.d_incident_contacttype a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_contacttype a119
on (a11.incident_reported_type_src_key = a119.row_key)
union
select 'ldb.d_incident_impact a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_impact a120
on (a11.incident_impact_src_key = a120.row_key)
union
select 'ldb.d_incident_urgency a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_urgency a121
on (a11.incident_urgency_src_key = a121.row_key)
union
select 'ldb.d_problem a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a122
on (a11.incident_related_problem_c_key = a122.row_key)
union
select 'ldb.d_application_tier a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_tier a123
on (a12.tier_src_key = a123.row_key)
union
select 'ldb.d_application_used_for a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_used_for a124
on (a12.used_for_src_key = a124.row_key)
union
select 'ldb.d_business_service_criticality a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_criticality a125
on (a17.criticality_key = a125.row_key)
union
select 'ldb.d_business_service_used_for a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_used_for a126
on (a17.used_for_src_key = a126.row_key)
union
select 'ldb.d_calendar_week a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
join ldb.d_calendar_week a127
on (a18.week_start_date_key = a127.row_key)
union
select 'ldb.d_ci_manufacturer a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_ci_manufacturer a128
on (a14.manufacturer_key = a128.row_key)
union
select 'ldb.d_lov_configuration_item_tier_rating_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key) join ldb.d_configuration_item_mdm a112
on (a14.mdm_key = a112.row_key)
join ldb.d_lov_configuration_item_tier_rating_c a129
on (a112.tier_rating_c_key = a129.row_key)
union
select 'ldb.d_ci_vendor a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_ci_vendor a130
on (a14.vendor_key = a130.row_key)
union
select 'ldb.d_incident_category a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a113
on (a11.incident_key = a113.row_key)
join ldb.d_incident_category a131
on (a113.category_src_key = a131.row_key)
union
select 'ldb.d_incident_configuration_item_mdm a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_configuration_item_mdm a132
on (a11.incident_configuration_item_key = a132.row_key)
union
select 'ldb.d_incident_priority a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a113
on (a11.incident_key = a113.row_key)
join ldb.d_incident_priority a133
on (a113.priority_src_key = a133.row_key)
union
select 'ldb.d_incident_subcategory a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a113
on (a11.incident_key = a113.row_key)
join ldb.d_incident_subcategory a134
on (a113.sub_category_src_key = a134.row_key)
union
select 'ldb.d_outage_type a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a115
on (a11.outage_key = a115.row_key)
join ldb.d_outage_type a135
on (a115.outage_type_src_key = a135.row_key)