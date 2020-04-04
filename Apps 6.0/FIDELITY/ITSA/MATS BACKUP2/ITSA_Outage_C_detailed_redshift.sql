select 'ldb.f_incident_outage a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_application_mdm a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a13
on (a12.mdm_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_change_request_caused_by a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a110
on (a11.caused_by_change_key = a110.row_key)
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a111
on (a11.configuration_item_key = a111.row_key)
union
select 'ldb.d_configuration_item_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a111
on (a11.configuration_item_key = a111.row_key)
join ldb.d_configuration_item_mdm a112
on (a111.mdm_key = a112.row_key)
union
select 'ldb.d_outage a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a113
on (a11.outage_key = a113.row_key)
union
select 'ldb.d_incident a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
union
select 'ldb.d_configuration_item_incident a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item_incident a115
on (a11.incident_configuration_item_key = a115.row_key)
union
select 'ldb.d_incident_contacttype a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_contacttype a116
on (a11.incident_reported_type_src_key = a116.row_key)
union
select 'ldb.d_incident_impact a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_impact a117
on (a11.incident_impact_src_key = a117.row_key)
union
select 'ldb.d_incident_urgency a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_urgency a118
on (a11.incident_urgency_src_key = a118.row_key)
union
select 'ldb.d_outage_parent_outage_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage_parent_outage_c a119
on (a11.outage_parent_outage_c_key = a119.row_key)
union
select 'ldb.d_business_service_criticality a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_criticality a120
on (a16.criticality_key = a120.row_key)
union
select 'ldb.d_business_service_used_for a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_used_for a121
on (a16.used_for_src_key = a121.row_key)
union
select 'ldb.d_calendar_week a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_week a122
on (a17.week_start_date_key = a122.row_key)
union
select 'ldb.d_internal_contact_caused_by_change a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a110
on (a11.caused_by_change_key = a110.row_key)
join ldb.d_internal_contact_caused_by_change a123
on (a110.assigned_to_key = a123.row_key)
union
select 'ldb.d_internal_organization_caused_by_change a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a110
on (a11.caused_by_change_key = a110.row_key)
join ldb.d_internal_organization_caused_by_change a124
on (a110.assignment_group_key = a124.row_key)
union
select 'ldb.d_change_request_caused_by_category a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a110
on (a11.caused_by_change_key = a110.row_key)
join ldb.d_change_request_caused_by_category a125
on (a110.category_src_key = a125.row_key)
union
select 'ldb.d_configuration_item_caused_by_change a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a110
on (a11.caused_by_change_key = a110.row_key)
join ldb.d_configuration_item_caused_by_change a126
on (a110.configuration_item_key = a126.row_key)
union
select 'ldb.d_change_request_caused_by_risk a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a110
on (a11.caused_by_change_key = a110.row_key)
join ldb.d_change_request_caused_by_risk a127
on (a110.risk_src_key = a127.row_key)
union
select 'ldb.d_change_request_caused_by_scope a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a110
on (a11.caused_by_change_key = a110.row_key)
join ldb.d_change_request_caused_by_scope a128
on (a110.scope_src_key = a128.row_key)
union
select 'ldb.d_change_request_caused_by_type a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a110
on (a11.caused_by_change_key = a110.row_key)
join ldb.d_change_request_caused_by_type a129
on (a110.type_src_key = a129.row_key)
union
select 'ldb.d_incident_category a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_category a130
on (a114.category_src_key = a130.row_key)
union
select 'ldb.d_incident_priority a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_priority a131
on (a114.priority_src_key = a131.row_key)
union
select 'ldb.d_incident_subcategory a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_subcategory a132
on (a114.sub_category_src_key = a132.row_key)
union
select 'ldb.d_lov_outage_audience_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a113
on (a11.outage_key = a113.row_key)
join ldb.d_lov_outage_audience_c a133
on (a113.audience_outage_c_key = a133.row_key)
union
select 'ldb.d_outage_type a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a113
on (a11.outage_key = a113.row_key)
join ldb.d_outage_type a134
on (a113.outage_type_src_key = a134.row_key)
union
select 'ldb.d_application_tier a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_tier a135
on (a12.tier_src_key = a135.row_key)
union
select 'ldb.d_application_used_for a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_used_for a136
on (a12.used_for_src_key = a136.row_key)
union
select 'ldb.d_ci_manufacturer a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a111
on (a11.configuration_item_key = a111.row_key)
join ldb.d_ci_manufacturer a137
on (a111.manufacturer_key = a137.row_key)
union
select 'ldb.d_ci_vendor a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a111
on (a11.configuration_item_key = a111.row_key)
join ldb.d_ci_vendor a138
on (a111.vendor_key = a138.row_key)
union
select 'ldb.d_calendar_year a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a139
on (a19.year_start_date_key = a139.row_key)