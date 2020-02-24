select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a15
on (a11.time_key = a15.row_key)
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a16
on (a11.assigned_to_key = a16.row_key)
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key)
union
select 'ldb.d_business_service a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a18
on (a11.business_service_key = a18.row_key)
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
union
select 'ldb.d_calendar_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
union
select 'ldb.d_configuration_item_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a112
on (a13.mdm_key = a112.row_key)
union
select 'ldb.d_problem a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
union
select 'ldb.d_problem_responsible_group_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_responsible_group_c a114
on (a11.problem_responsible_group_c_key = a114.row_key)
union
select 'ldb.d_application_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a115
on (a12.mdm_key = a115.row_key)
union
select 'ldb.d_change_request a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_change_request a116
on (a11.change_request_key = a116.row_key)
union
select 'ldb.d_internal_organization_department a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_organization_department a117
on (a14.department_key = a117.row_key)
union
select 'ldb.d_internal_contact_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_contact_mdm a118
on (a14.employee_mdm_key = a118.row_key)
union
select 'ldb.d_calendar_time_hour a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a15
on (a11.time_key = a15.row_key)
join ldb.d_calendar_time_hour a119
on (a15.hour_key = a119.row_key)
union
select 'ldb.d_location a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_location a120
on (a11.location_key = a120.row_key)
union
select 'ldb.d_problem_reported_type a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_reported_type a121
on (a11.reported_type_src_key = a121.row_key)
union
select 'ldb.d_problem_priority a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_priority a122
on (a11.priority_src_key = a122.row_key)
union
select 'ldb.d_problem_root_cause_responsibility_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_root_cause_responsibility_c a123
on (a11.problem_root_cause_responsibility_c_key = a123.row_key)
union
select 'ldb.d_problem_enterprise_incident_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_enterprise_incident_c a124
on (a11.problem_enterprise_incident_c_key = a124.row_key)
union
select 'ldb.d_problem_urgency a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_urgency a125
on (a11.urgency_src_key = a125.row_key)
union
select 'ldb.d_location_assigned_to a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a16
on (a11.assigned_to_key = a16.row_key)
join ldb.d_location_assigned_to a126
on (a16.location_key = a126.row_key)
union
select 'ldb.d_business_service_criticality a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a18
on (a11.business_service_key = a18.row_key)
join ldb.d_business_service_criticality a127
on (a18.criticality_key = a127.row_key)
union
select 'ldb.d_business_service_used_for a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a18
on (a11.business_service_key = a18.row_key)
join ldb.d_business_service_used_for a128
on (a18.used_for_src_key = a128.row_key)
union
select 'ldb.d_calendar_week a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
join ldb.d_calendar_week a129
on (a19.week_start_date_key = a129.row_key)
union
select 'ldb.d_ci_support_group a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_ci_support_group a130
on (a13.support_group_key = a130.row_key)
union
select 'ldb.d_lov_employee_type_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a16
on (a11.assigned_to_key = a16.row_key)
join ldb.d_lov_employee_type_c a131
on (a16.employee_type_c_key = a131.row_key)
union
select 'ldb.d_lov_problem_avoidability_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_lov_problem_avoidability_c a132
on (a113.u_avoidability_c_key = a132.row_key)
union
select 'ldb.d_lov_problem_avoidability_category_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_lov_problem_avoidability_category_c a133
on (a113.u_avoidability_category_c_key = a133.row_key)
union
select 'ldb.d_lov_problem_caused_by_change_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_lov_problem_caused_by_change_c a134
on (a113.u_problem_caused_by_change_c_key = a134.row_key)
union
select 'ldb.d_lov_problem_detection_method_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_lov_problem_detection_method_c a135
on (a113.u_detection_method_c_key = a135.row_key)
union
select 'ldb.d_internal_contact_problem_director_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_responsible_group_c a114
on (a11.problem_responsible_group_c_key = a114.row_key)
join ldb.d_internal_contact_problem_director_c a136
on (a114.problem_director_c_key = a136.row_key)
union
select 'ldb.d_lov_problem_failed_component_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_lov_problem_failed_component_c a137
on (a113.u_failed_component_c_key = a137.row_key)
union
select 'ldb.d_lov_problem_sdlc_prevention_activity_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_lov_problem_sdlc_prevention_activity_c a138
on (a113.u_sdlc_prevention_activity_c_key = a138.row_key)
union
select 'ldb.d_internal_contact_problem_svp_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_responsible_group_c a114
on (a11.problem_responsible_group_c_key = a114.row_key)
join ldb.d_internal_contact_problem_svp_c a139
on (a114.problem_svp_c_key = a139.row_key)
union
select 'ldb.d_problem_state a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_problem_state a140
on (a113.state_src_key = a140.row_key)
union
select 'ldb.d_internal_contact_problem_vp_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_responsible_group_c a114
on (a11.problem_responsible_group_c_key = a114.row_key)
join ldb.d_internal_contact_problem_vp_c a141
on (a114.problem_vp_c_key = a141.row_key)
union
select 'ldb.d_calendar_year a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key) join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
join ldb.d_calendar_year a142
on (a111.year_start_date_key = a142.row_key)