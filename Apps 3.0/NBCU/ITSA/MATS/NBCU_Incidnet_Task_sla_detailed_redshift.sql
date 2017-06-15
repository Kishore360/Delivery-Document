select 'ldb.f_incident_task_sla a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.dh_user_group_hierarchy a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
union
select 'ldb.d_task_sla a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_task_sla a15 
on (a11.sla_key = a15.row_key) 
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
union
select 'ldb.d_task_sla_stage a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_task_sla_stage a17 
on (a11.stage_src_key = a17.row_key) 
union
select 'ldb.dh_user_group_level1 a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level1 a18 
on (a14.lev_1_key = a18.row_key) 
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_month a19 
on (a12.month_start_date_key = a19.row_key) 
union
select 'ldb.dh_user_group_level2 a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level2 a110 
on (a14.lev_2_key = a110.row_key) 
union
select 'ldb.dh_user_group_level3 a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level3 a111 
on (a14.lev_3_key = a111.row_key) 
union
select 'ldb.dh_user_group_level4 a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level4 a112 
on (a14.lev_4_key = a112.row_key) 
union
select 'ldb.dh_user_group_level5 a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level5 a113 
on (a14.lev_5_key = a113.row_key) 

