select 'ldb.f_incident_response a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact a12 
on (a11.sent_to_key = a12.row_key) 
union
select 'ldb.d_calendar_date_fiscal a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.requested_on_key = a13.row_key) 
union
select 'ldb.d_internal_organization_department_incident_task_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_department_incident_task_c a14 
on (a11.incident_task_department_key = a14.row_key) 
union
select 'ldb.d_internal_contact_caller_incident_task_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_caller_incident_task_c a15 
on (a11.incident_task_opened_by_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.dh_user_group_classification_hierarchy a17 
on (a11.assignment_group_key = a17.user_group_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level1 a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.dh_user_group_classification_hierarchy a17 
on (a11.assignment_group_key = a17.user_group_key) 
join ldb.dh_user_group_classification_hierarchy_level1 a18 
on (a17.user_group_classification_level1 = a18.user_group_level1_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a19 
on (a11.requested_on_key = a19.row_key) 
union
select 'ldb.d_internal_contact_resolved_by_key_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_resolved_by_key_c a110 
on (a11.last_resolved_by_key = a110.row_key) 
union
select 'ldb.d_survey_question a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_question a111 
on (a11.question_key = a111.row_key) 
union
select 'ldb.d_internal_organization_group a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a112 
on (a11.assignment_group_key = a112.row_key) 
union
select 'ldb.d_configuration_item a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_configuration_item a113 
on (a11.incident_task_business_service_key = a113.row_key) 
union
select 'ldb.d_internal_organization_department a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_department a114 
on (a11.taken_by_department_key = a114.row_key) 
union
select 'ldb.d_internal_contact_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact a12 
on (a11.sent_to_key = a12.row_key) 
join ldb.d_internal_contact_mdm a115 
on (a12.row_current_key = a115.row_current_key) 
union
select 'ldb.d_calendar_fiscal_period a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.requested_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_period a116 
on (a13.period_start_date_key = a116.row_key) 
union
select 'ldb.d_incident a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_incident a117 
on (a11.incident_key = a117.row_key) 
union
select 'ldb.d_incident_contacttype a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_incident_contacttype a118 
on (a11.reported_type_src_key = a118.row_key) 
union
select 'ldb.d_incident_task_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_incident_task_c a119 
on (a11.incident_task_key = a119.row_key) 
union
select 'ldb.d_internal_contact_assigned_to_incident_task_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_assigned_to_incident_task_c a120 
on (a11.incident_task_assigned_to_key = a120.row_key) 
union
select 'ldb.d_internal_organization_group_incident_task_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group_incident_task_c a121 
on (a11.incident_task_assignment_group_key = a121.row_key) 
union
select 'ldb.d_internal_contact_mdm_incident_task_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_mdm_incident_task_c a122 
on (a11.incident_task_opened_by_key = a122.row_key) 
union
select 'ldb.d_location a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_location a123 
on (a11.location_key = a123.row_key) 
union
select 'ldb.d_internal_organization_resolver_group_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_resolver_group_c a124 
on (a11.resolved_by_group_key = a124.row_key) 
union
select 'ldb.d_survey a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey a125 
on (a11.survey_key = a125.row_key) 
union
select 'ldb.d_survey_instance a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_instance a126 
on (a11.survey_instance_key = a126.row_key) 
union
select 'ldb.d_survey_state a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_state a127 
on (a11.survey_state_src_key = a127.row_key) 
union
select 'ldb.d_internal_contact_manager_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
join ldb.d_internal_contact_manager_c a128 
on (a16.manager_key = a128.row_key) 
union
select 'ldb.d_calendar_month a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a19 
on (a11.requested_on_key = a19.row_key) 
join ldb.d_calendar_month a129 
on (a19.month_start_date_key = a129.row_key) 
union
select 'ldb.d_calendar_week a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a19 
on (a11.requested_on_key = a19.row_key) 
join ldb.d_calendar_week a130 
on (a19.week_start_date_key = a130.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.requested_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_quarter a131 
on (a13.quarter_start_date_key = a131.row_key) 
union
select 'ldb.d_internal_contact_manager_c_key_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_resolved_by_key_c a110 
on (a11.last_resolved_by_key = a110.row_key) 
join ldb.d_internal_contact_manager_c_key_c a132 
on (a110.manager_c_key = a132.row_key) 
union
select 'ldb.d_question_type a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_question a111 
on (a11.question_key = a111.row_key) 
join ldb.d_question_type a133 
on (a111.question_type_src_key = a133.row_key) 
union
select 'ldb.d_calendar_quarter a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a19 
on (a11.requested_on_key = a19.row_key) 
join ldb.d_calendar_quarter a134 
on (a19.quarter_start_date_key = a134.row_key) 
union
select 'ldb.d_calendar_fiscal_year a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.requested_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_year a135 
on (a13.year_start_date_key = a135.row_key) 
union
select 'ldb.d_calendar_year a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a19 
on (a11.requested_on_key = a19.row_key) 
join ldb.d_calendar_year a136 
on (a19.year_start_date_key = a136.row_key) 