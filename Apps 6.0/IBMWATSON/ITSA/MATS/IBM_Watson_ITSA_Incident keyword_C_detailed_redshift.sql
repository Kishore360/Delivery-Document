select 'ldb.f_incident_keyword a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
union
select 'ldb.d_customer a12 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_customer a12
on (a11.customer_key = a12.row_key)
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_contact a13
on (a11.opened_by_key = a13.row_key)
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_time a14
on (a11.opened_time_key = a14.row_key)
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_contact_assigned_to a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a17
on (a11.opened_on_key = a17.row_key)
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_configuration_item a18
on (a11.configuration_item_key = a18.row_key)
union
select 'ldb.d_internal_contact_mdm a19 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_contact a13
on (a11.opened_by_key = a13.row_key)
join ldb.d_internal_contact_mdm a19
on (a13.row_current_key = a19.row_current_key)
union
select 'ldb.d_incident a110 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a110
on (a11.table_row_key = a110.row_key)
union
select 'ldb.d_parent_incident a111 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a110
on (a11.table_row_key = a110.row_key)
join ldb.d_parent_incident a111
on (a110.parent_incident_key = a111.row_key)
union
select 'ldb.d_tribe_c a112 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_tribe_c a112
on (a11.tribe_c_key = a112.row_key)
union
select 'ldb.d_segment_c a113 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_tribe_c a112
on (a11.tribe_c_key = a112.row_key)
join ldb.d_segment_c a113
on (a112.segment_c_key = a113.row_key)
union
select 'ldb.d_internal_organization_legalentity a114 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_organization_legalentity a114
on (a11.company_key = a114.row_key)
union
select 'ldb.d_customer_mdm a115 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_customer a12
on (a11.customer_key = a12.row_key)
join ldb.d_customer_mdm a115
on (a12.row_current_key = a115.row_current_key)
union
select 'ldb.d_domain a116 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_domain a116
on (a11.domain_key = a116.row_key)
union
select 'ldb.d_calendar_time_hour a117 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_time a14
on (a11.opened_time_key = a14.row_key)
join ldb.d_calendar_time_hour a117
on (a14.hour_24_format_num = a117.hour_24_format_num)
union
select 'ldb.d_incident_contacttype a118 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_contacttype a118
on (a11.reported_type_src_key = a118.row_key)
union
select 'ldb.d_incident_impact a119 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_impact a119
on (a11.impact_src_key = a119.row_key)
union
select 'ldb.d_incident_urgency a120 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_urgency a120
on (a11.urgency_src_key = a120.row_key)
union
select 'ldb.d_location a121 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_location a121
on (a11.location_key = a121.row_key)
union
select 'ldb.d_calendar_month a122 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a17
on (a11.opened_on_key = a17.row_key)
join ldb.d_calendar_month a122
on (a17.month_start_date_key = a122.row_key)
union
select 'ldb.d_calendar_week a123 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a17
on (a11.opened_on_key = a17.row_key)
join ldb.d_calendar_week a123
on (a17.week_start_date_key = a123.row_key)
union
select 'ldb.d_employee_location a124 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_internal_contact a13
on (a11.opened_by_key = a13.row_key) join ldb.d_internal_contact_mdm a19
on (a13.row_current_key = a19.row_current_key)
join ldb.d_employee_location a124
on (a19.location_key = a124.row_key)
union
select 'ldb.d_incident_category a125 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_category a125
on (a11.category_src_key = a125.row_key)
union
select 'ldb.d_incident_close_code a126 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_close_code a126
on (a11.close_code_src_key = a126.row_key)
union
select 'ldb.d_incident_priority a127 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_priority a127
on (a11.priority_src_key = a127.row_key)
union
select 'ldb.d_incident_severity a128 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_severity a128
on (a11.severity_src_key = a128.row_key)
union
select 'ldb.d_incident_state a129 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_state a129
on (a11.state_src_key = a129.row_key)
union
select 'ldb.d_incident_subcategory a130 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident_subcategory a130
on (a11.sub_category_src_key = a130.row_key)
union
select 'ldb.d_lov_segment_type_c a131 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_tribe_c a112
on (a11.tribe_c_key = a112.row_key)
 join ldb.d_segment_c a113
on (a112.segment_c_key = a113.row_key)
join ldb.d_lov_segment_type_c a131
on (a113.segment_type_c_key = a131.row_key)
union
select 'ldb.d_calendar_quarter a132 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a17
on (a11.opened_on_key = a17.row_key)
join ldb.d_calendar_quarter a132
on (a17.quarter_start_date_key = a132.row_key)
union
select 'ldb.d_calendar_year a133 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a17
on (a11.opened_on_key = a17.row_key)
join ldb.d_calendar_year a133
on (a17.year_start_date_key = a133.row_key)
