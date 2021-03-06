select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key)
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key)
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key)
join ldb.d_calendar_month a15
on (a14.month_start_date_key = a15.row_key)
union
select 'ldb.d_calendar_quarter a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a15
on (a14.month_start_date_key = a15.row_key)
join ldb.d_calendar_quarter a16
on (a15.quarter_start_date_key = a16.row_key)
union
select 'ldb.d_change_request_caused_by a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request_caused_by a17
on (a11.caused_by_change_key = a17.row_key)
union
select 'ldb.d_change_request a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a19
on (a11.configuration_item_key = a19.row_key)
union
select 'ldb.d_calendar_time a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a110
on (a11.time_key = a110.row_key)
union
select 'ldb.d_internal_contact_opened_by_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_internal_contact_opened_by_c a111
on (a12.opened_by_key = a111.row_key)
union
select 'ldb.d_incident_requester_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_requester_c a112
on (a12.row_key = a112.row_key)
union
select 'ldb.d_internal_organization_last_resolved_by_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_last_resolved_by_c a113
on (a11.resolved_by_group_key = a113.row_key)
union
select 'ldb.d_calendar_week a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key)
join ldb.d_calendar_week a114
on (a14.week_start_date_key = a114.row_key)
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a15
on (a14.month_start_date_key = a15.row_key) join ldb.d_calendar_quarter a16
on (a15.quarter_start_date_key = a16.row_key)
join ldb.d_calendar_year a115
on (a16.year_start_date_key = a115.row_key)
union
select 'ldb.d_problem a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a116
on (a11.problem_key = a116.row_key)
union
select 'ldb.d_internal_contact_caller_id_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_internal_contact_caller_id_c a117
on (a12.opened_by_c_key = a117.row_key)
union
select 'ldb.d_lov_age_sddc_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_lov_age_sddc_c a118
on (a11.age_sdds_c_key = a118.row_key)
union
select 'ldb.d_internal_contact_assigned_to a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_assigned_to a119
on (a11.assigned_to_key = a119.row_key)
union
select 'ldb.d_lov_fact_source_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_lov_fact_source_c a120
on (a11.fact_source_c_key = a120.row_key)
union
select 'ldb.d_incident_contacttype a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_contacttype a121
on (a11.reported_type_src_key = a121.row_key)
union
select 'ldb.d_location a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_location a122
on (a11.location_key = a122.row_key)
union
select 'ldb.d_kb_knowledge_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_kb_knowledge_c a123
on (a11.incident_kb_knowledge_c_key = a123.row_key)
union
select 'ldb.d_lov_incident_incident_type_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_lov_incident_incident_type_c a124
on (a12.incident_type_src_c_key = a124.row_key)
union
select 'ldb.d_calendar_time_hour a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a110
on (a11.time_key = a110.row_key)
join ldb.d_calendar_time_hour a125
on (a110.hour_key = a125.row_key)
union
select 'ldb.d_incident_category a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_category a126
on (a12.category_src_key = a126.row_key)
union
select 'ldb.d_incident_close_code a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_close_code a127
on (a12.close_code_src_key = a127.row_key)
union
select 'ldb.d_incident_opened_by a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_opened_by a128
on (a12.opened_by_key = a128.row_key)
union
select 'ldb.d_incident_priority a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_priority a129
on (a12.priority_src_key = a129.row_key)
union
select 'ldb.d_lov_incident_reopen_reason_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_lov_incident_reopen_reason_c a130
on (a12.incident_reopen_reason_c_key = a130.row_key)
union
select 'ldb.d_incident_resolved_by a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_resolved_by a131
on (a12.resolved_by_key = a131.row_key)
union
select 'ldb.d_incident_state a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_state a132
on (a12.state_src_key = a132.row_key)
union
select 'ldb.d_lov_incident_sub_status_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_lov_incident_sub_status_c a133
on (a12.sub_status_src_c_key = a133.row_key)
union
select 'ldb.d_incident_subcategory a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_subcategory a134
on (a12.sub_category_src_key = a134.row_key)
union
select 'ldb.d_parent_incident a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_parent_incident a135
on (a12.parent_incident_key = a135.row_key)
union
select 'ldb.d_internal_organization_caller_id_department_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key) join ldb.d_internal_contact_caller_id_c a117
on (a12.opened_by_c_key = a117.row_key)
join ldb.d_internal_organization_caller_id_department_c a136
on (a117.department_key = a136.row_key)
union
select 'ldb.d_internal_contact_opened_by_manager_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key) join ldb.d_internal_contact_opened_by_c a111
on (a12.opened_by_key = a111.row_key)
join ldb.d_internal_contact_opened_by_manager_c a137
on (a111.manager_key = a137.row_key)
union
select 'ldb.d_lov_requester_type_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key) join ldb.d_internal_contact_opened_by_c a111
on (a12.opened_by_key = a111.row_key)
join ldb.d_lov_requester_type_c a138
on (a111.internal_contact_requester_type_c_key = a138.row_key)
