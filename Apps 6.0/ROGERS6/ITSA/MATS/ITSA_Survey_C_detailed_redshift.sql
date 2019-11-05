select 'ldb.f_incident_response a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key)
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_contact_assigned_to a13
on (a11.assigned_to_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
join ldb.d_calendar_month a16
on (a15.month_start_date_key = a16.row_key)
union
select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key) join ldb.d_calendar_month a16
on (a15.month_start_date_key = a16.row_key)
join ldb.d_calendar_quarter a17
on (a16.quarter_start_date_key = a17.row_key)
union
select 'ldb.d_incident a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_incident a18
on (a11.incident_key = a18.row_key)
union
select 'ldb.d_internal_organization_affected_assignment_group_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_organization_affected_assignment_group_c a19
on (a11.survey_affected_assignment_group_c_key = a19.row_key)
union
select 'ldb.d_incident_response_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_incident_response_c a110
on (a11.incident_response_c_key = a110.row_key)
union
select 'ldb.d_survey_wizard_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_wizard_c a111
on (a11.survey_wizard_c_key = a111.row_key)
union
select 'ldb.d_survey_instance a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_instance a112
on (a11.survey_instance_key = a112.row_key)
union
select 'ldb.d_survey_question a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_question a113
on (a11.question_key = a113.row_key)
union
select 'ldb.d_survey a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey a114
on (a11.survey_key = a114.row_key)
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_configuration_item a115
on (a11.configuration_item_key = a115.row_key)
union
select 'ldb.d_internal_organization_department a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_organization_department a116
on (a11.taken_by_department_key = a116.row_key)
union
select 'ldb.d_internal_contact_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm a117
on (a12.employee_mdm_key = a117.row_key)
union
select 'ldb.d_location a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_location a118
on (a11.location_key = a118.row_key)
union
select 'ldb.d_survey_state a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_state a119
on (a11.state_src_key = a119.row_key)
union
select 'ldb.d_calendar_week a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
join ldb.d_calendar_week a120
on (a15.week_start_date_key = a120.row_key)
union
select 'ldb.d_incident_opened_by a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_incident a18
on (a11.incident_key = a18.row_key)
join ldb.d_incident_opened_by a121
on (a18.opened_by_key = a121.row_key)
union
select 'ldb.d_incident_priority a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_incident a18
on (a11.incident_key = a18.row_key)
join ldb.d_incident_priority a122
on (a18.priority_src_key = a122.row_key)
union
select 'ldb.d_internal_contact_affected_assignment_manager_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_organization_affected_assignment_group_c a19
on (a11.survey_affected_assignment_group_c_key = a19.row_key)
join ldb.d_internal_contact_affected_assignment_manager_c a123
on (a19.manager_key = a123.row_key)
union
select 'ldb.d_question_type a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_question a113
on (a11.question_key = a113.row_key)
join ldb.d_question_type a124
on (a113.question_type_src_key = a124.row_key)
union
select 'ldb.d_calendar_year a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key) join ldb.d_calendar_month a16
on (a15.month_start_date_key = a16.row_key) join ldb.d_calendar_quarter a17
on (a16.quarter_start_date_key = a17.row_key)
join ldb.d_calendar_year a125
on (a17.year_start_date_key = a125.row_key)
