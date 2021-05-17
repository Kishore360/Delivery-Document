select 'ldb.f_incident_response a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_contact a12
on (a11.sent_to_key = a12.row_key)
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a13
on (a11.requested_on_key = a13.row_key)
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a13
on (a11.requested_on_key = a13.row_key)
join ldb.d_calendar_month a14
on (a13.month_start_date_key = a14.row_key)
union
select 'ldb.d_survey_state a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_state a14
on (a11.survey_state_src_key = a14.row_key)
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_contact_assigned_to a18
on (assigned_to_key = a18.row_key)
union
select 'ldb.d_internal_organization_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_organization_group a19
on (assignment_group_key = a19.row_key)
union
select 'ldb.d_incident a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_incident a111
on (incident_key = a111.row_key)
union
select 'ldb.d_survey_instance a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_instance a112
on (survey_instance_key = a112.row_key)
union
select 'ldb.d_survey_question a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_question a113
on (question_key = a113.row_key)
union
select 'ldb.d_survey a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey a114
on (survey_key = a114.row_key)
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_configuration_item a115
on (configuration_item_key = a115.row_key)
union
select 'ldb.d_internal_organization_department a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_organization_department a116
on (opened_by_department_key = a116.row_key)
union
select 'ldb.d_internal_contact_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_contact a12
on (a11.sent_to_key = a12.row_key)
join ldb.d_internal_contact_mdm a117
on (a12.row_current_key = a117.row_current_key)
union
select 'ldb.d_location a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_location a118
on (a11.location_key = a118.row_key)
union
select 'ldb.d_calendar_week a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a13
on (a11.requested_on_key = a13.row_key)
join ldb.d_calendar_week a120
on (a13.week_start_date_key = a120.row_key)
union
select 'ldb.d_incident_opened_by a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_incident a111
on (incident_key = a111.row_key)
join ldb.d_incident_opened_by a121
on (a111.opened_by_key = a121.row_key)
union
select 'ldb.d_incident_priority a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_incident a111
on (incident_key = a111.row_key)
join ldb.d_incident_priority a122
on (a111.priority_src_key = a122.row_key)
union
select 'ldb.d_question_type a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_question a113
on (question_key = a113.row_key)
join ldb.d_question_type a123
on (a113.question_type_src_key = a123.row_key)
union
select 'ldb.d_calendar_quarter a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a13
on (a11.requested_on_key = a13.row_key)
join ldb.d_calendar_quarter a125
on (a13.quarter_start_date_key = a125.row_key)
union
select 'ldb.d_calendar_year a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a13
on (a11.requested_on_key = a13.row_key)
join ldb.d_calendar_year a126
on (a13.year_start_date_key = a126.row_key)