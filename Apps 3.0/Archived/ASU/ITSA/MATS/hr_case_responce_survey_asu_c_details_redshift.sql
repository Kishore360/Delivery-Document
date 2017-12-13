select 'f_hr_case_response_c' as Table_Name, count(a11.row_key) Row_Count				
from         ldb.f_hr_case_response_c                a11
UNION
select 'd_task_survey_completed_on_c' as Table_Name, count(a11.row_key) Row_Count				
from  ldb.f_hr_case_response_c a11
join ldb.d_task_survey_completed_on_c a12
on (a11.completed_on_key = a12.row_key)
UNION
select 'd_survey_question' as Table_Name, count(a11.row_key) Row_Count				
from  ldb.f_hr_case_response_c a11
join ldb.d_survey_question a12
on (a11.question_key = a12.row_key)
UNION 
select 'd_survey_instance' as Table_Name, count(a11.row_key) Row_Count				
from  ldb.f_hr_case_response_c a11
join ldb.d_survey_instance a12
on (a11.survey_instance_key = a12.row_key)
UNION 
select 'd_survey' as Table_Name, count(a11.row_key) Row_Count				
from  ldb.f_hr_case_response_c a11
join ldb.d_survey a12
on (a11.survey_key = a12.row_key)
UNION 
select 'd_location' as Table_Name, count(a11.row_key) Row_Count				
from  ldb.f_hr_case_response_c a11
join ldb.d_location a12
on (a11.location_key = a12.row_key)
UNION 
select 'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count				
from  ldb.f_hr_case_response_c a11
join ldb.d_internal_organization_group a12
on (a11.assignment_group_key = a12.row_key)
UNION 
select 'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count				
from  ldb.f_hr_case_response_c a11
join ldb.d_internal_organization_department a12
on (a11.taken_by_department_key = a12.row_key)
UNION 
select 'd_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count				
from  ldb.f_hr_case_response_c a11
join ldb.d_internal_contact_assigned_to a12
on (a11.assigned_to_key = a12.row_key)
UNION 
select 'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count				
from  ldb.f_hr_case_response_c a11
join ldb.d_internal_contact a12
on (a11.assigned_to_key = a12.row_key)
UNION 
select 'd_hr_case_c' as Table_Name, count(a11.row_key) Row_Count				
from  ldb.f_hr_case_response_c a11
join ldb.d_hr_case_c a12
on (a11.hr_case_c_key = a12.row_key)
UNION 
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count				
from ldb.f_hr_case_response_c a11
join ldb.d_calendar_date a16
on (a11.closed_on_key = a16.row_key)		  
join ldb.d_calendar_month a128
on (a16.month_start_date_key = a128.row_key)
