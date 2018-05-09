SELECT 'f_incident_response' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_incident_response a11 
UNION 
SELECT 'd_survey_state' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_incident_response a11 
JOIN ldb.d_survey_state a12 ON a11.survey_state_src_key=a12.row_key
UNION
select 'ldb.d_survey_question a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_question a16  on (a11.question_key = a16.row_key)
UNION
select 'ldb.d_survey_instance a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_instance a13  on (a11.survey_instance_key = a13.row_key) 
UNION 
select 'ldb.d_survey a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey a115  on (a11.survey_key = a115.row_key) 
UNION 
select 'ldb.d_question_type a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_question a16  on (a11.question_key = a16.row_key) 
join ldb.d_question_type a117  on (a16.question_type_src_key = a117.row_key)
UNION
select 'ldb.d_location a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_location a112 on (a11.location_key = a112.row_key) 
UNION
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a18  on (a11.assignment_group_key = a18.row_key)
UNION
select 'ldb.d_internal_organization_department a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_department a110  on (a11.taken_by_department_key = a110.row_key)
UNION
select 'ldb.d_internal_contact_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact a14 on (a11.sent_to_key = a14.row_key) 
join ldb.d_internal_contact_mdm a111 on (a14.row_current_key = a111.row_current_key) 
UNION
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_assigned_to a17  on (a11.assigned_to_key = a17.row_key)
UNION
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact a14 on (a11.sent_to_key = a14.row_key) 
UNION
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_incident a15 on (a11.incident_key = a15.row_key) 
UNION
select 'ldb.d_calendar_month a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a12  on (a11.requested_on_key = a12.row_key) 
join ldb.d_calendar_month a113 on (a12.month_start_date_key = a113.row_key)
UNION
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a12 on (a11.requested_on_key = a12.row_key)
UNION 
SELECT 'd_configuration_item_survey_causing_ci_c' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_incident_response a11
JOIN ldb.d_configuration_item_survey_causing_ci_c a12 ON a11.causing_ci_c_key=a12.row_key