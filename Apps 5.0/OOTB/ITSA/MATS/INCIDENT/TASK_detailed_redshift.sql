select 'ldb.f_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_application a12 
on (a11.application_key = a12.row_key)
union
select 'ldb.d_business_service a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_business_service a12 
on (a11.business_service_key = a12.row_key)
union
select 'ldb.d_location a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_location a12 
on (a11.location_key = a12.row_key)
union
select 'ldb.d_parent_task a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a12 on a11.task_key = a12.row_key
join ldb.d_parent_task a13 
on (a12.parent_task_key = a13.row_key)
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_internal_organization_department a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_department a12 
on (a11.opened_by_department_key = a12.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 

union
select 'ldb.d_internal_contact a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_contact a17 
on (a11.assigned_to_key = a17.row_key) 

union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 

union
select 'ldb.d_task a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a19 
on (a11.task_key = a19.row_key) 
union
select 'ldb.d_task_priority a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a12 on a11.task_key=a12.row_key
join ldb.d_task_priority a110 
on (a12.priority_src_key = a110.row_key) 
union
select 'ldb.d_task_state a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a12 on a11.task_key=a12.row_key
join ldb.d_task_state a111 
on (a12.state_src_key = a111.row_key) 
union
select 'ldb.d_task_type a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a12 on a11.task_key=a12.row_key
join ldb.d_task_type a110 
on (a12.task_type_src_key = a110.row_key) 
union
select 'ldb.d_task_urgency a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a12 on a11.task_key=a12.row_key
join ldb.d_task_urgency a111 
on (a12.urgency_src_key = a111.row_key)


union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a112 
on (a14.month_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_week a113 
on (a14.week_start_date_key = a113.row_key) 
union
select 'ldb.d_calendar_quarter a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_quarter a114 
on (a14.quarter_start_date_key = a114.row_key) 
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_year a115 
on (a14.year_start_date_key = a115.row_key) 
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_task             a11
join ldb.d_internal_contact       a113
on (a11.opened_by_key = a113.row_key)
join ldb.d_internal_contact_mdm       a114
on (a113.row_current_key = a114.row_current_key)
union
select 'dh_user_group_hierarchy' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
union
select 'dh_user_group_level1' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level1 a128 
on (a16.lev_1_key = a128.row_key) 
union
select 'dh_user_group_level2' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level2 a132 
on (a16.lev_2_key = a132.row_key) 
union
select 'dh_user_group_level3' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level3 a134 
on (a16.lev_3_key = a134.row_key) 
union
select 'dh_user_group_level4' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level4 a135 
on (a16.lev_4_key = a135.row_key)
union

select 'ldb.d_task_approval a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a12 on a11.task_key=a12.row_key
join ldb.d_task_approval a110 
on (a12.approval_src_key = a110.row_key) 
union
select 'ldb.d_task_closed_by a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a12 on a11.task_key=a12.row_key
join ldb.d_task_closed_by a111 
on (a12.closed_by_key = a111.row_key) 
union
select 'ldb.d_task_contacttype a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a12 on a11.task_key=a12.row_key
join ldb.d_task_contacttype a110 
on (a12.contact_type_src_key = a110.row_key) 
union
select 'ldb.d_task_impact a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a12 on a11.task_key=a12.row_key
join ldb.d_task_impact a111 
on (a12.impact_src_key = a111.row_key)

union
select 'ldb.d_task_opened_by a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a12 on a11.task_key=a12.row_key
join ldb.d_task_opened_by a111 
on (a12.opened_by_key = a111.row_key)