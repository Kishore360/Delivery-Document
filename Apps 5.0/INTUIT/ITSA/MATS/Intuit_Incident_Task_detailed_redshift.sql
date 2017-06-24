select 'ldb.f_incident_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
union
select 'ldb.d_internal_organization_legalentity a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_legalentity a12 
on (a11.company_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
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
select 'ldb.dh_assignment_group_tier_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_assignment_group_tier_hierarchy a16 
on (a11.assignment_group_key = a16.user_group_tier_key) 
union
select 'ldb.dh_assignment_group_type_hierarchy a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_assignment_group_type_hierarchy a17 
on (a11.assignment_group_key = a17.user_group_type_key) 
union
select 'ldb.d_incident a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_configuration_item a19 
on (a11.incident_configuration_item_key = a19.row_key) 
union
select 'ldb.d_calendar_date a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
union
select 'ldb.d_calendar_greg_fiscal a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_greg_fiscal a111 
on (a11.opened_on_key = a111.gregorian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_greg_fiscal a111 
on (a11.opened_on_key = a111.gregorian_calendar_key) 
join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_calendar_key = a112.row_key) 
union
select 'ldb.d_incident_task_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_task_c a113 
on (a11.incident_task_key = a113.row_key) 
union
select 'ldb.d_internal_organization_group a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_group a114 
on (a11.assignment_group_key = a114.row_key) 
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_configuration_item a115 
on (a11.business_service_key = a115.row_key) 
union
select 'ldb.d_task_contacttype_req_item_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_task_contacttype_incident_task_c a116 
on (a11.reported_type_src_c_key = a116.row_key) 
union
select 'ldb.d_internal_organization_department a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_department a117 
on (a11.opened_by_department_key = a117.row_key) 
union
select 'ldb.d_domain a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_domain a118 
on (a11.domain_key = a118.row_key) 
union
select 'ldb.d_internal_contact_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a119 
on (a13.row_current_key = a119.row_current_key) 
union
select 'ldb.d_calendar_time_hour a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a120 
on (a14.hour_24_format_num = a120.hour_24_format_num) 
union
select 'ldb.d_incident_task_pending_code_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_task_pending_code_c a121 
on (a11.pending_code_src_key = a121.row_key) 
union
select 'ldb.d_incident_task_state_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_task_state_c a122 
on (a11.state_src_key = a122.row_key) 
union
select 'ldb.d_internal_contact_opened_by_key_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_opened_by_key_c a123 
on (a11.opened_by_c_key = a123.row_key) 
union
select 'ldb.d_task_impact a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_task_impact_incident_task_c a124 
on (a11.impact_src_key = a124.row_key) 
union
select 'ldb.d_task_urgency_incident_task_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_task_priority_incident_task_c a125 
on (a11.priority_src_key = a125.row_key) 
union
select 'ldb.d_task_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_task_urgency_incident_task_c a126 
on (a11.urgency_src_key = a126.row_key) 
union
select 'ldb.d_internal_contact_manager_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
join ldb.d_internal_contact_manager_c a127 
on (a15.manager_c_key = a127.row_key) 
union
select 'ldb.d_calendar_fiscal_period a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_greg_fiscal a111 
on (a11.opened_on_key = a111.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_calendar_key = a112.row_key) 
join ldb.d_calendar_fiscal_period a128 
on (a112.period_start_date_key = a128.row_key) 
union
select 'ldb.d_incident_close_code_incident_task_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11
join ldb.d_incident_close_code_incident_task_c a129 
on (a11.close_code_src_key = a129.row_key )
union
select 'ldb.d_calendar_month a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_month a130 
on (a110.month_start_date_key = a130.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_greg_fiscal a111 
on (a11.opened_on_key = a111.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_calendar_key = a112.row_key) 
join ldb.d_calendar_fiscal_quarter a131 
on (a112.quarter_start_date_key = a131.row_key) 
union
select 'ldb.d_calendar_fiscal_year a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_greg_fiscal a111 
on (a11.opened_on_key = a111.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_calendar_key = a112.row_key) 
join ldb.d_calendar_fiscal_year a132 
on (a112.year_start_date_key = a132.row_key)
