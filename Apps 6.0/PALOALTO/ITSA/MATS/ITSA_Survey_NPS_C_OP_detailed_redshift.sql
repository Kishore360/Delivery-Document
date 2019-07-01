select 'ldb.f_incident_response_nps_q2_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
union
select 'ldb.d_calendar_date_fiscal a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
join ldb.d_calendar_month a15 
on (a14.month_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_quarter a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a15 
on (a14.month_start_date_key = a15.row_key) 
join ldb.d_calendar_quarter a16 
on (a15.quarter_start_date_key = a16.row_key) 
union
select 'ldb.d_internal_contact_mdm a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
join ldb.d_internal_contact_mdm a17 
on (a12.employee_mdm_key = a17.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
join ldb.d_calendar_fiscal_quarter a18 
on (a13.quarter_start_date_key = a18.row_key) 
union
select 'ldb.d_calendar_fiscal_year a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
join ldb.d_calendar_fiscal_year a19 
on (a13.year_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_week a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
join ldb.d_calendar_week a110 
on (a14.week_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a15 
on (a14.month_start_date_key = a15.row_key) join ldb.d_calendar_quarter a16 
on (a15.quarter_start_date_key = a16.row_key) 
join ldb.d_calendar_year a111 
on (a16.year_start_date_key = a111.row_key) 
union
select 'ldb.d_survey_instance a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_survey_instance a112 
on (a11.survey_instance_key = a112.row_key) 
union
select 'ldb.d_survey_question a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_survey_question a113 
on (a11.question_key = a113.row_key) 
union
select 'ldb.d_task a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_task a114 
on (a11.task_c_key = a114.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_internal_contact_assigned_to a115 
on (a11.assigned_to_key = a115.row_key) 
union
select 'ldb.d_internal_organization_group a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_internal_organization_group a116 
on (a11.assignment_group_key = a116.row_key) 
union
select 'ldb.d_internal_organization_department a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_internal_organization_department a117 
on (a11.taken_by_department_key = a117.row_key) 
union
select 'ldb.d_location a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_location a118 
on (a11.location_key = a118.row_key) 
union
select 'ldb.d_survey a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_survey a119 
on (a11.survey_key = a119.row_key) 
union
select 'ldb.d_survey_state a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_survey_state a120 
on (a11.survey_state_src_key = a120.row_key) 
union
select 'ldb.d_question_type a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_survey_question a113 
on (a11.question_key = a113.row_key) 
join ldb.d_question_type a121 
on (a113.question_type_src_key = a121.row_key) 
union
select 'ldb.d_task_type a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response_nps_q2_c a11 
join ldb.d_task a114 
on (a11.task_c_key = a114.row_key) 
join ldb.d_task_type a122 
on (a114.task_type_src_key = a122.row_key) 
