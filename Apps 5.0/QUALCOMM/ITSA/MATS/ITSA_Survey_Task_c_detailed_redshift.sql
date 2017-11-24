



select 'ldb.f_task_response_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_internal_contact a12 
on (a11.sent_to_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_calendar_date a15 
on (a11.requested_on_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assessment_closed_by_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_internal_contact_assessment_closed_by_c a16 
on (a11.closed_by_key = a16.row_key) 
union
select 'ldb.d_internal_contact_mdm a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_internal_contact a12 
on (a11.sent_to_key = a12.row_key) 
join ldb.d_internal_contact_mdm a17 
on (a12.row_current_key = a17.row_current_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_calendar_date a15 
on (a11.requested_on_key = a15.row_key) 
join ldb.d_calendar_month a18 
on (a15.month_start_date_key = a18.row_key) 
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_calendar_date a15 
on (a11.requested_on_key = a15.row_key) 
join ldb.d_calendar_quarter a19 
on (a15.quarter_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_week a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_calendar_date a15 
on (a11.requested_on_key = a15.row_key) 
join ldb.d_calendar_week a110 
on (a15.week_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_calendar_date a15 
on (a11.requested_on_key = a15.row_key) 
join ldb.d_calendar_year a111 
on (a15.year_start_date_key = a111.row_key) 
union
select 'ldb.d_internal_contact_assessment_opened_by_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_internal_contact_assessment_opened_by_c a112 
on (a11.opened_by_key = a112.row_key) 
union
select 'ldb.d_survey_instance a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_survey_instance a113 
on (a11.survey_instance_key = a113.row_key) 
union
select 'ldb.d_survey_question a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_survey_question a114 
on (a11.question_key = a114.row_key) 
union
select 'ldb.d_task_response_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_task_response_c a115 
on (a11.task_unique_key = a115.task_unique_key) 
union
select 'ldb.d_survey a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_survey a116 
on (a11.survey_key = a116.row_key) 
union
select 'ldb.d_configuration_item a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
left outer join ldb.d_configuration_item a117 
on (a11.configuration_item_key = a117.row_key) 
union
select 'ldb.d_internal_organization_department a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
left outer join ldb.d_internal_organization_department a118 
on (a11.taken_by_department_key = a118.row_key) 
union
select 'ldb.d_location a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
left outer join ldb.d_location a119 
on (a11.location_key = a119.row_key) 
union
select 'ldb.d_survey_state a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
left outer join ldb.d_survey_state a120 
on (a11.survey_state_src_key = a120.row_key) 
union
select 'ldb.o_data_freshness a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_calendar_date a15 
on (a11.requested_on_key = a15.row_key) 
left outer join ldb.o_data_freshness a121 
on (a15.source_id = a121.source_id) 
union
select 'ldb.d_question_type a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_c a11 
join ldb.d_survey_question a114 
on (a11.question_key = a114.row_key) 
left outer join ldb.d_question_type a122 
on (a114.question_type_src_key = a122.row_key) 
