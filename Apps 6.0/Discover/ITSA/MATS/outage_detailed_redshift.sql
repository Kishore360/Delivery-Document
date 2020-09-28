select 'ldb.f_incident_outage a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_internal_contact_assigned_to a12
on (a11.problem_assigned_to_c_key = a12.row_key)
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_internal_organization_group a13
on (a11.problem_assignment_group_c_key = a13.row_key)
union
select 'ldb.d_business_service a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
union
select 'ldb.d_business_service_support_group_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
join ldb.d_business_service_support_group_c a15
on (a14.support_group_c = a15.row_key)
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key)
union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key)
join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
union
select 'ldb.d_change_request_caused_by a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a19
on (a11.caused_by_change_key = a19.row_key)
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
union
select 'ldb.d_configuration_item_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
join ldb.d_configuration_item_mdm a111
on (a110.mdm_key = a111.row_key)
union
select 'ldb.d_problem a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a112
on (a11.problem_key = a112.row_key)
union
select 'ldb.d_incident_alert_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a112
on (a11.problem_key = a112.row_key)
join ldb.d_incident_alert_c a113
on (a112.incident_alert_c_key = a113.row_key)
union
select 'ldb.d_calendar_week a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_week a114
on (a16.week_start_date_key = a114.row_key)
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
join ldb.d_calendar_year a115
on (a18.year_start_date_key = a115.row_key)
union
select 'ldb.d_outage a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a116
on (a11.outage_key = a116.row_key)
union
select 'ldb.d_problem_responsible_group_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a112
on (a11.problem_key = a112.row_key)
join ldb.d_problem_responsible_group_c a117
on (a112.problem_responsible_group_c_key = a117.row_key)
union
select 'ldb.d_outage_business_unit_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage_business_unit_c a118
on (a11.outage_business_unit_c_key = a118.row_key)
union
select 'ldb.d_problem_priority a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem_priority a119
on (a11.priority_src_key = a119.row_key)
union
select 'ldb.d_problem_enterprise_incident_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem_enterprise_incident_c a120
on (a11.problem_enterprise_incident_c_key = a120.row_key)
union
select 'ldb.d_business_service_business_channel_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
join ldb.d_business_service_business_channel_c a121
on (a14.service_business_channel_src_c = a121.row_key)
union
select 'ldb.d_business_service_criticality a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
join ldb.d_business_service_criticality a122
on (a14.criticality_key = a122.row_key)
union
select 'ldb.d_business_service_used_for a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
join ldb.d_business_service_used_for a123
on (a14.used_for_src_key = a123.row_key)
union
select 'ldb.d_internal_contact_caused_by_change a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a19
on (a11.caused_by_change_key = a19.row_key)
join ldb.d_internal_contact_caused_by_change a124
on (a19.assigned_to_key = a124.row_key)
union
select 'ldb.d_internal_organization_caused_by_change a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a19
on (a11.caused_by_change_key = a19.row_key)
join ldb.d_internal_organization_caused_by_change a125
on (a19.assignment_group_key = a125.row_key)
union
select 'ldb.d_change_request_caused_by_category a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a19
on (a11.caused_by_change_key = a19.row_key)
join ldb.d_change_request_caused_by_category a126
on (a19.category_src_key = a126.row_key)
union
select 'ldb.d_configuration_item_caused_by_change a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a19
on (a11.caused_by_change_key = a19.row_key)
join ldb.d_configuration_item_caused_by_change a127
on (a19.configuration_item_key = a127.row_key)
union
select 'ldb.d_change_request_caused_by_risk a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a19
on (a11.caused_by_change_key = a19.row_key)
join ldb.d_change_request_caused_by_risk a128
on (a19.risk_src_key = a128.row_key)
union
select 'ldb.d_change_request_caused_by_scope a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a19
on (a11.caused_by_change_key = a19.row_key)
join ldb.d_change_request_caused_by_scope a129
on (a19.scope_src_key = a129.row_key)
union
select 'ldb.d_change_request_caused_by_type a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_change_request_caused_by a19
on (a11.caused_by_change_key = a19.row_key)
join ldb.d_change_request_caused_by_type a130
on (a19.type_src_key = a130.row_key)
union
select 'ldb.d_outage_category_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a116
on (a11.outage_key = a116.row_key)
join ldb.d_outage_category_c a131
on (a116.outage_category_src_c_key = a131.row_key)
union
select 'ldb.d_outage_transaction_type_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a116
on (a11.outage_key = a116.row_key)
join ldb.d_outage_transaction_type_c a132
on (a116.outage_transaction_type_src_c_key = a132.row_key)
union
select 'ldb.d_outage_type a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a116
on (a11.outage_key = a116.row_key)
join ldb.d_outage_type a133
on (a116.outage_type_src_key = a133.row_key)
union
select 'ldb.d_lov_problem_avoidability_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a112
on (a11.problem_key = a112.row_key)
join ldb.d_lov_problem_avoidability_c a134
on (a112.u_avoidability_c_key = a134.row_key)
union
select 'ldb.d_lov_problem_avoidability_category_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a112
on (a11.problem_key = a112.row_key)
join ldb.d_lov_problem_avoidability_category_c a135
on (a112.u_avoidability_category_c_key = a135.row_key)
union
select 'ldb.d_problem_state a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a112
on (a11.problem_key = a112.row_key)
join ldb.d_problem_state a136
on (a112.state_src_key = a136.row_key)
union
select 'ldb.d_problem_vendor_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a112
on (a11.problem_key = a112.row_key)
join ldb.d_problem_vendor_c a137
on (a112.problem_vendor_c_key = a137.row_key)
union
select 'ldb.d_ci_manufacturer a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
join ldb.d_ci_manufacturer a138
on (a110.manufacturer_key = a138.row_key)
union
select 'ldb.d_ci_vendor a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
join ldb.d_ci_vendor a139
on (a110.vendor_key = a139.row_key)
union
select 'ldb.d_internal_contact_problem_director_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a112
on (a11.problem_key = a112.row_key) join ldb.d_problem_responsible_group_c a117
on (a112.problem_responsible_group_c_key = a117.row_key)
join ldb.d_internal_contact_problem_director_c a140
on (a117.problem_director_c_key = a140.row_key)
union
select 'ldb.d_internal_contact_problem_svp_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a112
on (a11.problem_key = a112.row_key) join ldb.d_problem_responsible_group_c a117
on (a112.problem_responsible_group_c_key = a117.row_key)
join ldb.d_internal_contact_problem_svp_c a141
on (a117.problem_svp_c_key = a141.row_key)
union
select 'ldb.d_internal_contact_problem_vp_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_problem a112
on (a11.problem_key = a112.row_key) join ldb.d_problem_responsible_group_c a117
on (a112.problem_responsible_group_c_key = a117.row_key)
join ldb.d_internal_contact_problem_vp_c a142
on (a117.problem_vp_c_key = a142.row_key)