select 'ldb.f_task_sla_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_calendar_date a13 
on (a11.start_on_key = a13.row_key) 
union
select 'ldb.d_task_sla_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task_sla_c a14 
on (a11.row_key = a14.sla_row_key) 
union
select 'ldb.d_calendar_week a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_calendar_date a13 
on (a11.start_on_key = a13.row_key) 
join ldb.d_calendar_week a15 
on (a13.week_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_calendar_date a13 
on (a11.start_on_key = a13.row_key) 
join ldb.d_calendar_month a16 
on (a13.month_start_date_key = a16.row_key) 
union
select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_calendar_date a13 
on (a11.start_on_key = a13.row_key) join ldb.d_calendar_month a16 
on (a13.month_start_date_key = a16.row_key) 
join ldb.d_calendar_quarter a17 
on (a16.quarter_start_date_key = a17.row_key) 
union
select 'ldb.d_calendar_year a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_calendar_date a13 
on (a11.start_on_key = a13.row_key) join ldb.d_calendar_month a16 
on (a13.month_start_date_key = a16.row_key) join ldb.d_calendar_quarter a17 
on (a16.quarter_start_date_key = a17.row_key) 
join ldb.d_calendar_year a18 
on (a17.year_start_date_key = a18.row_key) 
union
select 'ldb.d_reported_for_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_reported_for_c a19 
on (a11.reported_for_c_key = a19.row_key) 
union
select 'ldb.d_task_sla a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task_sla a110 
on (a11.sla_key = a110.row_key) 
union
select 'ldb.d_task a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task a111 
on (a11.task_key = a111.row_key) 
union
select 'ldb.d_lov_task_c_state_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_lov_task_c_state_c a112 
on (a11.state_src_key = a112.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_internal_contact_assigned_to a113 
on (a11.assigned_to_key = a113.row_key) 
union
select 'ldb.d_internal_organization_legalentity a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_internal_organization_legalentity a114 
on (a11.company_c_key = a114.row_key) 
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_configuration_item a115 
on (a11.configuration_item_key = a115.row_key) 
union
select 'ldb.d_incident_subcategory a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_incident_subcategory a116 
on (a11.sub_category_src_key = a116.row_key) 
union
select 'ldb.d_incident_type_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_incident_type_c a117 
on (a11.incident_type_c_key = a117.row_key) 
union
select 'ldb.d_lov_incident_first_pass_reason_code_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_lov_incident_first_pass_reason_code_c a118 
on (a11.first_pass_reason_c_key = a118.row_key) 
union
select 'ldb.d_internal_contact a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_internal_contact a119 
on (a11.last_resolved_by_key = a119.row_key) 
union
select 'ldb.d_internal_organization_resolved_by_group_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_internal_organization_resolved_by_group_c a120 
on (a11.resolved_by_group_key = a120.row_key) 
union
select 'ldb.d_task_category_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task_category_c a121 
on (a11.category_src_key = a121.row_key) 
union
select 'ldb.d_task_priority a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task_priority a122 
on (a11.priority_key = a122.row_key) 
union
select 'ldb.d_task_contacttype a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task_contacttype a123 
on (a11.contact_type_c_key = a123.row_key) 
union
select 'ldb.d_lov_task_c_stage_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_lov_task_c_stage_c a124 
on (a11.stage_src_key = a124.row_key) 
union
select 'ldb.d_internal_contact_group_manager_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_contact_group_manager_c a125 
on (a12.manager_c_key = a125.row_key) 
union
select 'ldb.d_internal_organization_business_group_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_reported_for_c a19 
on (a11.reported_for_c_key = a19.row_key) 
join ldb.d_internal_organization_business_group_c a126 
on (a19.business_group_c_key = a126.row_key) 
