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
select 'ldb.d_segment_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_segment_c a16
on (a11.segment_c_key = a16.row_key)
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_contact_assigned_to a17
on (a11.assigned_to_key = a17.row_key)
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_organization_group a18
on (a11.assignment_group_key = a18.row_key)
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
union
select 'ldb.d_calendar_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
union
select 'ldb.d_configuration_item_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a112
on (a12.mdm_key = a112.row_key)
union
select 'ldb.d_internal_contact_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_contact_mdm a113
on (a14.employee_mdm_key = a113.row_key)
union
select 'ldb.d_incident a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a114
on (a11.table_row_key = a114.row_key)
union
select 'ldb.d_parent_incident a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a114
on (a11.table_row_key = a114.row_key)
join ldb.d_parent_incident a115
on (a114.parent_incident_key = a115.row_key)
union
select 'ldb.d_internal_organization_legalentity a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_organization_legalentity a116
on (a11.company_key = a116.row_key)
union
select 'ldb.d_customer_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_customer a13
on (a11.customer_key = a13.row_key)
join ldb.d_customer_mdm a117
on (a13.customer_mdm_key = a117.row_key)
union
select 'ldb.d_domain a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_domain a118
on (a11.domain_key = a118.row_key)
union
select 'ldb.d_calendar_time_hour a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_time a15
on (a11.time_key = a15.row_key)
join ldb.d_calendar_time_hour a119
on (a15.hour_key = a119.row_key)
union
select 'ldb.d_incident_contacttype a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_contacttype a120
on (a11.incident_reported_type_src_key = a120.row_key)
union
select 'ldb.d_incident_impact a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_impact a121
on (a11.incident_impact_src_key = a121.row_key)
union
select 'ldb.d_incident_keyword_tribe_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_keyword_tribe_c a122
on (a11.tribe_c_key = a122.row_key)
union
select 'ldb.d_incident_urgency a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_urgency a123
on (a11.incident_urgency_src_key = a123.row_key)
union
select 'ldb.d_location a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_location a124
on (a11.location_key = a124.row_key)
union
select 'ldb.d_lov_segment_type_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_segment_c a16
on (a11.segment_c_key = a16.row_key)
join ldb.d_lov_segment_type_c a125
on (a16.segment_type_c_key = a125.row_key)
union
select 'ldb.d_calendar_week a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
join ldb.d_calendar_week a126
on (a19.week_start_date_key = a126.row_key)
union
select 'ldb.d_ci_managed_by a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_managed_by a127
on (a12.managed_by_key = a127.row_key)
union
select 'ldb.d_ci_supported_by a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_supported_by a128
on (a12.supported_by_key = a128.row_key)
union
select 'ldb.d_employee_location a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key) join ldb.d_internal_contact_mdm a113
on (a14.employee_mdm_key = a113.row_key)
join ldb.d_employee_location a129
on (a113.location_key = a129.row_key)
union
select 'ldb.d_incident_category a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_category a130
on (a11.incident_category_src_key = a130.row_key)
union
select 'ldb.d_incident_close_code a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_close_code a131
on (a11.close_code_src_key = a131.row_key)
union
select 'ldb.d_incident_priority a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_priority a132
on (a11.incident_priority_src_key = a132.row_key)
union
select 'ldb.d_incident_severity a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_severity a133
on (a11.incident_severity_src_key = a133.row_key)
union
select 'ldb.d_incident_state a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_state a134
on (a11.incident_state_src_key = a134.row_key)
union
select 'ldb.d_incident_subcategory a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_subcategory a135
on (a11.incident_sub_category_src_key = a135.row_key)
union
select 'ldb.d_calendar_year a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key) join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
join ldb.d_calendar_year a136
on (a111.year_start_date_key = a136.row_key)
