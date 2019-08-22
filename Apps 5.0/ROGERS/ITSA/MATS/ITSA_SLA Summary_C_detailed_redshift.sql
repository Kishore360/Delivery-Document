select 'ldb.f_incident_task_sla	a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_task_sla	a11 
union
select 'ldb.d_calendar_date	a12 ' as Table_name, count(1) Row_Count
from ldb.f_incident_task_sla	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_calendar_month	a13 ' as Table_name, count(1) Row_Count
from ldb.f_incident_task_sla	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_month	a13 
on (a12.month_start_date_key = a13.row_key) 
union
select 'ldb.d_task_sla	a20 ' as Table_name, count(1) Row_Count
from ldb.f_incident_task_sla	a11 
join	ldb.d_task_sla	a20 
on (a11.sla_key = a20.row_key) 
union
select 'ldb.d_task_sla_name	a14 ' as Table_name, count(1) Row_Count
from ldb.f_incident_task_sla	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) join	ldb.d_calendar_month	a13 
on (a12.month_start_date_key = a13.row_key) join	ldb.d_task_sla	a20 
on (a11.sla_key = a20.row_key) 
join	ldb.d_task_sla_name	a14 
on (a20.sla_category_key = a14.row_key) 
union
select 'ldb.d_task_sla_stage	a15 ' as Table_name, count(1) Row_Count
from ldb.f_incident_task_sla	a11 
join	ldb.d_task_sla_stage	a15 
on (a11.stage_src_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group	a113 ' as Table_name, count(1) Row_Count
from ldb.f_incident_task_sla	a11 
join	ldb.d_internal_organization_group	a113 
on (a11.assignment_group_key = a113.row_key) 
union
select 'ldb.dh_user_group_hierarchy	a114 ' as Table_name, count(1) Row_Count
from ldb.f_incident_task_sla	a11 
join	ldb.d_internal_organization_group	a113 
on (a11.assignment_group_key = a113.row_key) 
join	ldb.dh_user_group_hierarchy	a114 
on (a113.row_dn_key = a114.lev_0_key) 
union
select 'ldb.dh_user_group_level1	a119 ' as Table_name, count(1) Row_Count
from ldb.f_incident_task_sla	a11 
join	ldb.d_internal_organization_group	a113 
on (a11.assignment_group_key = a113.row_key) join	ldb.dh_user_group_hierarchy	a114 
on (a113.row_dn_key = a114.lev_0_key) 
join	ldb.dh_user_group_level1	a119 
on (a114.lev_1_key = a119.row_key) 