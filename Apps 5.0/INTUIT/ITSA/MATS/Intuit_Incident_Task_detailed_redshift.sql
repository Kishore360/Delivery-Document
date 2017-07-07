select 'ldb.f_incident_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_date_fiscal a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_user_group_classification_hierarchy a16 
on (a11.assignment_group_key = a16.user_group_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level1 a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_user_group_classification_hierarchy a16 
on (a11.assignment_group_key = a16.user_group_key) 
join ldb.dh_user_group_classification_hierarchy_level1 a17 
on (a16.user_group_classification_level1 = a17.user_group_level1_key) 
union
select 'ldb.dh_assignment_group_tier_hierarchy a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_assignment_group_tier_hierarchy a18 
on (a11.assignment_group_key = a18.user_group_tier_key) 
union
select 'ldb.dh_assignment_group_type_hierarchy a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_assignment_group_type_hierarchy a19 
on (a11.assignment_group_key = a19.user_group_type_key) 
union
select 'ldb.d_calendar_date a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
union
select 'ldb.d_incident a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_configuration_item a112 
on (a11.incident_configuration_item_key = a112.row_key) 
union
select 'ldb.d_internal_contact_client_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_client_c a113 
on (a11.client_c_key = a113.row_key) 
union
select 'ldb.d_incident_task_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_task_c a114 
on (a11.incident_task_key = a114.row_key) 
union
select 'ldb.d_internal_organization_group a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_group a115 
on (a11.assignment_group_key = a115.row_key) 
union
select 'ldb.d_internal_organization_group_incident_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_group_incident_c a116 
on (a11.incident_assignment_group_key = a116.row_key) 
union
select 'ldb.d_configuration_item a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_configuration_item a117 
on (a11.business_service_key = a117.row_key) 
union
select 'ldb.d_internal_organization_legalentity a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_legalentity a118 
on (a11.company_key = a118.row_key) 
union
select 'ldb.d_internal_organization_department a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_department a119 
on (a11.opened_by_department_key = a119.row_key) 
union
select 'ldb.d_domain a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_domain a120 
on (a11.domain_key = a120.row_key) 
union
select 'ldb.d_internal_contact_mdm a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a121 
on (a12.row_current_key = a121.row_current_key) 
union
select 'ldb.d_calendar_fiscal_period a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_period a122 
on (a13.period_start_date_key = a122.row_key) 
union
select 'ldb.d_calendar_time_hour a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a123 
on (a14.hour_24_format_num = a123.hour_24_format_num) 
union
select 'ldb.d_incident_close_code_incident_task_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_close_code_incident_task_c a124 
on (a11.close_code_src_key = a124.row_key) 
union
select 'ldb.d_task_contacttype_incident_task_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_task_contacttype_incident_task_c a125 
on (a11.reported_type_src_c_key = a125.row_key) 
union
select 'ldb.d_task_impact_incident_task_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_task_impact_incident_task_c a126 
on (a11.impact_src_key = a126.row_key) 
union
select 'ldb.d_lov_incident_task_pending_code_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_lov_incident_task_pending_code_c a127 
on (a11.pending_code_src_key = a127.row_key) 
union
select 'ldb.d_task_priority_incident_task_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_task_priority_incident_task_c a128 
on (a11.priority_src_key = a128.row_key) 
union
select 'ldb.d_lov_incident_task_state_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_lov_incident_task_state_c a129 
on (a11.state_src_key = a129.row_key) 
union
select 'ldb.d_task_urgency_incident_task_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_task_urgency_incident_task_c a130 
on (a11.urgency_src_key = a130.row_key) 
union
select 'ldb.d_internal_contact_opened_by_key_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_opened_by_key_c a131 
on (a11.opened_by_c_key = a131.row_key) 
union
select 'ldb.d_internal_contact_manager_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
join ldb.d_internal_contact_manager_c a132 
on (a15.manager_key = a132.row_key) 
union
select 'ldb.d_calendar_month a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_month a133 
on (a110.month_start_date_key = a133.row_key) 
union
select 'ldb.d_calendar_week a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_week a134 
on (a110.week_start_date_key = a134.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_quarter a135 
on (a13.quarter_start_date_key = a135.row_key) 
union
select 'ldb.d_internal_contact_client_manager_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_client_c a113 
on (a11.client_c_key = a113.row_key) 
join ldb.d_internal_contact_client_manager_c a136 
on (a113.manager_c_key = a136.row_key) 
union
select 'ldb.d_calendar_quarter a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_quarter a137 
on (a110.quarter_start_date_key = a137.row_key) 
union
select 'ldb.d_calendar_fiscal_year a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_year a138 
on (a13.year_start_date_key = a138.row_key) 
union
select 'ldb.d_calendar_year a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_year a139 
on (a110.year_start_date_key = a139.row_key) 