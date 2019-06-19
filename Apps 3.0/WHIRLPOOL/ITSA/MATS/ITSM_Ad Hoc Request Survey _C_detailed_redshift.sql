select 'ldb.f_ad_hoc_request_response_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
union
select 'ldb.d_ad_hoc_request_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_ad_hoc_request_c a12 
on (a11.ad_hoc_request_c_key = a12.row_key)
union
select 'ldb.d_internal_contact_affected_user_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_internal_contact_affected_user_c a12 
on (a11.requested_for_key = a12.row_key)
union
select 'ldb.d_affected_user_location_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_internal_contact_affected_user_c a12 
on (a11.requested_for_key = a12.row_key)
join ldb.d_affected_user_location_c a13
on (a12.country_c_key = a13.row_key)
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_calendar_date a12 
on (a11.requested_on_key = a12.row_key)
union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_calendar_date a12 
on (a11.requested_on_key = a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_quarter a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_calendar_date a12 
on (a11.requested_on_key = a12.row_key)
join ldb.d_calendar_quarter a13
on (a12.month_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_year a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_calendar_date a12 
on (a11.requested_on_key = a12.row_key)
join ldb.d_calendar_year a13
on (a12.year_start_date_key = a13.row_key)
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_c_key = a12.row_key)
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_internal_contact a12 
on (a11.sent_to_key = a12.row_key)
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_internal_contact_assigned_to a12 
on (a11.assigned_to_key = a12.row_key)
union
select 'ldb.d_internal_contact_mdm a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11
join ldb.d_internal_contact a12 
on (a11.sent_to_key = a12.row_key)
join ldb.d_internal_contact_mdm a13 
on (a12.row_current_key = a13.row_current_key)
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key)
union
select 'ldb.d_internal_organization_assingment_group_vendor_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key)
join ldb.d_internal_organization_assingment_group_vendor_c a13 
on (a12.vendor_c_key = a13.row_key)
union
select 'ldb.d_internal_organization_department a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_internal_organization_department a12 
on (a11.taken_by_department_key = a12.row_key)
union
select 'ldb.d_location_region_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11
join ldb.d_internal_contact_affected_user_c a12 
on (a11.requested_for_key = a12.row_key)
join ldb.d_location_region_c a13
on (a12.lkp_region_c_key = a13.row_key)
union
select 'ldb.d_survey_question a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_survey_question a12 
on (a11.question_key = a12.row_key)
union
select 'ldb.d_survey_instance a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_survey_instance a12 
on (a11.survey_instance_key = a12.row_key)
union
select 'ldb.d_question_type a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_survey_question a12 
on (a11.question_key = a12.row_key)
join ldb.d_question_type a13 
on (a12.question_type_src_key = a13.row_key)
union
select 'ldb.d_service_business_service_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_service_business_service_c a12 
on (a11.business_service_c_key = a12.row_key)
union
select 'ldb.d_survey a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_survey a12 
on (a11.survey_key = a12.row_key)
union
select 'ldb.d_survey_sd_categorization_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_survey a12 
on (a11.sd_categorization_src_c_key = a12.row_key)
union
select 'ldb.d_survey_sd_categorization_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_survey a12 
on (a11.sd_categorization_src_c_key = a12.row_key)
union
select 'ldb.d_survey_sd_categorization_state_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_survey_sd_categorization_state_c a12 
on (a11.sd_categorization_state_src_c_key = a12.row_key)
union
select 'ldb.d_survey_state a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ad_hoc_request_response_c a11 
join ldb.d_survey_state a12 
on (a11.survey_state_src_key = a12.row_key)