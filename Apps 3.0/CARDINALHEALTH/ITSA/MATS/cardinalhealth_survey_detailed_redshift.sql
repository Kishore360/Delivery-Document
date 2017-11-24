select 'ldb.f_incident_response a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_internal_contact_emp_seniors_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
join ldb.d_internal_contact_emp_seniors_c a18 
on (a17.manager_c_key = a18.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c_relation a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_assignment_group_level0_manager_c_relation a19 
on (a11.assignment_group_key = a19.level0_assigment_group_key) 
union
select 'ldb.d_calendar_greg_fiscal_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_greg_fiscal_c a110 
on (a11.requested_on_key = a110.greogrian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_greg_fiscal_c a110 
on (a11.requested_on_key = a110.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal a111 
on (a110.fiscal_key = a111.row_key) 
union
select 'ldb.d_calendar_date a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a112 
on (a11.requested_on_key = a112.row_key) 
union
select 'ldb.d_incident a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
union
select 'ldb.d_incident_survey_overall_experience_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_incident_survey_overall_experience_c a114 
on (a11.survey_instance_key = a114.survey_instance_key) 
union
select 'ldb.d_incident_survey_recognition_feedback_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_incident_survey_recognition_feedback_c a115 
on (a11.survey_instance_key = a115.survey_instance_key) 
union
select 'ldb.d_internal_contact a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact a116 
on (a11.sent_to_key = a116.row_current_key) 
union
select 'ldb.d_survey_question a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_question a117 
on (a11.question_key = a117.row_key) 
union
select 'ldb.d_survey_instance a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_instance a118 
on (a11.survey_instance_key = a118.row_key) 
union
select 'ldb.d_lov_calculation_type_response_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_lov_calculation_type_response_c a119 
on (a11.calculation_type_c_key = a119.row_key) 
union
select 'ldb.d_calendar_date_completed_on_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date_completed_on_c a120 
on (a11.completed_on_key = a120.row_key) 
union
select 'ldb.d_configuration_item a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_configuration_item a121 
on (a11.configuration_item_key = a121.row_key) 
union
select 'ldb.d_internal_organization_department a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_department a122 
on (a11.opened_by_department_key = a122.row_key) 
union
select 'ldb.d_internal_contact_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact a116 
on (a11.sent_to_key = a116.row_current_key) 
join ldb.d_internal_contact_mdm a123 
on (a116.row_current_key = a123.row_current_key) 
union
select 'ldb.d_location a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_location a124 
on (a11.location_key = a124.row_key) 
union
select 'ldb.d_internal_contact_location_site_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_location_site_c a125 
on (a11.opened_on_behalf_of_c_key = a125.row_key) 
union
select 'ldb.d_survey a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey a126 
on (a11.survey_key = a126.row_key) 
union
select 'ldb.d_survey_state a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_state a127 
on (a11.survey_state_src_key = a127.row_key) 
union
select 'ldb.d_task_contacttype a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_task_contacttype a128 
on (a11.reported_type_src_key = a128.row_key) 
union
select 'ldb.d_internal_organization_legalentity_company_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
join ldb.d_internal_organization_legalentity_company_c a129 
on (a16.user_company_c1_key = a129.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_assignment_group_level0_manager_c_relation a19 
on (a11.assignment_group_key = a19.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c a130 
on (a19.level0_manager_c_key = a130.level0_manager_c_key) 
union
select 'ldb.d_calendar_fiscal_year a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_greg_fiscal_c a110 
on (a11.requested_on_key = a110.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a111 
on (a110.fiscal_key = a111.row_key) 
join ldb.d_calendar_fiscal_year a131 
on (a111.year_start_date_key = a131.row_key) 
union
select 'ldb.d_internal_contact_emp_seniors_assigned_to_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
join ldb.d_internal_contact_emp_seniors_assigned_to_c a132 
on (a16.manager_c_key = a132.row_key) 
union
select 'ldb.d_question_type a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_question a117 
on (a11.question_key = a117.row_key) 
join ldb.d_question_type a133 
on (a117.question_type_src_key = a133.row_key) 