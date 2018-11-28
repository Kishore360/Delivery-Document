select 'ldb.f_incident_response a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact a12 on (a11.sent_to_key = a12.row_key) 
union
select 'ldb.d_survey_state a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_state a12 on (a11.state_src_key = a12.row_key) 
union
select 'ldb.d_survey_instance a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_instance a12 on (a11.survey_instance_key = a12.row_key) 
union
select 'ldb.d_survey_question a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_question a12 on (a11.question_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_assigned_to a12 on (a11.assigned_to_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a12 on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_incident a12 on (a11.incident_key = a12.row_key) 
union
select 'ldb.d_survey a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey a12 on (a11.survey_key = a12.row_key) 
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_configuration_item a12 on (a11.configuration_item_key = a12.row_key) 
union
select 'ldb.d_internal_organization_department a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_department a12 on (a11.taken_by_department_key = a12.row_key) 
union
select 'ldb.d_internal_contact_mdm a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_contact a12 on (a11.sent_to_key = a12.row_key) 
join ldb.d_internal_contact_mdm a13 on (a12.row_current_key = a13.row_current_key) 
union
select 'ldb.d_location a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_location a12 on (a11.location_key = a12.row_key) 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a12 on (a11.requested_on_key = a12.row_key) 
union
select 'ldb.d_calendar_week a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a12 on (a11.requested_on_key = a12.row_key)  
join ldb.d_calendar_week a13 on (a12.week_start_date_key = a13.row_key) 
union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a12 on (a11.requested_on_key = a12.row_key)  
join ldb.d_calendar_month a13 on (a12.month_start_date_key = a13.row_key) 
union
select 'ldb.d_calendar_quarter a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a12 on (a11.requested_on_key = a12.row_key) 
join ldb.d_calendar_month a13 on (a12.month_start_date_key = a13.row_key) 
join ldb.d_calendar_quarter a14 on (a13.quarter_start_date_key = a14.row_key) 
union
select 'ldb.d_calendar_year a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a12 on (a11.requested_on_key = a12.row_key) 
join ldb.d_calendar_month a13 on (a12.month_start_date_key = a13.row_key) 
join ldb.d_calendar_quarter a14 on (a13.quarter_start_date_key = a14.row_key)   
join ldb.d_calendar_year a15 on (a14.year_start_date_key = a15.row_key) 
union
select 'ldb.d_incident_opened_by a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_incident a12 on (a11.incident_key = a12.row_key) 
join ldb.d_incident_opened_by a13 on (a12.opened_by_key = a13.row_key) 
union
select 'ldb.d_incident_priority a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_incident a12 on (a11.incident_key = a12.row_key) 
join ldb.d_incident_priority a13 on (a12.priority_src_key = a13.row_key) 
union
select 'ldb.d_question_type a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_question a12  on (a11.question_key = a12.row_key)  
join ldb.d_question_type a13 on (a12.question_type_src_key = a13.row_key)