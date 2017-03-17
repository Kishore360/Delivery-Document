
select 'ldb.f_incident_task_sla a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_calendar_date a13 
on (a11.last_resolved_on_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.dh_user_group_hierarchy a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
join ldb.dh_user_group_hierarchy a15 
on (a14.row_dn_key = a15.lev_0_key) 
union
select 'ldb.d_incident_lastest_reassignment_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_incident_lastest_reassignment_c a16 
on (a11.incident_key = a16.incident_key) 
union
select 'ldb.d_calendar_date_incident_sla_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_calendar_date_incident_sla_c a17 
on (a11.opened_on_key = a17.row_key) 
union
select 'ldb.d_task_sla a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_task_sla a18 
on (a11.sla_key = a18.row_key) 
union
select 'ldb.d_task_sla_stage a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_task_sla_stage a19 
on (a11.stage_src_key = a19.row_key) 
union
select 'ldb.dh_user_group_level1 a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) join ldb.dh_user_group_hierarchy a15 
on (a14.row_dn_key = a15.lev_0_key) 
join ldb.dh_user_group_level1 a110 
on (a15.lev_1_key = a110.row_key) 
union
select 'ldb.d_internal_contact_sys_grp_mgr_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
join ldb.d_internal_contact_sys_grp_mgr_c a111 
on (a14.manager_key = a111.row_key) 
