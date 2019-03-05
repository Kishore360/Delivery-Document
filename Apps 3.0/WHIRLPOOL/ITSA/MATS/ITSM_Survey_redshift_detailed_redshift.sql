select 'ldb.f_incident_response a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
union
select 'ldb.d_internal_contact_affected_user_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_affected_user_c a12 
on (a11.affected_user_c_key = a12.row_key) 
union
select 'ldb.d_affected_user_location_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_affected_user_c a12 
on (a11.affected_user_c_key = a12.row_key) 
join ldb.d_affected_user_location_c a13 
on (a12.country_c_key = a13.row_key) 
union
select 'ldb.d_location_region_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_affected_user_c a12 
on (a11.affected_user_c_key = a12.row_key) 
join ldb.d_location_region_c a14 
on (a12.lkp_region_c_key = a14.row_key) 
union
select 'ldb.d_internal_organization_assignment_group_region_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_assignment_group_region_c a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_internal_contact a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact a16 
on (a11.sent_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_internal_contact_queue_manager_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
join ldb.d_internal_contact_queue_manager_c a18 
on (a17.queue_manager_c_key = a18.row_key) 
union
select 'ldb.dh_queue_manager_hierarchy_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) join ldb.d_internal_contact_queue_manager_c a18 
on (a17.queue_manager_c_key = a18.row_key) 
join ldb.dh_queue_manager_hierarchy_c a19 
on (a18.manager_c_key = a19.lev_0_key) 
union
select 'ldb.d_calendar_date a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a110 
on (a11.requested_on_key = a110.row_key) 
union
select 'ldb.d_survey_instance a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_instance a111 
on (a11.survey_instance_key = a111.row_key) 
union
select 'ldb.d_survey_question a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_question a112 
on (a11.question_key = a112.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_assigned_to a113 
on (a11.assigned_to_key = a113.row_key) 
union
select 'ldb.d_configuration_item a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_configuration_item a114 
on (a11.configuration_item_c_key = a114.row_key) 
union
select 'ldb.d_task_ci_autofill_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_task_ci_autofill_c a115 
on (a11.ci_class_autofill_src_c_key = a115.row_key) 
union
select 'ldb.d_internal_organization_department a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_department a116 
on (a11.taken_by_department_key = a116.row_key) 
union
select 'ldb.d_internal_contact_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact a16 
on (a11.sent_to_key = a16.row_key) 
join ldb.d_internal_contact_mdm a117 
on (a16.row_current_key = a117.row_current_key) 
union
select 'ldb.d_incident a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_incident a118 
on (a11.incident_key = a118.row_key) 
union
select 'ldb.d_service_business_service_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_service_business_service_c a119 
on (a11.business_service_c_key = a119.row_key) 
union
select 'ldb.d_request_item a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_request_item a120 
on (a11.request_item_key = a120.row_key) 
union
select 'ldb.d_survey_sd_categorization_state_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_sd_categorization_state_c a121 
on (a11.sd_categorization_state_src_c_key = a121.row_key) 
union
select 'ldb.d_survey_sd_categorization_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_sd_categorization_c a122 
on (a11.sd_categorization_src_c_key = a122.row_key) 
union
select 'ldb.d_survey a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey a123 
on (a11.survey_key = a123.row_key) 
union
select 'ldb.d_lov_survey_contacttype_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_lov_survey_contacttype_c a124 
on (a11.reported_type_src_key = a124.row_key) 
union
select 'ldb.d_survey_state a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_state a125 
on (a11.survey_state_src_key = a125.row_key) 
union
select 'ldb.d_location a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_location a126 
on (a11.location_key = a126.row_key) 
union
select 'ldb.d_task a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_task a127 
on (a11.task_c_key = a127.row_key) 
union
select 'ldb.d_location_task_region_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_location_task_region_c a128 
on (a11.location_c_key = a128.row_key) 
union
select 'ldb.d_internal_organization_assingment_group_vendor_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
join ldb.d_internal_organization_assingment_group_vendor_c a129 
on (a17.vendor_c_key = a129.row_key) 
union
select 'ldb.d_question_type a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_question a112 
on (a11.question_key = a112.row_key) 
join ldb.d_question_type a130 
on (a112.question_type_src_key = a130.row_key) 
union
select 'ldb.d_calendar_week a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a110 
on (a11.requested_on_key = a110.row_key) 
join ldb.d_calendar_week a131 
on (a110.week_start_date_key = a131.row_key) 
union
select 'ldb.dh_queue_manager_level1_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) join ldb.d_internal_contact_queue_manager_c a18 
on (a17.queue_manager_c_key = a18.row_key) join ldb.dh_queue_manager_hierarchy_c a19 
on (a18.manager_c_key = a19.lev_0_key) 
join ldb.dh_queue_manager_level1_c a132 
on (a19.lev_1_key = a132.row_key) 
union
select 'ldb.dh_queue_manager_level2_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) join ldb.d_internal_contact_queue_manager_c a18 
on (a17.queue_manager_c_key = a18.row_key) join ldb.dh_queue_manager_hierarchy_c a19 
on (a18.manager_c_key = a19.lev_0_key) 
join ldb.dh_queue_manager_level2_c a133 
on (a19.lev_2_key = a133.row_key) 
union
select 'ldb.dh_queue_manager_level3_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) join ldb.d_internal_contact_queue_manager_c a18 
on (a17.queue_manager_c_key = a18.row_key) join ldb.dh_queue_manager_hierarchy_c a19 
on (a18.manager_c_key = a19.lev_0_key) 
join ldb.dh_queue_manager_level3_c a134 
on (a19.lev_3_key = a134.row_key) 
union
select 'ldb.dh_queue_manager_level4_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) join ldb.d_internal_contact_queue_manager_c a18 
on (a17.queue_manager_c_key = a18.row_key) join ldb.dh_queue_manager_hierarchy_c a19 
on (a18.manager_c_key = a19.lev_0_key) 
join ldb.dh_queue_manager_level4_c a135 
on (a19.lev_4_key = a135.row_key) 
union
select 'ldb.dh_queue_manager_level5_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) join ldb.d_internal_contact_queue_manager_c a18 
on (a17.queue_manager_c_key = a18.row_key) join ldb.dh_queue_manager_hierarchy_c a19 
on (a18.manager_c_key = a19.lev_0_key) 
join ldb.dh_queue_manager_level5_c a136 
on (a19.lev_5_key = a136.row_key) 
union
select 'ldb.dh_queue_manager_level6_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) join ldb.d_internal_contact_queue_manager_c a18 
on (a17.queue_manager_c_key = a18.row_key) join ldb.dh_queue_manager_hierarchy_c a19 
on (a18.manager_c_key = a19.lev_0_key) 
join ldb.dh_queue_manager_level6_c a137 
on (a19.lev_6_key = a137.row_key) 
union
select 'ldb.d_calendar_month a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a110 
on (a11.requested_on_key = a110.row_key) 
join ldb.d_calendar_month a138 
on (a110.month_start_date_key = a138.row_key) 
union
select 'ldb.d_internal_contact_manager_queue_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) join ldb.d_internal_contact_queue_manager_c a18 
on (a17.queue_manager_c_key = a18.row_key) 
join ldb.d_internal_contact_manager_queue_c a139 
on (a18.manager_c_key = a139.row_key) 
union
select 'ldb.d_calendar_quarter a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a110 
on (a11.requested_on_key = a110.row_key) 
join ldb.d_calendar_quarter a140 
on (a110.quarter_start_date_key = a140.row_key) 
union
select 'ldb.d_calendar_year a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a110 
on (a11.requested_on_key = a110.row_key) 
join ldb.d_calendar_year a141 
on (a110.year_start_date_key = a141.row_key) 

