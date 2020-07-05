select 'ldb.f_incident_keyword a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_customer a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_customer a13
on (a11.customer_key = a13.row_key)
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_time a15
on (a11.time_key = a15.row_key)
union
select 'ldb.d_incident_time a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_time a16
on (a11.incident_time_key = a16.row_key)
union
select 'ldb.d_incident_employee a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_employee a17
on (a11.incident_employee_key = a17.row_key)
union
select 'ldb.d_segment_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_segment_c a18
on (a11.segment_c_key = a18.row_key)
union
select 'ldb.d_internal_contact_assigned_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_contact_assigned_to a19
on (a11.assigned_to_key = a19.row_key)
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_organization_group a110
on (a11.assignment_group_key = a110.row_key)
union
select 'ldb.d_calendar_date a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a111
on (a11.date_key = a111.row_key)
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a111
on (a11.date_key = a111.row_key)
join ldb.d_calendar_month a112
on (a111.month_start_date_key = a112.row_key)
union
select 'ldb.d_calendar_quarter a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a111
on (a11.date_key = a111.row_key) join ldb.d_calendar_month a112
on (a111.month_start_date_key = a112.row_key)
join ldb.d_calendar_quarter a113
on (a112.quarter_start_date_key = a113.row_key)
union
select 'ldb.d_configuration_item_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a114
on (a12.mdm_key = a114.row_key)
union
select 'ldb.d_internal_contact_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_contact_mdm a115
on (a14.employee_mdm_key = a115.row_key)
union
select 'ldb.d_incident a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key)
union
select 'ldb.d_incident_assigned_to a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key)
join ldb.d_incident_assigned_to a117
on (a116.assigned_to_key = a117.row_key)
union
select 'ldb.d_incident_assignment_group a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key)
join ldb.d_incident_assignment_group a118
on (a116.assignment_group_key = a118.row_key)
union
select 'ldb.d_incident_date a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_date a119
on (a11.incident_date_key = a119.row_key)
union
select 'ldb.d_incident_calendar_month a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_date a119
on (a11.incident_date_key = a119.row_key)
join ldb.d_incident_calendar_month a120
on (a119.month_start_date_key = a120.row_key)
union
select 'ldb.d_incident_calendar_quarter a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_date a119
on (a11.incident_date_key = a119.row_key) join ldb.d_incident_calendar_month a120
on (a119.month_start_date_key = a120.row_key)
join ldb.d_incident_calendar_quarter a121
on (a120.quarter_start_date_key = a121.row_key)
union
select 'ldb.d_configuration_item_incident a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key)
join ldb.d_configuration_item_incident a122
on (a116.configuration_item_key = a122.row_key)
union
select 'ldb.d_incident_configuration_item_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key) join ldb.d_configuration_item_incident a122
on (a116.configuration_item_key = a122.row_key)
join ldb.d_incident_configuration_item_mdm a123
on (a122.mdm_key = a123.row_key)
union
select 'ldb.d_incident_customer a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key)
join ldb.d_incident_customer a124
on (a116.customer_key = a124.row_key)
union
select 'ldb.d_incident_employee_mdm a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_employee a17
on (a11.incident_employee_key = a17.row_key)
join ldb.d_incident_employee_mdm a125
on (a17.employee_mdm_key = a125.row_key)
union
select 'ldb.d_parent_incident a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key)
join ldb.d_parent_incident a126
on (a116.parent_incident_key = a126.row_key)
union
select 'ldb.d_internal_organization_legalentity a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_organization_legalentity a127
on (a11.company_key = a127.row_key)
union
select 'ldb.d_customer_mdm a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_customer a13
on (a11.customer_key = a13.row_key)
join ldb.d_customer_mdm a128
on (a13.customer_mdm_key = a128.row_key)
union
select 'ldb.d_domain a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_domain a129
on (a11.domain_key = a129.row_key)
union
select 'ldb.d_calendar_time_hour a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_time a15
on (a11.time_key = a15.row_key)
join ldb.d_calendar_time_hour a130
on (a15.hour_key = a130.row_key)
union
select 'ldb.d_incident_calendar_hour a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_time a16
on (a11.incident_time_key = a16.row_key)
join ldb.d_incident_calendar_hour a131
on (a16.hour_key = a131.row_key)
union
select 'ldb.d_incident_contacttype a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_contacttype a132
on (a11.incident_reported_type_src_key = a132.row_key)
union
select 'ldb.d_incident_impact a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_impact a133
on (a11.incident_impact_src_key = a133.row_key)
union
select 'ldb.d_incident_urgency a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_urgency a134
on (a11.incident_urgency_src_key = a134.row_key)
union
select 'ldb.d_location a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_location a135
on (a11.location_key = a135.row_key)
union
select 'ldb.d_lov_segment_type_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_segment_c a18
on (a11.segment_c_key = a18.row_key)
join ldb.d_lov_segment_type_c a136
on (a18.segment_type_c_key = a136.row_key)
union
select 'ldb.d_calendar_week a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a111
on (a11.date_key = a111.row_key)
join ldb.d_calendar_week a137
on (a111.week_start_date_key = a137.row_key)
union
select 'ldb.d_ci_managed_by a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_managed_by a138
on (a12.managed_by_key = a138.row_key)
union
select 'ldb.d_ci_supported_by a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_supported_by a139
on (a12.supported_by_key = a139.row_key)
union
select 'ldb.d_employee_location a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key) join ldb.d_internal_contact_mdm a115
on (a14.employee_mdm_key = a115.row_key)
join ldb.d_employee_location a140
on (a115.location_key = a140.row_key)
union
select 'ldb.d_incident_calendar_week a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_date a119
on (a11.incident_date_key = a119.row_key)
join ldb.d_incident_calendar_week a141
on (a119.week_start_date_key = a141.row_key)
union
select 'ldb.d_incident_category a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_category a142
on (a11.incident_category_src_key = a142.row_key)
union
select 'ldb.d_incident_close_code a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_close_code a143
on (a11.close_code_src_key = a143.row_key)
union
select 'ldb.d_incident_company a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key)
join ldb.d_incident_company a144
on (a116.company_key = a144.row_key)
union
select 'ldb.d_incident_customer_mdm a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key) join ldb.d_incident_customer a124
on (a116.customer_key = a124.row_key)
join ldb.d_incident_customer_mdm a145
on (a124.customer_mdm_key = a145.row_key)
union
select 'ldb.d_incident_domain a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key)
join ldb.d_incident_domain a146
on (a116.domain_key = a146.row_key)
union
select 'ldb.d_incident_employee_location a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_employee a17
on (a11.incident_employee_key = a17.row_key) join ldb.d_incident_employee_mdm a125
on (a17.employee_mdm_key = a125.row_key)
join ldb.d_incident_employee_location a147
on (a125.location_key = a147.row_key)
union
select 'ldb.d_incident_location a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key)
join ldb.d_incident_location a148
on (a116.location_key = a148.row_key)
union
select 'ldb.d_incident_priority a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key)
join ldb.d_incident_priority a149
on (a116.priority_src_key = a149.row_key)
union
select 'ldb.d_incident_severity a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_severity a150
on (a11.incident_severity_src_key = a150.row_key)
union
select 'ldb.d_incident_state a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_state a151
on (a11.incident_state_src_key = a151.row_key)
union
select 'ldb.d_incident_subcategory a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_subcategory a152
on (a11.incident_sub_category_src_key = a152.row_key)
union
select 'ldb.d_incident_ci_managed_by a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key) join ldb.d_configuration_item_incident a122
on (a116.configuration_item_key = a122.row_key) join ldb.d_incident_configuration_item_mdm a123
on (a122.mdm_key = a123.row_key)
join ldb.d_incident_ci_managed_by a153
on (a123.managed_by_key = a153.row_key)
union
select 'ldb.d_incident_ci_supported_by a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key) join ldb.d_configuration_item_incident a122
on (a116.configuration_item_key = a122.row_key) join ldb.d_incident_configuration_item_mdm a123
on (a122.mdm_key = a123.row_key)
join ldb.d_incident_ci_supported_by a154
on (a123.supported_by_key = a154.row_key)
union
select 'ldb.d_incident_keyword_tribe_c a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key) join ldb.d_configuration_item_incident a122
on (a116.configuration_item_key = a122.row_key) join ldb.d_incident_configuration_item_mdm a123
on (a122.mdm_key = a123.row_key)
join ldb.d_incident_keyword_tribe_c a155
on (a123.tribe_configuration_item_c_key = a155.row_key)
union
select 'ldb.d_incident_tribe_c a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a116
on (a11.table_row_key = a116.row_key) join ldb.d_configuration_item_incident a122
on (a116.configuration_item_key = a122.row_key) join ldb.d_incident_configuration_item_mdm a123
on (a122.mdm_key = a123.row_key)
join ldb.d_incident_tribe_c a156
on (a123.incident_tribe_c_key = a156.row_key)
union
select 'ldb.d_calendar_year a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a111
on (a11.date_key = a111.row_key) join ldb.d_calendar_month a112
on (a111.month_start_date_key = a112.row_key) join ldb.d_calendar_quarter a113
on (a112.quarter_start_date_key = a113.row_key)
join ldb.d_calendar_year a157
on (a113.year_start_date_key = a157.row_key)
union
select 'ldb.d_incident_calendar_year a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_date a119
on (a11.incident_date_key = a119.row_key) join ldb.d_incident_calendar_month a120
on (a119.month_start_date_key = a120.row_key) join ldb.d_incident_calendar_quarter a121
on (a120.quarter_start_date_key = a121.row_key)
join ldb.d_incident_calendar_year a158
on (a121.year_start_date_key = a158.row_key)
