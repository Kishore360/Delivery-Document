select 'ldb.f_incident_major_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_pulse_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_pulse_c a14 
on (a11.pulse_c_key = a14.row_key) 
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_key = a15.row_key) 
union
select 'ldb.d_technical_service_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_technical_service_c a16 
on (a11.technical_service_c_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_month a19 
on (a13.month_start_date_key = a19.row_key) 
union
select 'ldb.d_lov_pulse_caused_at_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_lov_pulse_caused_at_c a110 
on (a11.caused_at_src_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact_delivery_manager_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_internal_contact_delivery_manager_c a111 
on (a11.delivery_manager_c_key = a111.row_key) 
union
select 'ldb.d_internal_contact_commander_specialist_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_internal_contact_commander_specialist_c a112 
on (a11.incident_commander_specialist_c_key = a112.row_key) 
union
select 'ldb.d_incident_impact a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_incident_impact a113 
on (a11.impact_src_key = a113.row_key) 
union
select 'ldb.d_incident_priority a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_incident_priority a114 
on (a11.priority_src_key = a114.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_task_sla_resolution_flag a115 
on (a11.met_resolution_sla_flag_key = a115.row_key) 
union
select 'ldb.d_lov_incident_inc_restored_by_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_lov_incident_inc_restored_by_c a116 
on (a11.inc_restored_by_src_c_key = a116.row_key) 
union
select 'ldb.d_incident_urgency a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_incident_urgency a117 
on (a11.urgency_src_key = a117.row_key) 
union
select 'ldb.d_parent_incident a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_parent_incident a118 
on (a11.parent_incident_key = a118.row_key) 
union
select 'ldb.d_lov_incident_tracc_managed_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_major_c a11 
join ldb.d_lov_incident_tracc_managed_c a119 
on (a11.tracc_mim_managed_src_c_key = a119.row_key) 
