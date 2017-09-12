select 'ldb.f_major_incident_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_month a13 
on (a12.month_start_date_key = a13.row_key) 
union
select 'ldb.d_calendar_quarter a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_quarter a14 
on (a12.quarter_start_date_key = a14.row_key) 
union
select 'ldb.d_calendar_week a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_week a15 
on (a12.week_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_year a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_year a16 
on (a12.year_start_date_key = a16.row_key) 
union
select 'ldb.d_major_incident_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
union
select 'ldb.d_major_incident_opened_by_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_major_incident_opened_by_c a18 
on (a17.opened_by_key = a18.row_key) 
union
select 'ldb.d_major_incident_parent_task_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_major_incident_parent_task_c a19 
on (a17.parent_task_key = a19.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_internal_contact_assigned_to a110 
on (a11.assigned_to_key = a110.row_key) 
union
select 'ldb.d_internal_organization_group a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_internal_organization_group a111 
on (a11.assignment_group_key = a111.row_key) 
union
select 'ldb.d_business_unit a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_business_unit a112 
on (a11.business_unit_key = a112.row_key) 
union
select 'ldb.d_internal_organization_legalentity a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_internal_organization_legalentity a113 
on (a11.company_key = a113.row_key) 
union
select 'ldb.d_configuration_item a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_configuration_item a114 
on (a11.configuration_item_key = a114.row_key) 
union
select 'ldb.d_location a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_location a115 
on (a11.location_key = a115.row_key) 
union
select 'ldb.o_data_freshness a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.o_data_freshness a116 
on (a12.source_id = a116.source_id) 
union
select 'ldb.d_lov_major_incident_category_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_category_c a117 
on (a17.category_c_key = a117.row_key) 
union
select 'ldb.d_lov_major_incident_close_code_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_close_code_c a118 
on (a17.close_code_c_key = a118.row_key) 
union
select 'ldb.d_major_incident_closed_by_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_major_incident_closed_by_c a119 
on (a17.closed_by_key = a119.row_key) 
union
select 'ldb.d_lov_major_incident_contacttype_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_contacttype_c a120 
on (a17.contact_type_key = a120.row_key) 
union
select 'ldb.d_lov_major_incident_escalation_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_escalation_c a121 
on (a17.escalation_key = a121.row_key) 
union
select 'ldb.d_lov_major_incident_event_cause_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_event_cause_c a122 
on (a17.event_cause_c_key = a122.row_key) 
union
select 'ldb.d_lov_major_incident_event_type_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_event_type_c a123 
on (a17.event_type_c_key = a123.row_key) 
union
select 'ldb.d_lov_major_incident_impact_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_impact_c a124 
on (a17.impact_key = a124.row_key) 
union
select 'ldb.d_lov_major_incident_sub_cat_action_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_sub_cat_action_c a125 
on (a17.sub_cat_action_c_key = a125.row_key) 
union
select 'ldb.d_lov_major_incident_on_hold_reason_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_on_hold_reason_c a126 
on (a17.on_hold_reason_c_key = a126.row_key) 
union
select 'ldb.d_lov_major_incident_priority_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_priority_c a127 
on (a17.priority_key = a127.row_key) 
union
select 'ldb.d_lov_major_incident_severity_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_severity_c a128 
on (a17.severity_c_key = a128.row_key) 
union
select 'ldb.d_lov_major_incident_state_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_state_c a129 
on (a17.state_key = a129.row_key) 
union
select 'ldb.d_lov_major_incident_sub_category_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_sub_category_c a130 
on (a17.sub_category_c_key = a130.row_key) 
union
select 'ldb.d_lov_major_incident_urgency_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) 
join ldb.d_lov_major_incident_urgency_c a131 
on (a17.urgency_key = a131.row_key) 
union
select 'ldb.d_internal_contact_major_incident_opened_by_manager_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_major_incident_c a11 
join ldb.d_major_incident_c a17 
on (a11.major_incident_c_key = a17.row_key) join ldb.d_major_incident_opened_by_c a18 
on (a17.opened_by_key = a18.row_key) 
join ldb.d_internal_contact_major_incident_opened_by_manager_c a132 
on (a18.manager_key = a132.row_key) 
