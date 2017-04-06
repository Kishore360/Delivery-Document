select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_business_service_csi_ref_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service_csi_ref_c a12 
on (a11.csi_service_ref_c_key = a12.row_key)
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key)
union
select 'ldb.d_calendar_date_fiscal a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.opened_on_key = a12.row_key)
union
select 'ldb.d_calendar_date_fiscal a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_fiscal_period a13 
on (a12.period_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_fiscal_quarter a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_fiscal_quarter a13 
on (a12.quarter_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_fiscal_year a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_fiscal_year a13 
on (a12.year_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month a13 
on (a12.month_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_quarter a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_quarter a13 
on (a12.quarter_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_time a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a12 
on (a11.opened_time_key = a12.row_key)
union
select 'ldb.d_calendar_time_hour a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a12 
on (a11.opened_time_key = a12.row_key)
join ldb.d_calendar_time_hour a13 
on (a12.hour_24_format_num = a13.hour_24_format_num)
union
select 'ldb.d_calendar_week a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_week a13 
on (a12.week_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_year a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_year a13 
on (a12.year_start_date_key = a13.row_key)
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_customer a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key)
union
select 'ldb.d_customer_mdm a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key)
join ldb.d_customer_mdm a13 
on (a12.row_current_key = a13.row_current_key)
union
select 'ldb.d_domain a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a12 
on (a11.domain_key = a12.row_key)
union
select 'ldb.d_enrollment_period_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_enrollment_period_c a12 
on (a11.enrollment_period_key_c = a12.row_key)
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key)
union
select 'ldb.d_incident_category a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key)
join ldb.d_incident_category a13
on (a12.category_src_key = a13.row_key)
union
select 'ldb.d_incident_close_code a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key)
join ldb.d_incident_close_code a13
on (a12.close_code_src_key = a13.row_key)
union
select 'ldb.d_incident_contacttype a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a13 
on (a11.reported_type_src_key = a13.row_key)
union
select 'ldb.d_incident_impact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a13 
on (a11.impact_src_key = a13.row_key)
union
select 'ldb.d_incident_priority a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key)
join ldb.d_incident_priority a13 
on (a12.priority_src_key = a13.row_key)
union
select 'ldb.d_incident_state a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key)
join ldb.d_incident_state a13
on (a12.state_src_key = a13.row_key)
union
select 'ldb.d_incident_subcategory a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key)
join ldb.d_incident_subcategory a13
on (a12.sub_category_src_key = a13.row_key)
union
select 'ldb.d_incident_urgency a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a13 
on (a11.urgency_src_key = a13.row_key)
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key)
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a12 
on (a11.assigned_to_key = a12.row_key)
union
select 'ldb.d_internal_contact_mdm a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm a13 
on (a12.row_current_key = a13.row_current_key)
union
select 'ldb.d_internal_organization_department a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_organization_department a13 
on (a12.department_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key)
union
select 'ldb.d_internal_organization_legalentity a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a12 
on (a11.company_key = a12.row_key)
union
select 'ldb.d_location a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a12 
on (a11.company_key = a12.row_key)
union
select 'ldb.dh_assignment_group_tier_hierarchy a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_assignment_group_tier_hierarchy a12 
on (a11.assignment_group_key = a12.user_group_tier_key)
union
select 'ldb.dh_assignment_group_type_hierarchy a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_assignment_group_type_hierarchy a12 
on (a11.assignment_group_key = a12.user_group_type_key)





