select 'ldb.f_incident_outage a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month a14
on (a13.month_start_date_key = a14.row_key)
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14
on (a13.month_start_date_key = a14.row_key)
join ldb.d_calendar_quarter a15
on (a14.quarter_start_date_key = a15.row_key)
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a16
on (a11.configuration_item_key = a16.row_key)
union
select 'ldb.d_internal_contact_director_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a16
on (a11.configuration_item_key = a16.row_key)
join ldb.d_internal_contact_director_c a17
on (a16.support_director_c_key = a17.row_key)
union
select 'ldb.d_internal_contact_manager_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a16
on (a11.configuration_item_key = a16.row_key)
join ldb.d_internal_contact_manager_c a18
on (a16.managed_by_c_key = a18.row_key)
union
select 'ldb.d_internal_contact_vp_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a16
on (a11.configuration_item_key = a16.row_key)
join ldb.d_internal_contact_vp_c a19
on (a16.vp_c_key = a19.row_key)
union
select 'ldb.d_application_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a110
on (a12.mdm_key = a110.row_key)
union
select 'ldb.d_internal_contact_assigned_to a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_internal_contact_assigned_to a111
on (a11.assigned_to_key = a111.row_key)
union
select 'ldb.d_internal_organization_group a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_internal_organization_group a112
on (a11.assignment_group_key = a112.row_key)
union
select 'ldb.d_change_request_caused_by a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a113
on (a11.caused_by_change_key = a113.row_key)
union
select 'ldb.d_incident a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
union
select 'ldb.d_calendar_date_critical_day_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date_critical_day_c a115
on (a11.start_on_key = a115.row_key)
union
select 'ldb.d_outage a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a116
on (a11.outage_key = a116.row_key)
union
select 'ldb.d_problem a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a117
on (a11.problem_key = a117.row_key)
union
select 'ldb.d_calendar_year a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14
on (a13.month_start_date_key = a14.row_key) join ldb.d_calendar_quarter a15
on (a14.quarter_start_date_key = a15.row_key)
join ldb.d_calendar_year a118
on (a15.year_start_date_key = a118.row_key)
union
select 'ldb.d_configuration_item_incident a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item_incident a119
on (a11.incident_configuration_item_key = a119.row_key)
union
select 'ldb.d_incident_contacttype a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_contacttype a120
on (a11.incident_reported_type_src_key = a120.row_key)
union
select 'ldb.d_incident_impact a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_impact a121
on (a11.incident_impact_src_key = a121.row_key)
union
select 'ldb.d_incident_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident_urgency a122
on (a11.incident_urgency_src_key = a122.row_key)
union
select 'ldb.d_internal_organization_pit_lead_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_internal_organization_pit_lead_c a123
on (a11.assignment_group_for_pit_lead_c_key = a123.row_key)
union
select 'ldb.d_application_tier a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_tier a124
on (a12.tier_src_key = a124.row_key)
union
select 'ldb.d_application_used_for a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_used_for a125
on (a12.used_for_src_key = a125.row_key)
union
select 'ldb.d_internal_contact_caused_by_change a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a113
on (a11.caused_by_change_key = a113.row_key)
join ldb.d_internal_contact_caused_by_change a126
on (a113.assigned_to_key = a126.row_key)
union
select 'ldb.d_internal_organization_caused_by_change a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a113
on (a11.caused_by_change_key = a113.row_key)
join ldb.d_internal_organization_caused_by_change a127
on (a113.assignment_group_key = a127.row_key)
union
select 'ldb.d_change_request_caused_by_category a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a113
on (a11.caused_by_change_key = a113.row_key)
join ldb.d_change_request_caused_by_category a128
on (a113.category_src_key = a128.row_key)
union
select 'ldb.d_configuration_item_caused_by_change a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a113
on (a11.caused_by_change_key = a113.row_key)
join ldb.d_configuration_item_caused_by_change a129
on (a113.configuration_item_key = a129.row_key)
union
select 'ldb.d_change_request_caused_by_risk a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a113
on (a11.caused_by_change_key = a113.row_key)
join ldb.d_change_request_caused_by_risk a130
on (a113.risk_src_key = a130.row_key)
union
select 'ldb.d_change_request_caused_by_scope a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a113
on (a11.caused_by_change_key = a113.row_key)
join ldb.d_change_request_caused_by_scope a131
on (a113.scope_src_key = a131.row_key)
union
select 'ldb.d_change_request_caused_by_type a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a113
on (a11.caused_by_change_key = a113.row_key)
join ldb.d_change_request_caused_by_type a132
on (a113.type_src_key = a132.row_key)
union
select 'ldb.d_ci_manufacturer a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a16
on (a11.configuration_item_key = a16.row_key)
join ldb.d_ci_manufacturer a133
on (a16.manufacturer_key = a133.row_key)
union
select 'ldb.d_ci_vendor a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a16
on (a11.configuration_item_key = a16.row_key)
join ldb.d_ci_vendor a134
on (a16.vendor_key = a134.row_key)
union
select 'ldb.d_incident_category a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_category a135
on (a114.category_src_key = a135.row_key)
union
select 'ldb.d_incident_priority a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_priority a136
on (a114.priority_src_key = a136.row_key)
union
select 'ldb.d_incident_state a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_state a137
on (a114.state_src_key = a137.row_key)
union
select 'ldb.d_lov_incident_sub_status_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_lov_incident_sub_status_c a138
on (a114.sub_status_src_c_key = a138.row_key)
union
select 'ldb.d_incident_subcategory a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_subcategory a139
on (a114.sub_category_src_key = a139.row_key)
union
select 'ldb.d_outage_type a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a116
on (a11.outage_key = a116.row_key)
join ldb.d_outage_type a140
on (a116.outage_type_src_key = a140.row_key)
